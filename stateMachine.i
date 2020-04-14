# 1 "stateMachine.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "stateMachine.c"
# 1 "stateMachine.h" 1
       

# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 64 "myLib.h"
extern unsigned short *videoBuffer;
# 88 "myLib.h"
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
# 160 "myLib.h"
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
# 203 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;





void updateInput();
# 222 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 262 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 356 "myLib.h"
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
int lerp(int a, int b, int curr, int max);
# 4 "stateMachine.h" 2


# 1 "map.h" 1
# 22 "map.h"
extern const unsigned short mapTiles[1696];


extern const unsigned short mapMap[8192];


extern const unsigned short mapPal[256];
# 7 "stateMachine.h" 2
# 1 "SplashScreen.h" 1
# 22 "SplashScreen.h"
extern const unsigned short SplashScreen_StartTiles[1696];


extern const unsigned short SplashScreen_StartMap[1024];


extern const unsigned short SplashScreen_InstructionsTiles[1696];


extern const unsigned short SplashScreen_InstructionsMap[1024];


extern const unsigned short SplashScreenPal[256];
# 8 "stateMachine.h" 2
# 1 "InstructionsScreen.h" 1
# 21 "InstructionsScreen.h"
extern const unsigned short InstructionsScreenTiles[1776];


extern const unsigned short InstructionsScreenMap[1024];
# 9 "stateMachine.h" 2
# 1 "PauseScreen_Resume.h" 1
# 22 "PauseScreen_Resume.h"
extern const unsigned short PauseScreen_ResumeTiles[848];


extern const unsigned short PauseScreen_ResumeMap[1024];


extern const unsigned short PauseScreen_ResumePal[256];
# 10 "stateMachine.h" 2
# 1 "PauseScreen_Quit.h" 1
# 21 "PauseScreen_Quit.h"
extern const unsigned short PauseScreen_QuitTiles[848];


extern const unsigned short PauseScreen_QuitMap[1024];
# 11 "stateMachine.h" 2
# 1 "WinScreen.h" 1
# 22 "WinScreen.h"
extern const unsigned short WinScreenTiles[1232];


extern const unsigned short WinScreenMap[1024];


extern const unsigned short WinScreenPal[256];
# 12 "stateMachine.h" 2
# 1 "Spritesheet.h" 1
# 21 "Spritesheet.h"
extern const unsigned short SpritesheetTiles[16384];


extern const unsigned short SpritesheetPal[256];
# 13 "stateMachine.h" 2

# 1 "game.h" 1
       




# 1 "player.h" 1
       


# 1 "mapCollision.h" 1
# 20 "mapCollision.h"
extern const unsigned short mapCollisionBitmap[524288];
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
# 1 "camera.h" 1
       






typedef struct {
    int row;
    int col;
} Camera;

extern Camera camera;

void cameraDebug();
void initCamera();
void updateCamer();
# 8 "game.h" 2
# 1 "item.h" 1
       
# 11 "item.h"
typedef enum {
    BOOTS
} ItemType;

typedef struct {
    int screenRow;
    int screenCol;
    int worldRow;
    int worldCol;
    int width;
    int height;
    int curFrame;
    int numFrames;
    int hide;

    u16 color1;
    u16 color2;
} Item;

extern Item boots;

void initItem(Item* item, int col, int row);

void updateItem(Item* item);
void showItem(Item* item);
# 9 "game.h" 2




extern int debug;

void init();
void update();

void initGame();
void resumeGame();
void updateGame();



void handleVBlank();
void setupDisplayInterrupt();
void interruptHandler();
# 15 "stateMachine.h" 2

typedef enum {
    SPLASH, INSTRUCTIONS, GAME, PAUSED, WIN
} GameState;

typedef enum {
    OPTSTART, OPTINST, OPTRESUME, OPTQUIT
} MenuState;

extern GameState gameState;
extern MenuState menuState;

void initSplash();
void initInstructions();
void initPause();
void initWin();

