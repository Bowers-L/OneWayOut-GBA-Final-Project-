#include "player.h"

Player player;

void initPlayer() {
    player.worldRow = ENCODE4(MAPWH - 56) - player.height;
    player.worldCol = ENCODE4(30);
    player.screenRow = player.worldRow - camera.row;
    player.screenCol = player.worldCol - camera.col;
    player.rdel = 0;
    player.cdel = 0;
    player.width = ENCODE4(8);
    player.height = ENCODE4(16);
    player.hide = 0;

    player.raccel = 0;
    player.caccel = 0;

    player.accelCurve = 4;
    player.decelCurve = 8;
    player.maxSpeed = 16;
    player.terminalVel = 64;

    //Note: Normal jump speed: 512, High jump speed: ~700
    player.isJumping = 0;
    player.jumpHeight = 512;
    player.jumpTime = 16;
    
    player.gravity = (2 * player.jumpHeight) / (player.jumpTime * player.jumpTime);
    player.jumpSpeed = player.gravity * player.jumpTime;

    player.direction = 0;

    player.currentItem = 0;
    player.shrunk = 0;
    player.canWallJump = 0;
    
    shadowOAM[0].attr0 = DECODE4(player.screenRow) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[0].attr1 = DECODE4(player.screenCol) | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
}

void updatePlayer() {
    handlePlayerInput();

    //simulate gravity
    if (touchingGround()) {
        player.raccel = 0;
    } else {
        player.raccel = player.gravity;
    }

    //update player velocity
    player.rdel = clamp(player.rdel + player.raccel, -player.jumpSpeed, player.terminalVel);
    player.cdel = clamp(player.cdel + player.caccel, -player.maxSpeed, player.maxSpeed);

    //update player's world and screen positions
    player.worldCol = clamp(player.worldCol + player.cdel, 0, ENCODE4(MAPWH) - player.width);
    player.worldRow = clamp(player.worldRow + player.rdel, -64, ENCODE4(MAPWH) - player.height);
    resolveCollisions();

}

void showPlayer() {
    //adjust screen coordinates to match world coordinates
    player.screenRow = player.worldRow - camera.row;
    player.screenCol = player.worldCol - camera.col;

    if ((player.screenRow < -player.height) || (player.screenRow > ENCODE4(SCREENHEIGHT - 1))
        || (player.screenCol < -player.width) || (player.screenCol > ENCODE4(SCREENWIDTH - 1))) {
        player.hide = 1;
    } else {
        player.hide = 0;
    }
    
    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    }
    if (player.shrunk) {
        shadowOAM[0].attr0 = (DECODE4(player.screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[0].attr1 = (DECODE4(player.screenCol) & COLMASK) | ATTR1_TINY;
        shadowOAM[0].attr2 = ATTR2_TILEID(1, 0) | ATTR2_PALROW(0);
    } else {
        shadowOAM[0].attr0 = (DECODE4(player.screenRow) & ROWMASK) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
        shadowOAM[0].attr1 = (DECODE4(player.screenCol) & COLMASK) | ATTR1_TINY;
        shadowOAM[0].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
    }
}


void handlePlayerInput() {
    if (!BUTTON_HELD(BUTTON_LEFT) && !BUTTON_HELD(BUTTON_RIGHT)) {

        if (signOf(player.direction) == signOf(player.cdel)) {
            //implement friction to slow down player
            player.caccel = -1 * signOf(player.direction) * player.decelCurve;
        } else {
            player.cdel = 0;
            player.caccel = 0;
        }
    } else {
        if (BUTTON_HELD(BUTTON_LEFT)) {
            player.direction = -1;
            if (player.worldCol > 0) {
                player.caccel = -player.accelCurve;
            }
        }
        if (BUTTON_HELD(BUTTON_RIGHT)) {
            player.direction = 1;
            if (player.worldCol < ENCODE4(MAPWH) - player.width) {
                player.caccel = player.accelCurve;
            }
        }
    }

    //Jumping

    if (BUTTON_PRESSED(BUTTON_A)) {
        if (touchingGround()
        || (player.canWallJump && (collisionLeft(2) || collisionRight(2)))
         ) {
            player.isJumping = 1;
            player.rdel = -player.jumpSpeed;
        }
    }

    if (!BUTTON_HELD(BUTTON_A)) {
        if (player.isJumping) {
            player.rdel = 0;
            player.isJumping = 0;
        }
    }

    //Items

    if (BUTTON_PRESSED(BUTTON_B)) {
        useItem(playerInventory[player.currentItem]);
    }

    if (BUTTON_PRESSED(BUTTON_L)) {
        if (player.currentItem > 0 && playerInventory[player.currentItem-1] != NONE) {
            player.currentItem--;
        }
    }

    if (BUTTON_PRESSED(BUTTON_R)) {
        if (player.currentItem < NUMITEMS - 1 && playerInventory[player.currentItem+1] != NONE) {
            player.currentItem++;
        }
    }
}

/*
* * * * * * * *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
*             *
* * * * * * * *
*/

int collisionLeft(int offset) {
    return player.worldCol < 0
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol) - offset, DECODE4(player.worldRow) , MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol) - offset, DECODE4(player.worldRow + player.height) - 1, MAPWH)];
}

