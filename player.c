#include "player.h"

Player player;

void initPlayer() {
    player.worldRow = ENCODE8(487 - 16);
    player.worldCol = 0;
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;
    player.rdel = 0;
    player.cdel = 0;
    player.width = ENCODE8(8);
    player.height = ENCODE8(16);
    player.hide = 0;

    player.raccel = 0;
    player.caccel = 0;

    player.accelCurve = 64;
    player.decelCurve = 128;
    player.maxSpeed = 256;
    player.maxJump = 128;
    player.terminalVel = -5;

    player.direction = 0;
    
    shadowOAM[0].attr0 = DECODE8(player.screenRow) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[0].attr1 = DECODE8(player.screenCol) | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
}

void updatePlayer() {
    if (!debug) {    
        handlePlayerInput();
    }
    //update player velocity
    player.rdel = clamp(player.rdel + player.raccel, player.terminalVel, player.maxJump);
    player.cdel = clamp(player.cdel + player.caccel, -player.maxSpeed, player.maxSpeed);

    //update player's world and screen positions
    if ((noCollisionLeft() && player.cdel < 0)
        || (noCollisionRight() && player.cdel > 0)) {

            player.worldCol = clamp(player.worldCol + player.cdel, 0, ENCODE8(MAPWH) - player.width);
            adjusthOff();
    } else {
        player.cdel = 0;
        player.caccel = 0;
    }
    player.worldRow = clamp(player.worldRow + player.rdel, 0, ENCODE8(MAPWH) - player.height);
    
    player.screenRow = player.worldRow - vOff;
    player.screenCol = player.worldCol - hOff;

    shadowOAM[0].attr0 = DECODE8(player.screenRow) | ATTR0_REGULAR | ATTR0_4BPP | ATTR0_TALL;
    shadowOAM[0].attr1 = DECODE8(player.screenCol) | ATTR1_TINY;
    shadowOAM[0].attr2 = ATTR2_TILEID(0, 0) | ATTR2_PALROW(0);
    
    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
    }
}

void handlePlayerInput() {
    if (!BUTTON_HELD(BUTTON_LEFT) && !BUTTON_HELD(BUTTON_RIGHT)) {

        if (signOf(player.direction) == signOf(player.cdel)) {
            //implement friction
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
            if (player.worldCol < ENCODE8(MAPWH) - player.width) {
                player.caccel = player.accelCurve;
            }
        }
    }

}

int playerInAir() {

}

int noCollisionLeft() {
    return player.worldCol > 0
        && mapCollisionBitmap[OFFSET(DECODE8(player.worldCol + player.cdel), DECODE8(player.worldRow), MAPWH)]
        && mapCollisionBitmap[OFFSET(DECODE8(player.worldCol + player.cdel), DECODE8(player.worldRow + player.height - 1), MAPWH)];
}

int noCollisionRight() {
    return player.worldCol + player.width < ENCODE8(MAPWH)
        && mapCollisionBitmap[OFFSET(DECODE8(player.worldCol + player.cdel + player.width - 1), DECODE8(player.worldRow), MAPWH)]
        && mapCollisionBitmap[OFFSET(DECODE8(player.worldCol + player.cdel + player.width - 1), DECODE8(player.worldRow + player.height - 1), MAPWH)];
}

void adjusthOff() {
    if (player.cdel < 0) {
        if ((hOff > 0) && (player.screenCol + player.width / 2 < ENCODE8(SCREENWIDTH / 2))) {
            hOff = max(hOff + player.cdel, 0);
        }
    } else if (player.cdel > 0) {
        if ((hOff + ENCODE8(SCREENWIDTH - 1) < ENCODE8(MAPWH)) && (player.screenCol + player.width / 2 > ENCODE8(SCREENWIDTH / 2))) {
            hOff = min(hOff + player.cdel, ENCODE8(MAPWH - SCREENWIDTH));
        }
    }
}

void adjustvOff() {
    if (player.rdel < 0) {
        if ((vOff > 0) && (player.screenRow + player.height / 2 < ENCODE8(SCREENHEIGHT / 2))) {
            hOff += player.cdel;
        }
    } else if (player.rdel > 0) {
        if ((vOff + ENCODE8(SCREENWIDTH - 1) < ENCODE8(MAPWH)) && (player.screenRow + player.height / 2 > ENCODE8(SCREENHEIGHT / 2))) {
            vOff += player.rdel;
        }
    }
}