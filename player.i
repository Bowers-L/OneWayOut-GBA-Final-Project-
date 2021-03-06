# 1 "player.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "player.c"
# 1 "player.h" 1
       

# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 67 "myLib.h"
extern unsigned short *videoBuffer;
# 91 "myLib.h"
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
# 177 "myLib.h"
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
# 254 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;





void updateInput();
# 273 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 313 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);
# 407 "myLib.h"
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
# 4 "player.h" 2
# 1 "mapCollision.h" 1
# 20 "mapCollision.h"
extern const unsigned short mapCollisionBitmap[1048576];
# 5 "player.h" 2
# 1 "game.h" 1
       



# 1 "stateMachine.h" 1
       




# 1 "map.h" 1
# 21 "map.h"
extern const unsigned short mapTiles[192];


extern const unsigned short mapMap[16384];
# 7 "stateMachine.h" 2
# 1 "SplashScreen.h" 1
# 22 "SplashScreen.h"
extern const unsigned short SplashScreen_StartTiles[1696];


extern const unsigned short SplashScreen_StartMap[1024];


extern const unsigned short SplashScreen_InstructionsTiles[1696];


extern const unsigned short SplashScreen_InstructionsMap[1024];


extern const unsigned short SplashScreenPal[256];
# 8 "stateMachine.h" 2
# 1 "SplashBack.h" 1
# 22 "SplashBack.h"
extern const unsigned short SplashBackTiles[288];


extern const unsigned short SplashBackMap[1024];


extern const unsigned short SplashBackPal[256];
# 9 "stateMachine.h" 2
# 1 "InstructionsScreen.h" 1
# 22 "InstructionsScreen.h"
extern const unsigned short InstructionsScreenTiles[2176];


extern const unsigned short InstructionsScreenMap[1024];


extern const unsigned short InstructionsScreenPal[256];
# 10 "stateMachine.h" 2
# 1 "PauseScreen_Resume.h" 1
# 21 "PauseScreen_Resume.h"
extern const unsigned short PauseScreen_ResumeTiles[848];


extern const unsigned short PauseScreen_ResumeMap[1024];
# 11 "stateMachine.h" 2
# 1 "PauseScreen_Quit.h" 1
# 21 "PauseScreen_Quit.h"
extern const unsigned short PauseScreen_QuitTiles[848];


extern const unsigned short PauseScreen_QuitMap[1024];
# 12 "stateMachine.h" 2
# 1 "WinScreen.h" 1
# 22 "WinScreen.h"
extern const unsigned short WinScreenTiles[1232];


extern const unsigned short WinScreenMap[1024];


extern const unsigned short WinScreenPal[256];
# 13 "stateMachine.h" 2
# 1 "Spritesheet.h" 1
# 21 "Spritesheet.h"
extern const unsigned short SpritesheetTiles[16384];


extern const unsigned short SpritesheetPal[256];
# 14 "stateMachine.h" 2





# 1 "sound.h" 1
       



Sound soundA;
Sound soundB;



void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void handleSoundVBlank();

void pauseSound();
void unpauseSound();
void stopSound();
# 20 "stateMachine.h" 2
# 1 "mus_start.h" 1
# 20 "mus_start.h"
extern const unsigned char mus_start[816943];
# 21 "stateMachine.h" 2

# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 1 3
# 10 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\ieeefp.h" 1 3
# 11 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 1 3
# 10 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\newlib.h" 1 3
# 14 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\newlib.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_newlib_version.h" 1 3
# 15 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\newlib.h" 2 3
# 11 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 1 3



# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\ieeefp.h" 1 3
# 5 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\features.h" 1 3
# 6 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\config.h" 2 3
# 12 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 2 3
# 12 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3




# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 209 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4

# 209 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef unsigned int size_t;
# 321 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3

# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 1 3
# 13 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\_ansi.h" 1 3
# 14 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 143 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 1 3
# 24 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_types.h" 1 3



# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 1 3
# 41 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 5 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\_types.h" 2 3


typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\lock.h" 1 3




# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdint.h" 1 3 4
# 9 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdint.h" 3 4
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 1 3 4
# 13 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 1 3 4
# 35 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 2 3 4
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_stdint.h" 1 3 4
# 20 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stdint.h" 2 3 4
# 6 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef unsigned int __size_t;
# 145 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef signed int _ssize_t;
# 156 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 350 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;