int collisionRight(int offset) {
    return player.worldCol + player.width >= ENCODE4(MAPWH)
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width) + offset, DECODE4(player.worldRow), MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width) + offset, DECODE4(player.worldRow + player.height) - 1, MAPWH)];
}

int collisionAbove(int offset) {
    return mapCollisionBitmap[OFFSET(DECODE4(player.worldCol), DECODE4(player.worldRow) - offset, MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width) - 1, DECODE4(player.worldRow) - offset, MAPWH)];
}

int collisionBelow(int offset) {
    return player.worldRow + player.height >= ENCODE4(MAPWH)
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol), DECODE4(player.worldRow + player.height) - 1 + offset, MAPWH)]
        || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width) - 1, DECODE4(player.worldRow + player.height) - 1 + offset, MAPWH)];
}

int touchingGround() {
    return mapCollisionBitmap[OFFSET(DECODE4(player.worldCol), DECODE4(player.worldRow + player.height), MAPWH)]
    || mapCollisionBitmap[OFFSET(DECODE4(player.worldCol + player.width) - 1, DECODE4(player.worldRow + player.height), MAPWH)];
}

/*
Collisions: 
The current method of handling collisions waits until the player's position conflicts with an occupied
pixel in the collision map and resolves it by pushing the player in the direction that results in the shortest
distance traveled for there not to be a collision. 

The main arguable downside is a rounding effect on corners of overhead platforms where the 
player clips to the left or right edge rather than being stopped by the corner.

Update:
-less off by one errors
-bug with corners when moving down (player teleporting to other side of platform)
-rounded off corners to make these less frequent
*/
int resolveCollisions() {
    int xDepth = 0;
    int yDepth = 0;

    //so don't have to recalculate these
    int collisionOnLeft = 0;
    int collisionOnAbove = 0;

    int step = 2;

    if (collisionLeft(0)) {
        collisionOnLeft = 1;
        while (collisionLeft(0)) {
            player.worldCol += step;
            xDepth++;
        }
        player.worldCol -= xDepth * step;
    } else {
        while (collisionRight(0)) {
            player.worldCol-= step;
            xDepth++;
        }
        player.worldCol += xDepth * step;
    }

    if (collisionAbove(0)) {
        collisionOnAbove = 1;
        while (collisionAbove(0)) {
            player.worldRow += step;
            yDepth++;
        }
        player.worldRow -= yDepth * step;
    } else {
        while (collisionBelow(0)) {
            player.worldRow-= step;
            yDepth++;
        }
        player.worldRow += yDepth * step;
    }

    if (xDepth <= yDepth) {
        if (xDepth != 0) {
            player.cdel = 0;
        }
        if (collisionOnLeft) {
            player.worldCol += xDepth * step;
        } else {
            player.worldCol -= xDepth * step;
        }
        //round the position to a multiple of 16 (need to this or else off by one errors occur on right side collisions)
        player.worldCol = roundbase(player.worldCol, 16);
    } else {
        if (yDepth != 0) {
            player.rdel = 0;
        }
        if (collisionOnAbove) {
            player.worldRow += yDepth * step;
        } else {
            player.worldRow -= yDepth * step;
        }
        //round the position to a multiple of 16 (need to this or else off by one errors occur when collision is below)
    }
}

void equipBoots() {
    if (player.jumpHeight == 1024) {
        player.jumpHeight = 512;
    } else {
        player.jumpHeight = 1024;
    }


    player.gravity = (2 * player.jumpHeight) / (player.jumpTime * player.jumpTime);
    player.jumpSpeed = player.gravity * player.jumpTime;
}

void shrinkPlayer() {
    if (player.shrunk) {
        if (!collisionAbove(8)) {
            player.shrunk = 0;
            player.height = ENCODE4(16);
            player.worldRow -= ENCODE4(8);
        } 
    } else {
        player.shrunk = 1;
        player.height = ENCODE4(8);
    }
}

void equipLegs() {
    if (player.maxSpeed == 16) {
        player.maxSpeed = 64;
    } else {
        player.maxSpeed = 16;
    }
}

void equipGloves() {
    if (player.canWallJump) {
        player.canWallJump = 0;
    } else {
        player.canWallJump = 1;
    }
}