void updateSplash();
void updateInstructions();
void updatePause();
void updateWin();
# 2 "stateMachine.c" 2

void initSplash() {
    gameState = SPLASH;
    menuState = OPTSTART;

    (*(unsigned short *)0x4000000) |= (1<<8);
    (*(volatile unsigned short*)0x4000008) = (0<<7) | (0<<14) | ((0)<<2) | ((28)<<8);
    DMANow(3, SplashScreen_StartTiles, &((charblock *)0x6000000)[0], 3392/2);
    DMANow(3, SplashScreen_StartMap, &((screenblock *)0x6000000)[28], 2048/2);
    DMANow(3, SplashScreenPal, ((unsigned short *)0x5000000), 512/2);
}

void initInstructions() {
    gameState = INSTRUCTIONS;
    DMANow(3, InstructionsScreenTiles, &((charblock *)0x6000000)[0], 3552/2);
    DMANow(3, InstructionsScreenMap, &((screenblock *)0x6000000)[28], 2048/2);
}



void initPause() {
    gameState = PAUSED;
    menuState = OPTRESUME;
    (*(unsigned short *)0x4000000) &= ~(1<<12);
    (*(volatile unsigned short*)0x4000008) = (0<<7) | (0<<14) | ((0)<<2) | ((28)<<8);


    DMANow(3, PauseScreen_ResumeTiles, &((charblock *)0x6000000)[0], 1696/2);
    DMANow(3, PauseScreen_ResumeMap, &((screenblock *)0x6000000)[28], 2048/2);
    DMANow(3, PauseScreen_ResumePal, ((unsigned short *)0x5000000), 512/2);

}

void initWin() {
    gameState = WIN;
    (*(unsigned short *)0x4000000) &= ~(1<<12);
    (*(volatile unsigned short*)0x4000008) = (0<<7) | (0<<14) | ((0)<<2) | ((28)<<8);

    DMANow(3, WinScreenTiles, &((charblock *)0x6000000)[0], 2464/2);
    DMANow(3, WinScreenMap, &((screenblock *)0x6000000)[28], 2048/2);
    DMANow(3, WinScreenPal, ((unsigned short *)0x5000000), 512/2);
}

void updateSplash() {
    if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7)))) && (menuState == OPTSTART)) {
        menuState = OPTINST;
        DMANow(3, SplashScreen_InstructionsTiles, &((charblock *)0x6000000)[0], 3392/2);
        DMANow(3, SplashScreen_InstructionsMap, &((screenblock *)0x6000000)[28], 2048/2);
    }

    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && (menuState == OPTINST)) {
        menuState = OPTSTART;
        DMANow(3, SplashScreen_StartTiles, &((charblock *)0x6000000)[0], 3392/2);
        DMANow(3, SplashScreen_StartMap, &((screenblock *)0x6000000)[28], 2048/2);
    }

    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        switch (menuState) {
            case OPTSTART:
                initGame();
                break;
            case OPTINST:
                initInstructions();
                break;
        }
    }
}

void updateInstructions() {
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        initSplash();
    }
}

void updatePause() {
    if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7)))) && (menuState == OPTRESUME)) {
        menuState = OPTQUIT;
        DMANow(3, PauseScreen_QuitTiles, &((charblock *)0x6000000)[0], 1696/2);
        DMANow(3, PauseScreen_QuitMap, &((screenblock *)0x6000000)[28], 2048/2);
    }

    if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6)))) && (menuState == OPTQUIT)) {
        menuState = OPTRESUME;
        DMANow(3, PauseScreen_ResumeTiles, &((charblock *)0x6000000)[0], 1696/2);
        DMANow(3, PauseScreen_ResumeMap, &((screenblock *)0x6000000)[28], 2048/2);
    }

    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        switch (menuState) {
            case OPTRESUME:
                resumeGame();
                break;
            case OPTQUIT:
                initSplash();
                break;
        }
    }
}

void updateWin() {
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        initSplash();
    }
}