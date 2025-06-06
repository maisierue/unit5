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

void intro() {
  //GIF
  image(gif[f], 0, 0, width, height);
  f = f + 1;
  if (f == number -1 ) f = 0;

  stroke(0);
  m = m + 0.06;
  textSize = sin(m)*20 + 100;
  textSize(textSize);
  fill(255);
  text("BREAKOUT", width/2, height/4);


  fill(255, 80);
  tacticle(249, 550, 437, 562);
  rect(width/2, 500, 300, 125);


  fill(0);
  textSize(50);
  text("PLAY", width/2, 490);
}

void introClicks() {
  if (mouseX > 249 && mouseX < 550 && mouseY > 437 && mouseY < 562) {
    mode = GAME;
    timer = 100;
    score = 0;
    lives = 3;
    bx = width/2;
    by = height-200;
    px = width/2;
    alive[i] = true;

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
  }
}



void game() {
   //GIF
  image(gif[f], 0, 0, width, height);
  f = f + 1;
  if (f == number -1 ) f = 0;
  
 
  
  

  //score and lives
  textFont(customFont);
  fill(255);
  textSize(40);
  text("SCORE: " + score, 120, 760);
  text("LIVES: " + lives, 700, 760);
  timer = timer - 1;
  if (score == 900) {
    mode = GAMEOVER;
  }

  if (lives == 0) {
    mode = GAMEOVER;
  }


  //PADDLE ===============
  stroke(0);
  strokeWeight(5);
  fill(255);
  circle(px, py, pd);
  if (px > pd/2) {
    if (akey) px = px - 5;
  }
  if (px < height - pd/2 ) {
    if (dkey) px = px + 5;
  }
  //BALL =================
  noStroke();
  fill(255);
  circle(bx, by, bd);
  // Moving ball
  if (timer < 0) {
    bx = bx + vx;
    by = by + vy;
  }


  //bouncing off paddle
  if (dist(bx, by, px, py) < bd/2 + pd/2) {
    vx = (bx - px)/10;
    vy = (by - py)/10;
  }

  //bouncing off top
  if (by < bd/2) {
    vy = vy * -1;
  }

  //bouncing off side
  if (bx < bd/2 || bx > width-bd/2) {
    vx = vx * -1;
  }

  if (by > height + bd/2) {
    timer = 100;
    bx = width/2;
    by = height-200;
    lives = lives - 1;
  }
  //BRICKS ==============================
  int i = 0;
  while (i < n) {
    if (alive[i] == true) {
      manageBricks(i);
    }
    i++;
  }
}

void manageBricks(int i) {
  stroke(0);
  strokeWeight(2);
  if (y[i] == 100) fill(row1);
  if (y[i] == 200) fill(row2);
  if (y[i] == 300) fill(row3);
  if (y[i] == 400) fill(row4);
  circle(x[i], y[i], brickd);

  if (dist(bx, by, x[i], y[i]) < bd/2 + brickd/2) {
    vx = (bx - x[i])/4;
    vy = (by - y[i])/4;
    alive[i] = false;
    score = score + 10;
  }
}

void gameClicks() {
}

void pause() {

}

void pauseClicks() {
}



void gameover() {
  //GIF
  image(gif[f], 0, 0, width, height);
  f = f + 1;
  if (f == number -1 ) f = 0;

  if (score == 900) {
    m = m + 0.06;
    textSize = sin(m)*20 + 100;
    textSize(textSize);
    fill(255);
    text("YOU WON", width/2, height/3);
  } else if (lives == 0) {
    //right score
    m = m + 0.06;
    textSize = sin(m)*20 + 100;
    textSize(textSize);
    fill(255);
    text("YOU LOST", width/2, height/3);
  }

  textSize(40);
  text("click anywhere to restart", width/2, 500);
}

void gameoverClicks() {
  mode = INTRO;
  timer = 100;
  score = 0;
  lives = 3;
  bx = width/2;
  by = height-200;
  px = width/2;
  alive[i] = true;

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
}


void keyPressed() {
  //PADDLE
  if (key == 'a' || key == 'A') { 
    akey = true;
  }
  if (key == 'd' || key == 'D') {
    dkey = true;
  }
   
}

void keyReleased() {
  //PADDLE
  if (key == 'a' || key == 'A') { 
    akey = false;
  }
  if (key == 'd' || key == 'D') {
    dkey = false;
  }
  
 
}


void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}


void tacticle(float x, float y, float z, float a) { //Hover to change outline
  if (mouseX > x && mouseX < y && mouseY > z && mouseY < a) {
    stroke(255);
    strokeWeight(5);
  } else {
    stroke(0);
  }
}