typedef unsigned long __clock_t;






typedef __int_least64_t __time_t;





typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef int __nl_item;
typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 2 3






typedef unsigned long __ULong;
# 38 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (*_read) (struct _reent *, void *,
        char *, int);
  int (*_write) (struct _reent *, void *,
         const char *,
         int);
  _fpos_t (*_seek) (struct _reent *, void *, _fpos_t, int);
  int (*_close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 610 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (*__cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;

  __FILE __sf[3];

  void *deviceData;
};
# 817 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 1 3
# 47 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 3
# 1 "c:\\devkitpro\\devkitarm\\lib\\gcc\\arm-none-eabi\\9.1.0\\include\\stddef.h" 1 3 4
# 48 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\sys\\cdefs.h" 2 3
# 20 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\stdlib.h" 1 3
# 21 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 2 3
# 33 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void *__key,
         const void *__base,
         size_t __nmemb,
         size_t __size,
         __compar_fn_t _compar);
void *calloc(size_t, size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__))
      __attribute__((__alloc_size__(1, 2))) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void *malloc(size_t) __attribute__((__malloc__)) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(1))) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 134 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void *__base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void *realloc(void *, size_t) __attribute__((__warn_unused_result__)) __attribute__((__alloc_size__(2))) ;
# 156 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 188 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
int system (const char *__string);
# 199 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 221 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 260 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 281 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);







char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 319 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 336 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\stdlib.h" 3

# 23 "stateMachine.h" 2


# 24 "stateMachine.h"
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
# 6 "game.h" 2

# 1 "camera.h" 1
       
# 10 "camera.h"
typedef struct {

    int row;
    int col;



    int sbbrow;
    int sbbcol;
} Camera;

extern Camera camera;


void initCamera();
void updateCamera();

void cameraDebug();
void centerCameraToPlayer();

void updateSBB();
# 8 "game.h" 2
# 1 "item.h" 1
       
# 10 "item.h"
# 1 "mus_game2.h" 1
# 20 "mus_game2.h"
extern const unsigned char mus_game2[2733395];
# 11 "item.h" 2
# 24 "item.h"
typedef enum {
    NONE, BOOTS, SHRINK, SPEED, GLOVES, Z, GRAVITY
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
    int active;

    u16 color1;
    u16 color2;

    ItemType type;
    int index;
} Item;

extern Item items[6];
extern ItemType playerInventory[6];

void initItem(Item* item, int col, int row, ItemType type);

void updateItem(Item* item);
void showItem(Item* item);

void initAllItems(int cheat);
void updateAllItems();
void showAllItems();

int checkCollisionPlayer(Item* item);

void getItem(Item* item);
void useItem(ItemType item);

void showSelectorOnItem();
# 9 "game.h" 2
# 1 "laser.h" 1
       
# 22 "laser.h"
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
    int active;

    int type;

    int index;
} Laser;

typedef struct {
    Laser* laser;
    int distance;
} SlingData;

extern Laser lasers[60];
extern SlingData* nearestLaser;

void initAllLasers();
void updateAllLasers();
void showAllLasers();

void initLaser(Laser* laser, int col, int row, int tall);
void updateLaser(Laser* laser);
void showLaser(Laser* laser);

SlingData* findCloseLaser();
void laserSling();
# 10 "game.h" 2


# 1 "GameOverlay.h" 1
# 21 "GameOverlay.h"
extern const unsigned short GameOverlayTiles[128];


extern const unsigned short GameOverlayMap[1024];
# 13 "game.h" 2
# 1 "gameBackground.h" 1
# 22 "gameBackground.h"
extern const unsigned short gameBackgroundTiles[32];


extern const unsigned short gameBackgroundMap[1024];


extern const unsigned short gameBackgroundPal[256];
# 14 "game.h" 2



# 1 "mus_game1.h" 1
# 20 "mus_game1.h"
extern const unsigned char mus_game1[1749550];
# 18 "game.h" 2
# 1 "snd_Ding.h" 1
# 20 "snd_Ding.h"
extern const unsigned char snd_Ding[5200];
# 19 "game.h" 2
# 1 "snd_Zap.h" 1
# 20 "snd_Zap.h"
extern const unsigned char snd_Zap[6061];
# 20 "game.h" 2





