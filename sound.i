# 1 "sound.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "sound.c"
# 1 "sound.h" 1
       

# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 66 "myLib.h"
extern unsigned short *videoBuffer;
# 90 "myLib.h"
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

typedef struct {
    unsigned short fill0[3];
    short a;
    unsigned short fill1[3];
    short b;
    unsigned short fill2[3];
    short c;
    unsigned short fill3[3];
    short d;
} OBJ_AFFINE;



extern OBJ_ATTR shadowOAM[];
extern OBJ_AFFINE* shadowOAMAffine;
# 176 "myLib.h"
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
# 246 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;





void updateInput();
# 265 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 305 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 399 "myLib.h"
typedef struct{
    const unsigned char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} Sound;




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
int max(int a, int b);
int min(int a, int b);
int clamp(int value, int min, int max);
int signOf(int value);
int lerp(int a, int b, int curr, int max);

int roundbase(int value, int base);
# 4 "sound.h" 2

Sound soundA;
Sound soundB;



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void handleSoundVBlank();

void pauseSound();
void unpauseSound();
void stopSound();
# 2 "sound.c" 2

void setupSounds() {
    *(volatile u16 *)0x04000084 = (1<<7);

    *(u16*)0x04000080 = 0;

    *(volatile u16*)0x04000082 = (1<<1)
                    | (1<<2)
                    | (3<<8)
                    | (0<<10)
                    | (1<<11)
                    | (1<<3)
                    | (3<<12)
                    | (1<<14)
                    | (1<<15);
}

void playSoundA(const signed char* sound, int length, int loops) {
    dma[1].cnt = 0;
    DMANow(1, sound, (u16*)0x040000A0, (2 << 21) | (1 << 25) | (3 << 28) | (1 << 26));

    *(volatile unsigned short*)0x4000102 = 0;
    *(volatile unsigned short*)0x4000100 = -((16777216) / 11025);
    *(volatile unsigned short*)0x4000102 = (1<<7);

    soundA.data = sound;
    soundA.length = length;
    soundA.frequency = 11025;
    soundA.isPlaying = 1;
    soundA.loops = loops;
    soundA.duration = (59.727)*length / 11025;
    soundA.vBlankCount = 0;
}

void playSoundB(const signed char* sound, int length, int loops) {
    dma[2].cnt = 0;
    DMANow(2, sound, (u16*)0x040000A4, (2 << 21) | (1 << 25) | (3 << 28) | (1 << 26));

    *(volatile unsigned short*)0x4000106 = 0;
    *(volatile unsigned short*)0x4000104 = -((16777216) / 11025);
    *(volatile unsigned short*)0x4000106 = (1<<7);

    soundB.data = sound;
    soundB.length = length;
    soundB.frequency = 11025;
    soundB.isPlaying = 1;
    soundB.loops = loops;
    soundB.duration = (59.727)*length / 11025;
    soundB.vBlankCount = 0;
}

void handleSoundVBlank() {
    if (soundA.isPlaying) {
        soundA.vBlankCount++;
        if (soundA.vBlankCount > soundA.duration) {
            if (soundA.loops) {
                playSoundA(soundA.data, soundA.length, soundA.loops);
            } else {
                soundA.isPlaying = 0;
                dma[1].cnt = 0;
                *(volatile unsigned short*)0x4000102 = 0;
            }
        }
    }

    if (soundB.isPlaying) {
        soundB.vBlankCount++;
        if (soundB.vBlankCount > soundB.duration) {
            if (soundB.loops) {
                playSoundB(soundB.data, soundB.length, soundB.loops);
            } else {
                soundB.isPlaying = 0;
                dma[2].cnt = 0;
                *(volatile unsigned short*)0x4000106 = 0;
            }
        }
    }
}

void pauseSound() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = 0;
    *(volatile unsigned short*)0x4000106 = 0;
}

void unpauseSound() {
    soundA.isPlaying = 1;
    soundB.isPlaying = 1;
    *(volatile unsigned short*)0x4000102 = (1<<7);
    *(volatile unsigned short*)0x4000106 = (1<<7);
}

void stopSound() {
    soundA.isPlaying = 0;
    soundB.isPlaying = 0;
    *(volatile unsigned short*)0x4000102 = 0;
    *(volatile unsigned short*)0x4000106 = 0;

    dma[1].cnt = 0;
    dma[2].cnt = 0;
}