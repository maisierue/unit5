//U5
//SOFIE TANG
//==============================================================================================
//Variable Indicator
float m;
float textSize;
int score;
int lives;
int timer;
//Colors
color row1 = #03045E;
color row2 = #0077B6;
color row3 = #00B4D8;
color row4 = #90E0EF;

//Game
float bx, by, bd; //ball
float vx, vy; //speed
float px, py, pd; //paddle
//Keyboard Varibles
boolean akey, dkey;

//Brick Varibles
int[] x;
int[] y;
boolean[] alive;
int brickd;
int i;
int n;
int tempx, tempy;

//FINAL VARIABLES
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int OPTIONS = 4;

//Image Indicator
PImage[] gif;
int number;
int f;
int a;
//FONT
import processing.core.PFont;
PFont customFont;


void setup() { //START OF SETUP ==================================================================
  //Window Setup
  mode = INTRO;
  size(800, 800, P3D);
  textAlign(CENTER, CENTER);
  rectMode(CENTER);



  //Font
  customFont = createFont("CherryBombOne-Regular.ttf", 32);
  textFont(customFont);

  //================================================================================================
  //Score and Lives
  score = 0;
  lives = 3;
  timer = 100;


  //SETUP BALL and PADDLE
  bx = width/2;
  by = height-200;
  bd = 10;

  px = width/2;
  py = height;
  pd = 100;

  vx = 0;
  vy = 1;

  //SETUP BRICK
  brickd = 25;
  n = 90;
  x = new int[n];
  y = new int [n];
  alive = new boolean[n];

  tempx = 50;
  tempy = 50;
  int i = 0;


  while (i < n) {
    x[i] = tempx;
    y[i] = tempy;
    alive[i] = true;
    tempx = tempx + 50;
    if (tempx == width) {
      tempx = 50;
      tempy = tempy + 50;
    }
    i++;
  }
  
  
  //GIF IMAGE
  number = 32;
  f = 0;
  gif = new PImage [number];
  
  int a = 0;
  while (a < number){
    gif[a] = loadImage("frame_"+a+"_delay-0.13s.gif");
    a = a + 1;
  }
  
   

  
  
} //END OF SETUP =================================================================================

void draw() {  //START OF DRAW ==================================================================
  println(mouseX, mouseY);
  


  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  }
} //END OF DRAW =================================================================================