extern int debug;
extern int fadeIn;

void init();
void update();

void initGame();
void resumeGame();
void updateGame();


void drawGame();


void setupMap();
void fade();



void setupDisplayInterrupt();
void interruptHandler();
# 6 "player.h" 2
# 15 "player.h"
# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 1 3






# 1 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\machine\\ieeefp.h" 1 3
# 8 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 2 3



# 86 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 3

# 86 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 3
extern double atan (double);
extern double cos (double);
extern double sin (double);
extern double tan (double);
extern double tanh (double);
extern double frexp (double, int *);
extern double modf (double, double *);
extern double ceil (double);
extern double fabs (double);
extern double floor (double);






extern double acos (double);
extern double asin (double);
extern double atan2 (double, double);
extern double cosh (double);
extern double sinh (double);
extern double exp (double);
extern double ldexp (double, int);
extern double log (double);
extern double log10 (double);
extern double pow (double, double);
extern double sqrt (double);
extern double fmod (double, double);
# 150 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 3
    typedef float float_t;
    typedef double double_t;
# 194 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 3
extern int __isinff (float x);
extern int __isinfd (double x);
extern int __isnanf (float x);
extern int __isnand (double x);
extern int __fpclassifyf (float x);
extern int __fpclassifyd (double x);
extern int __signbitf (float x);
extern int __signbitd (double x);
# 290 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 3
extern double infinity (void);
extern double nan (const char *);
extern double copysign (double, double);
extern double logb (double);
extern int ilogb (double);

extern double asinh (double);
extern double cbrt (double);
extern double nextafter (double, double);
extern double rint (double);
extern double scalbn (double, int);

extern double exp2 (double);
extern double scalbln (double, long int);
extern double tgamma (double);
extern double nearbyint (double);
extern long int lrint (double);
extern long long int llrint (double);
extern double round (double);
extern long int lround (double);
extern long long int llround (double);
extern double trunc (double);
extern double remquo (double, double, int *);
extern double fdim (double, double);
extern double fmax (double, double);
extern double fmin (double, double);
extern double fma (double, double, double);


extern double log1p (double);
extern double expm1 (double);



extern double acosh (double);
extern double atanh (double);
extern double remainder (double, double);
extern double gamma (double);
extern double lgamma (double);
extern double erf (double);
extern double erfc (double);
extern double log2 (double);





extern double hypot (double, double);






extern float atanf (float);
extern float cosf (float);
extern float sinf (float);
extern float tanf (float);
extern float tanhf (float);
extern float frexpf (float, int *);
extern float modff (float, float *);
extern float ceilf (float);
extern float fabsf (float);
extern float floorf (float);


extern float acosf (float);
extern float asinf (float);
extern float atan2f (float, float);
extern float coshf (float);
extern float sinhf (float);
extern float expf (float);
extern float ldexpf (float, int);
extern float logf (float);
extern float log10f (float);
extern float powf (float, float);
extern float sqrtf (float);
extern float fmodf (float, float);




extern float exp2f (float);
extern float scalblnf (float, long int);
extern float tgammaf (float);
extern float nearbyintf (float);
extern long int lrintf (float);
extern long long int llrintf (float);
extern float roundf (float);
extern long int lroundf (float);
extern long long int llroundf (float);
extern float truncf (float);
extern float remquof (float, float, int *);
extern float fdimf (float, float);
extern float fmaxf (float, float);
extern float fminf (float, float);
extern float fmaf (float, float, float);

extern float infinityf (void);
extern float nanf (const char *);
extern float copysignf (float, float);
extern float logbf (float);
extern int ilogbf (float);

extern float asinhf (float);
extern float cbrtf (float);
extern float nextafterf (float, float);
extern float rintf (float);
extern float scalbnf (float, int);
extern float log1pf (float);
extern float expm1f (float);


extern float acoshf (float);
extern float atanhf (float);
extern float remainderf (float, float);
extern float gammaf (float);
extern float lgammaf (float);
extern float erff (float);
extern float erfcf (float);
extern float log2f (float);
extern float hypotf (float, float);
# 422 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 3
extern long double atanl (long double);
extern long double cosl (long double);
extern long double sinl (long double);
extern long double tanl (long double);
extern long double tanhl (long double);
extern long double frexpl (long double, int *);
extern long double modfl (long double, long double *);
extern long double ceill (long double);
extern long double fabsl (long double);
extern long double floorl (long double);
extern long double log1pl (long double);
extern long double expm1l (long double);




