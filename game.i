# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
       

# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 85 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();





typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 157 "myLib.h"
void hideSprites();






typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;
} ANISPRITE;
# 200 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;





void updateInput();
# 219 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 259 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 353 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
int max(int a, int b);
int min(int a, int b);
int clamp(int value, int min, int max);
int signOf(int value);
# 4 "game.h" 2
# 1 "Spritesheet.h" 1
# 21 "Spritesheet.h"
extern const unsigned short SpritesheetTiles[16384];


extern const unsigned short SpritesheetPal[256];
# 5 "game.h" 2
# 1 "map.h" 1
# 22 "map.h"
extern const unsigned short mapTiles[160];


extern const unsigned short mapMap[4096];


extern const unsigned short mapPal[256];
# 6 "game.h" 2
# 1 "player.h" 1
       


# 1 "mapCollision.h" 1
# 20 "mapCollision.h"
extern const unsigned short mapCollisionBitmap[262144];
# 5 "player.h" 2


typedef enum {
    LEFT, RIGHT
} PlayerState;

typedef struct {

    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int hide;


    int raccel;
    int caccel;


    int accelCurve;
    int decelCurve;
    int maxSpeed;
    int terminalVel;


    int isJumping;
    int jumpHeight;
    int jumpTime;
    int jumpSpeed;
    int gravity;

    int direction;
} Player;

extern Player player;
extern const int playerMaxSpeed;

void initPlayer();
void updatePlayer();
void showPlayer();

void handlePlayerInput();

void adjusthOff();
void adjustvOff();

int collisionLeft();
int collisionRight();
int collisionAbove();
int collisionBelow();

int resolveCollisionX();
int resolveCollisionY();
# 7 "game.h" 2



typedef enum {
    START, GAME, PAUSED
} GameState;

typedef enum {
    TITLE
} MenuState;

extern GameState gameState;
extern int hOff;
extern int vOff;


extern int debug;

void init();

void initStart();
void initGame();
void initPause();
void setupBackground();

void update();

void updateStart();
void updateGame();
void updatePause();


void handleVBlank();
void setupInterrupts();
void interruptHandler();
# 2 "game.c" 2

GameState gameState;
int hOff;
int vOff;

int debug;

void init() {
    (*(unsigned short *)0x4000000) = 0;
    initGame();
    setupInterrupts();
}

void initGame() {

    gameState = GAME;
    hOff = 0;
    vOff = ((512 - 160) << 4);
    debug = 0;


    (*(unsigned short *)0x4000000) |= (1<<8);
    (*(volatile unsigned short*)0x4000008) = (0<<7) | (3<<14) | ((0)<<2) | ((28)<<8);
    DMANow(3, mapTiles, &((charblock *)0x6000000)[0], 320 / 2);
    DMANow(3, mapMap, &((screenblock *)0x6000000)[28], 8192 / 2);
    DMANow(3, mapPal, ((unsigned short *)0x5000000), 512 / 2);


    (*(unsigned short *)0x4000000) |= (1<<12);
    hideSprites();
    DMANow(3, SpritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
    DMANow(3, SpritesheetPal, ((unsigned short *)0x5000200), 512 / 2);

    initPlayer();
}

void update() {
    updateInput();
    switch (gameState) {
        case START:
            updateStart();
            break;
        case GAME:
            updateGame();
            break;
        case PAUSED:
            updatePause();
            break;
    }
    waitForVBlank();
}

void updateStart() {

}

void updateGame() {
    if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
        if (debug > 0) {
            debug = 0;
        } else {
            debug = 1;
        }
    }

    if (debug) {
        cameraDebug();
        showPlayer();
    } else {
        updatePlayer();
    }
}



void updatePause() {

}

void cameraDebug() {
    static int cameraSpeed = 32;

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6)))) {
        if (vOff > 0) {
            vOff = max(vOff - cameraSpeed, 0);
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7)))) {
        if (vOff < ((512 - 160) << 4)) {
            vOff = min(vOff + cameraSpeed, ((512 - 160) << 4));
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
        if (hOff > 0) {
            hOff = max(hOff - cameraSpeed, 0);
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
        if (hOff < ((512 - 240) << 4)) {
            hOff = min(hOff + cameraSpeed, ((512 - 240) << 4));
        }
    }
}

void handleVBlank() {
    (*(volatile unsigned short *)0x04000010) = ((hOff) >> 4);
    (*(volatile unsigned short *)0x04000012) = ((vOff) >> 4);
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128 * 4);
}

void setupInterrupts() {
    *(unsigned short*)0x4000208 = 0;
    *(unsigned int*)0x3007FFC = interruptHandler;


    *(unsigned short*)0x4000200 |= 1 << 0;
    *(unsigned short*)0x4000004 |= 1 << 3;

    *(unsigned short*)0x4000208 = 1;
}


void interruptHandler() {
    *(unsigned short*)0x4000208 = 0;

    if (*(volatile unsigned short*)0x4000202 & 1 << 0) {
        handleVBlank();
    }

    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;

    *(unsigned short*)0x4000208 = 1;
}
