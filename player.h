#pragma once

#include "myLib.h"
#include "mapCollision.h"
#include "game.h"
#include "item.h"
#include "laser.h"

//sounds
#include "sound.h"
#include "snd_Ding.h"
#include "snd_Zap.h"

#include <stdlib.h>
#include <math.h>

#define PI (3.14159265)

typedef enum {
    GETUP = 1, LASER
} SpecialAnim;

typedef enum {
    IDLE, RIGHT, LEFT, SPEEDRIGHT, SPEEDLEFT
} AniState;

#define NUMSTATES 5

typedef struct {
    //animated sprite stuff
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    AniState aniState;
    int curFrame;
    int numFrames;
    int aniSpeed;
    int isIdle;
    int hide;

    //acceleration
    int raccel;
    int caccel;

    //platforming factors
    int accelCurve;
    int decelCurve;
    int maxSpeed;
    int hardSpeedCap;
    int terminalVel;

    //jumping
    int isJumping;
    int jumpHeight;
    int jumpTime;
    int jumpSpeed;
    int gravity;

    int direction;

    //items
    int currentItem;
    int shrunk;
    int canWallJump;

    //transformation stuff
    int rotation;

    //misc
    SpecialAnim specialAnim;
} Player;

//Player: OAM 0
extern Player player;

extern short sinLut[];

void initPlayer();
void updatePlayer();
void showPlayer();

void handlePlayerInput();

//collisions
int collisionLeft();
int collisionRight();
int collisionAbove();
int collisionBelow();
int touchingGround();
int resolveCollisions();

//item stuff
void equipBoots();
void shrinkPlayer();
void equipLegs();
void equipGloves();
void startLaserSling();
void finishLaserSling();
void reverseGravity();

//affine transformations
void setTransform(int index, short scalex, short scaley, int deg);
void generateSinLut(short table[], size_t size);

void getUpAnimation();
void laserSlingAnimation();