extern long double acosl (long double);
extern long double asinl (long double);
extern long double atan2l (long double, long double);
extern long double coshl (long double);
extern long double sinhl (long double);
extern long double expl (long double);
extern long double ldexpl (long double, int);
extern long double logl (long double);
extern long double log10l (long double);
extern long double powl (long double, long double);
extern long double sqrtl (long double);
extern long double fmodl (long double, long double);
extern long double hypotl (long double, long double);


extern long double copysignl (long double, long double);
extern long double nanl (const char *);
extern int ilogbl (long double);
extern long double asinhl (long double);
extern long double cbrtl (long double);
extern long double nextafterl (long double, long double);
extern float nexttowardf (float, long double);
extern double nexttoward (double, long double);
extern long double nexttowardl (long double, long double);
extern long double logbl (long double);
extern long double log2l (long double);
extern long double rintl (long double);
extern long double scalbnl (long double, int);
extern long double exp2l (long double);
extern long double scalblnl (long double, long);
extern long double tgammal (long double);
extern long double nearbyintl (long double);
extern long int lrintl (long double);
extern long long int llrintl (long double);
extern long double roundl (long double);
extern long lroundl (long double);
extern long long int llroundl (long double);
extern long double truncl (long double);
extern long double remquol (long double, long double, int *);
extern long double fdiml (long double, long double);
extern long double fmaxl (long double, long double);
extern long double fminl (long double, long double);
extern long double fmal (long double, long double, long double);

extern long double acoshl (long double);
extern long double atanhl (long double);
extern long double remainderl (long double, long double);
extern long double lgammal (long double);
extern long double erfl (long double);
extern long double erfcl (long double);
# 662 "c:\\devkitpro\\devkitarm\\arm-none-eabi\\include\\math.h" 3

# 16 "player.h" 2




# 19 "player.h"
typedef enum {
    GETUP = 1, LASER
} SpecialAnim;

typedef enum {
    IDLE, RIGHT, LEFT, SPEEDRIGHT, SPEEDLEFT
} AniState;



typedef struct {

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


    int raccel;
    int caccel;


    int accelCurve;
    int decelCurve;
    int maxSpeed;
    int hardSpeedCap;
    int terminalVel;


    int isJumping;
    int jumpHeight;
    int jumpTime;
    int jumpSpeed;
    int gravity;

    int direction;


    int currentItem;
    int shrunk;
    int canWallJump;


    int rotation;


    SpecialAnim specialAnim;
} Player;


extern Player player;

extern short sinLut[];

void initPlayer();
void updatePlayer();
void showPlayer();

void handlePlayerInput();


int collisionLeft();
int collisionRight();
int collisionAbove();
int collisionBelow();
int touchingGround();
int resolveCollisions();


void equipBoots();
void shrinkPlayer();
void equipLegs();
void equipGloves();
void startLaserSling();
void finishLaserSling();
void reverseGravity();


void setTransform(int index, short scalex, short scaley, int deg);
void generateSinLut(short table[], size_t size);

void getUpAnimation();
void laserSlingAnimation();
# 2 "player.c" 2

Player player;
short sinLut[360];
SlingData* nearestLaser;

void initPlayer() {
    player.worldRow = ((1024 - 32) << 4);
    player.worldCol = ((30) << 4);
    player.screenRow = player.worldRow - camera.row;
    player.screenCol = player.worldCol - camera.col;
    player.rdel = 0;
    player.cdel = 0;
    player.width = ((8) << 4);
    player.height = ((16) << 4);
    player.hide = 1;

    player.raccel = 0;
    player.caccel = 0;

    player.accelCurve = 4;
    player.decelCurve = 8;
    player.maxSpeed = 16;
    player.hardSpeedCap = 128;
    player.terminalVel = 64;


    player.isJumping = 0;
    player.jumpHeight = 512;
    player.jumpTime = 16;

    player.gravity = (2 * player.jumpHeight) / (player.jumpTime * player.jumpTime);
    player.jumpSpeed = player.gravity * player.jumpTime;

    player.direction = 0;

    player.currentItem = 0;
    player.shrunk = 0;
    player.canWallJump = 0;

    player.rotation = 90;




    player.aniState = IDLE;
    player.curFrame = 0;
    player.numFrames = 4;
    player.aniSpeed = 15;
    player.isIdle = 1;
    player.specialAnim = GETUP;

    generateSinLut(sinLut, 360);
}

