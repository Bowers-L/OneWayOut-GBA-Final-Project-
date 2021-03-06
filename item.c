#include "item.h"

Item items[NUMITEMS];

ItemType playerInventory[NUMITEMS];

void initAllItems(int cheat) {
    for (int i = 0; i < NUMITEMS; i++) {
        items[i].active = 0;
        playerInventory[i] = NONE;
    }

    initItem(&items[0], MAPWH - 24, MAPWH - 24, BOOTS);
    initItem(&items[1], 624, 904, SHRINK);
    initItem(&items[2], 24, 808, SPEED);
    initItem(&items[3], 1008, 800, GLOVES);
    initItem(&items[4], 224, 712, Z);

    if (cheat) {
        initItem(&items[5], 8, 992, GRAVITY);
    }
}

void initItem(Item* item, int col, int row, ItemType type) {
    static int itemCount = 0;
    itemCount++;
    if (itemCount > NUMITEMS) {
        itemCount = 1;
    }

    item->worldRow = ENCODE4(row);
    item->worldCol = ENCODE4(col);
    item->screenRow = item->worldRow - camera.row;
    item->screenCol = item->worldCol - camera.col;
    item->width = ENCODE4(8);
    item->height = ENCODE4(8);
    item->curFrame = 0;
    item->numFrames = 60;
    item->hide = 1;
    item->active = 1;

    item->color1 = COLOR(16, 16, 16);
    item->color2 = COLOR(27, 27, 0);

    item->type = type;
    item->index = itemCount;

    shadowOAM[item->index].attr0 = (DECODE4(item->screenRow) & ROWMASK) | ATTR0_HIDE | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[item->index].attr1 = (DECODE4(item->screenCol) & COLMASK) | ATTR1_TINY;
    shadowOAM[item->index].attr2 = ATTR2_TILEID(0, 8) | ATTR2_PALROW(0);
}

void updateAllItems() {
    for (int i = 0; i < NUMITEMS; i++) {
        if (items[i].active) {
            updateItem(&items[i]);
        }
    }
}

void updateItem(Item* item) {
    //item animates so that it swaps between two colors
    if (item->curFrame > item->numFrames / 2) {
        SPRITEPALETTE[2] = COLOR(lerp(27, 16, item->curFrame, item->numFrames / 2),
                                lerp(27, 16, item->curFrame, item->numFrames / 2),
                                0
                                );
    } else {
        SPRITEPALETTE[2] = COLOR(lerp(16, 27, item->curFrame, item->numFrames / 2),
                                lerp(16, 27, item->curFrame, item->numFrames / 2),
                                lerp(16, 0, item->curFrame, item->numFrames / 2)
                                );
    }

    
    item->curFrame++;
    if (item->curFrame > item->numFrames) {
        item->curFrame = 0;
    }

    if (item->hide == 0 && checkCollisionPlayer(item)) {
        getItem(item);
    }
}

int checkCollisionPlayer(Item* item) {
    return collision(player.worldCol, player.worldRow, player.width, player.height, item->worldCol, item->worldRow, item->width, item->height);
}

void showAllItems() {
    for (int i = 0; i < NUMITEMS; i++) {
        if (items[i].active) {
            showItem(&items[i]);
        }
    }
}

void showItem(Item* item) {
    item->screenRow = item->worldRow - camera.row;
    item->screenCol = item->worldCol - camera.col;

    //determine whether to hide sprite
    if ((item->screenRow < -item->height) || (item->screenRow > ENCODE4(SCREENHEIGHT - 1))
        || (item->screenCol < -item->width) || (item->screenCol > ENCODE4(SCREENWIDTH - 1))) {
        item->hide = 1;
    } else {
        item->hide = 0;
    }

    //set the OAM
    shadowOAM[item->index].attr0 = (DECODE4(item->screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[item->index].attr1 = (DECODE4(item->screenCol) & COLMASK) | ATTR1_TINY;
    shadowOAM[item->index].attr2 = ATTR2_TILEID(0, 8) | ATTR2_PALROW(0);
    
    if (item->hide) {
        shadowOAM[item->index].attr0 |= ATTR0_HIDE;
    }
}

void getItem(Item* item) {
    item->active = 0;
    item->hide = 1;

    
    int i = 0;
    while (playerInventory[i] != NONE) {
        i++;
    }
    playerInventory[i] = item->type;

    shadowOAM[item->index].attr0 = (ITEMSLOTROW & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[item->index].attr1 = ((ITEMSLOTCOL + i*ITEMSLOTSPACING) & COLMASK) | ATTR1_SMALL;
    shadowOAM[item->index].attr2 = ATTR2_TILEID(1 + (item->type-1)*2, 8) | ATTR2_PALROW(0);

    if (i == 0) {
        //the first item
        showSelectorOnItem(player.currentItem);
    }
    if (item->type == Z) {
        playSoundA(mus_game2, MUS_GAME2LEN, 1);
    }
}

void useItem(ItemType item) {
    switch (item) {
        case NONE:
            break;
        case BOOTS:
            equipBoots();
            break;
        case SHRINK:
            shrinkPlayer();
            break;
        case SPEED:
            equipLegs();
            break;
        case GLOVES:
            equipGloves();
            break;
        case Z:
            startLaserSling();
            break;
        case GRAVITY:
            reverseGravity();
            break;
    }
}

void showSelectorOnItem() {
    shadowOAM[120].attr0 = (ITEMSLOTROW & COLMASK) | ATTR0_4BPP | ATTR0_REGULAR | ATTR0_SQUARE;
    shadowOAM[120].attr1 = ((ITEMSLOTCOL + player.currentItem*ITEMSLOTSPACING) & COLMASK) | ATTR1_SMALL;
    shadowOAM[120].attr2 = ATTR2_TILEID(1, 10);
}