void updatePlayer() {
    if (player.specialAnim) {
        switch (player.specialAnim) {
            case GETUP:
                getUpAnimation();
                break;
            case LASER:
                laserSlingAnimation();
                break;
        }
    } else {
        handlePlayerInput();


        if (touchingGround()) {
            player.raccel = 0;
        } else {
            if (player.canWallJump && (collisionRight(2) || collisionLeft(2))) {
                player.raccel = player.gravity / 2;
            } else {
                player.raccel = player.gravity;
            }
        }
    }


    player.rdel = clamp(player.rdel + player.raccel, -player.hardSpeedCap, player.terminalVel);
    player.cdel = clamp(player.cdel + player.caccel, -player.hardSpeedCap, player.hardSpeedCap);


    player.worldCol = clamp(player.worldCol + player.cdel, 0, ((1024) << 4) - player.width);
    player.worldRow = clamp(player.worldRow + player.rdel, -64, ((1024) << 4) - player.height);
    resolveCollisions();
}

void showPlayer() {

    player.screenRow = player.worldRow - camera.row;
    player.screenCol = player.worldCol - camera.col;

    if (!player.shrunk) {
        player.screenRow -= (player.height / 2) * sinLut[(player.rotation+90) % 360] * signOf(sinLut[(player.rotation+90) % 360]) / 256;
        player.screenRow -= (player.width / 2) * sinLut[(player.rotation) % 360] * signOf(sinLut[(player.rotation) % 360]) / 256;
        player.screenCol -= (player.width / 2) * sinLut[(player.rotation+90) % 360] * signOf(sinLut[(player.rotation+90) % 360]) / 256;
        player.screenCol -= (player.height / 2) * sinLut[(player.rotation) % 360] * signOf(sinLut[(player.rotation) % 360]) / 256;
    }

    if ((player.screenRow < -player.height) || (player.screenRow > ((160 - 1) << 4))
        || (player.screenCol < -player.width) || (player.screenCol > ((240 - 1) << 4))) {
        player.hide = 1;
    } else {
        player.hide = 0;
    }

    if (player.hide) {
        shadowOAM[0].attr0 |= (2<<8);
    }
    if (player.shrunk) {
        shadowOAM[0].attr0 = (((player.screenRow) >> 4) & 0xFF) | (0<<8) | (0<<13) | (0<<14) | (1<<10);
        shadowOAM[0].attr1 = (((player.screenCol) >> 4) & 0x1FF) | (0<<14);
        shadowOAM[0].attr2 = (((player.curFrame / player.aniSpeed))*32+(5 + player.aniState)) | ((0)<<12);
    } else {
        shadowOAM[0].attr0 = (((player.screenRow) >> 4) & 0xFF) | (3<<8) | (0<<13) | (2<<14) | (1<<10);
        shadowOAM[0].attr1 = (((player.screenCol) >> 4) & 0x1FF) | (0<<14) | ((0) << 9);
        shadowOAM[0].attr2 = (((player.curFrame / player.aniSpeed)*2)*32+(0 + player.aniState)) | ((0)<<12);
    }

    setTransform(0, 1, 1, player.rotation);

    if (!player.isIdle) {
        player.curFrame++;
        player.curFrame = player.curFrame % (player.numFrames * player.aniSpeed);
    }

}


void handlePlayerInput() {
    if (!(~((*(volatile unsigned short *)0x04000130)) & ((1<<5))) && !(~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {




        if (signOf(player.direction) == signOf(player.cdel)) {

            player.caccel = -1 * signOf(player.direction) * player.decelCurve;
        } else {
            player.cdel = 0;
            player.caccel = 0;
        }
        player.aniState = IDLE;
    } else {
        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5)))) {
            player.direction = -1;
            if (player.worldCol > 0) {
                if (player.cdel > -player.maxSpeed) {
                    player.caccel = -player.accelCurve;
                } else {
                    player.caccel = 0;
                }
            }

            if (touchingGround()) {
                player.isIdle = 0;
                if (player.cdel < -32) {
                    player.aniState = SPEEDLEFT;
                } else {
                    player.aniState = LEFT;
                }
            }
        }
        if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4)))) {
            player.direction = 1;
            if (player.worldCol < ((1024) << 4) - player.width) {
                if (player.cdel < player.maxSpeed) {
                    player.caccel = player.accelCurve;
                } else {
                    player.caccel = 0;
                }
            }

            if (touchingGround()) {
                player.isIdle = 0;
                if (player.cdel > 32) {
                    player.aniState = SPEEDRIGHT;
                } else {
                    player.aniState = RIGHT;
                }
            }
        }
    }



    if ((!(~(oldButtons)&((1<<0))) && (~buttons & ((1<<0))))) {
        if (touchingGround()
        || (player.canWallJump && (collisionLeft(2) || collisionRight(2)))
         ) {
            player.isJumping = 1;
            player.rdel = -player.jumpSpeed;
            player.isIdle = 1;
            player.curFrame = 0;
        }

    }

    if (!(~((*(volatile unsigned short *)0x04000130)) & ((1<<0)))) {
        if (player.isJumping) {
            player.rdel = 0;
            player.isJumping = 0;
        }
    }



    if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        useItem(playerInventory[player.currentItem]);
    }

    if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
        if (player.currentItem > 0 && playerInventory[player.currentItem-1] != NONE) {
            player.currentItem--;

            showSelectorOnItem();
        }
    }

    if ((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8))))) {
        if (player.currentItem < 6 - 1 && playerInventory[player.currentItem+1] != NONE) {
            player.currentItem++;

            showSelectorOnItem();
        }
    }
}
# 251 "player.c"
int collisionLeft(int offset) {
    return player.worldCol < 0
        || mapCollisionBitmap[((((player.worldRow) >> 4))*(1024)+(((player.worldCol) >> 4) - offset))]
        || mapCollisionBitmap[((((player.worldRow + player.height) >> 4) - 1)*(1024)+(((player.worldCol) >> 4) - offset))];
}

int collisionRight(int offset) {
    return player.worldCol + player.width >= ((1024) << 4)
        || mapCollisionBitmap[((((player.worldRow) >> 4))*(1024)+(((player.worldCol + player.width) >> 4) + offset))]
        || mapCollisionBitmap[((((player.worldRow + player.height) >> 4) - 1)*(1024)+(((player.worldCol + player.width) >> 4) + offset))];
}

int collisionAbove(int offset) {
    return mapCollisionBitmap[((((player.worldRow) >> 4) - offset)*(1024)+(((player.worldCol) >> 4)))]
        || mapCollisionBitmap[((((player.worldRow) >> 4) - offset)*(1024)+(((player.worldCol + player.width) >> 4) - 1))];
}

int collisionBelow(int offset) {
    return player.worldRow + player.height >= ((1024) << 4)
        || mapCollisionBitmap[((((player.worldRow + player.height) >> 4) - 1 + offset)*(1024)+(((player.worldCol) >> 4)))]
        || mapCollisionBitmap[((((player.worldRow + player.height) >> 4) - 1 + offset)*(1024)+(((player.worldCol + player.width) >> 4) - 1))];
}

int touchingGround() {
    if (player.gravity > 0) {
        return mapCollisionBitmap[((((player.worldRow + player.height) >> 4))*(1024)+(((player.worldCol) >> 4)))]
        || mapCollisionBitmap[((((player.worldRow + player.height) >> 4))*(1024)+(((player.worldCol + player.width) >> 4) - 1))];
    } else {
        return mapCollisionBitmap[((((player.worldRow) >> 4) - 1)*(1024)+(((player.worldCol) >> 4)))]
        || mapCollisionBitmap[((((player.worldRow) >> 4) - 1)*(1024)+(((player.worldCol + player.width) >> 4) - 1))];
    }

}
# 299 "player.c"
int resolveCollisions() {
    int xDepth = 0;
    int yDepth = 0;


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

    }
}

void equipBoots() {
    if (player.jumpHeight == 1024) {
        player.jumpHeight = 512;
        player.jumpTime = 16;
        equipCurrentItem(0);
    } else {
        player.jumpHeight = 1024;
        player.jumpTime = 20;
        equipCurrentItem(1);
    }


    player.gravity = (2 * player.jumpHeight) / (player.jumpTime * player.jumpTime);
    player.jumpSpeed = player.gravity * player.jumpTime;
}

void shrinkPlayer() {
    if (player.shrunk) {
        if (!collisionAbove(8)) {
            player.shrunk = 0;
            player.height = ((16) << 4);
            player.worldRow -= ((8) << 4);
            equipCurrentItem(0);
        }
    } else {
        player.shrunk = 1;
        player.height = ((8) << 4);
        equipCurrentItem(1);
    }
}

void equipLegs() {
    if (player.maxSpeed == 16) {
        player.maxSpeed = 64;
        equipCurrentItem(1);
    } else {
        player.maxSpeed = 16;
        equipCurrentItem(0);
    }
}

void equipGloves() {
    if (player.canWallJump) {
        player.canWallJump = 0;
        equipCurrentItem(0);
    } else {
        player.canWallJump = 1;
        equipCurrentItem(1);
    }
}

void startLaserSling() {
    nearestLaser = findCloseLaser();
    if (nearestLaser) {
        playSoundB(snd_Ding, 5200, 0);
        player.specialAnim = LASER;
    }
}

void finishLaserSling() {
    playSoundB(snd_Zap, 6061, 0);
    if (nearestLaser->laser->type > 1) {
        player.worldRow += 2 * nearestLaser->distance;
        player.rdel = nearestLaser->distance / 4;
    } else {
        player.worldCol += 2 * nearestLaser->distance;
        player.cdel = nearestLaser->distance / 4;
    }
    free(nearestLaser);
}

void reverseGravity() {
    player.gravity *= -1;
    player.jumpSpeed *= -1;
    player.rotation = (player.rotation + 180) % 360;
}

void equipCurrentItem(int equip) {
    if (equip) {
        ((unsigned short *)0x5000000)[6 + player.currentItem] = (((13) | (13)<<5 | (0)<<10));
    } else {
        ((unsigned short *)0x5000000)[6 + player.currentItem] = ((0) | (0)<<5 | (0)<<10);
    }
}

void setTransform(int index, short scalex, short scaley, int deg) {
    shadowOAMAffine[index].a = sinLut[(deg+90)%360] / scalex;
    shadowOAMAffine[index].b = -sinLut[(deg)%360] / scalex;
    shadowOAMAffine[index].c = sinLut[(deg)%360] / scaley;
    shadowOAMAffine[index].d = sinLut[(deg+90)%360] / scaley;
}

void generateSinLut(short table[], size_t size) {
    for (int i = 0; i < size; i++) {
        table[i] = (short) (256 * sin(i*(3.14159265) / 180));
    }
}

void getUpAnimation() {
    static int numFrames = 240;
    static int curFrame = 0;

    if (curFrame > 120 && player.rotation > 0) {
        player.rotation--;
    }

    curFrame++;
    if (curFrame == numFrames) {
        curFrame = 0;
        player.specialAnim = 0;
    }
}

void laserSlingAnimation() {
    static int numFrames = 60;
    static int curFrame = 0;

    player.raccel = 0;
    player.caccel = 0;
    player.rdel = 0;
    player.cdel = 0;
    player.isIdle = 1;

    curFrame++;
    if (nearestLaser->laser->type > 1) {
        shadowOAM[60 +11 +1].attr0 = ((((nearestLaser->laser->screenRow) >> 4) - signOf(nearestLaser->distance) * 4) & 0xFF)
                                        | (0<<8) | (0<<13) | (0<<14);
        shadowOAM[60 +11 +1].attr1 = (((player.screenCol) >> 4) & 0x1FF)
                                        | (0<<14);
    } else {
        shadowOAM[60 +11 +1].attr0 = (((player.screenRow) >> 4) & 0xFF)
                                        | (0<<8) | (0<<13) | (0<<14);
        shadowOAM[60 +11 +1].attr1 = ((((nearestLaser->laser->screenCol) >> 4) - signOf(nearestLaser->distance) * 4) & 0x1FF)
                                        | (0<<14);
    }
    shadowOAM[60 +11 +1].attr2 = ((min(curFrame / (numFrames / 8), 3))*32+(10 +3)) | ((0)<<12);
    if (curFrame > numFrames) {
        curFrame = 0;
        player.specialAnim = 0;
        shadowOAM[60 +11 +1].attr0 = (2<<8);
        finishLaserSling();

    }
}
