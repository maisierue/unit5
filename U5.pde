//U5 Project
//colors ----------------------------
color white = #FFFFFF;
color red = #9d3e3e;
color grey = #646464;

//target-----------------------------
float p1x, p1y, //position
  p1d; //diameter
float birdx= 1250; //bird
float birdy= 0;

float p2x, p2y, p2d;
float birdx2= 1250; //bird
float birdy2= 0;


//Key variables----------------------

boolean aKey, dKey, wKey, sKey, spaceKey; //false by default
boolean upKey, downKey, leftKey, rightKey; //p2
void setup() {
  size (1200, 800); 
  p1x = 250;
  p1y = 275;
  p1d=50;

  p2x = 250;
  p2y = 575;
  p2d = 50;
}
void draw() {
  background (white);
  strokeWeight(3);
  bline(0, 0, 0, 0);
  bline(0, 300, 0, 300);//lines separating players

  strokeWeight (1);
  fill(red);
  circle(p1x, p1y, p1d);//p1

  fill(white);
  circle(p2x, p2y, p2d);//p2

  //bird1
  strokeWeight (3);
  stroke(grey);
  fill(grey);
  rect(birdx +20, birdy+100, 30, 30);
  birdx = birdx-8;
  if (birdx<-100) {
    birdx=1250;
    birdx = birdx-(random(8, 18));
    birdy = (random( 0 , 90));
  }

  //bird2
  strokeWeight (3);
  stroke(grey);
  fill(grey);
  rect(birdx2 +20, birdy2+500, 30, 30);
  birdx2 = birdx2-8;
  if (birdx2<-100) {
    birdx2=1250;
    birdx2 = birdx2-(random(8, 18));
    birdy2 = (random( 0 , 150));
  }

  //cactus1
  strokeWeight(3);
  stroke (0);
  fill (grey);
  rect(

  stroke(0);
  strokeWeight (1);
  if (wKey)p1y= p1y-5;
  if (aKey)p1x= p1x-5;
  if (sKey)p1y= p1y+5;
  if (dKey)p1x= p1x+5;
  if (spaceKey)p1y =p1y-5;

  if (upKey)p2y= p2y-5;
  if (leftKey)p2x= p2x-5;
  if (rightKey)p2x= p2x+5;
  if (downKey)p2y= p2y+5;
}




void keyPressed() {
  //p1
  if (key == 'w')wKey = true; 
  if (key == 'a')aKey = true; 
  if (key == 's')sKey = true; 
  if (key == 'd')dKey = true;
  if (key == ' ') spaceKey= true;
  // if (keyCode == RIGHT);

  //p2
  if (keyCode == UP)upKey = true; 
  if (keyCode == DOWN)downKey = true; 
  if (keyCode ==  LEFT)leftKey = true; 
  if (keyCode == RIGHT)rightKey = true;
}

void keyReleased() {
  if (key == 'w')wKey = false; 
  if (key == 'a')aKey = false; 
  if (key == 's')sKey = false; 
  if (key == 'd')dKey = false;
  if (key == ' ') spaceKey= false;


  if (keyCode == UP)upKey = false; 
  if (keyCode == DOWN)downKey = false; 
  if (keyCode ==  LEFT)leftKey = false; 
  if (keyCode == RIGHT)rightKey = false;
}

void bline(float x, float y, float x2, float y2) {
  line(x+0, y+300, x2+1200, y2+300);
}

void p1() {
}

// void b1(){
//     strokeWeight (3);
//     fill(grey);
// rect(b1 +20,400,30,30);
// b1 = b1-8;
// if (b1<-300){
// b1=1250;
// }
// }


//void bird(float x, float y, float b){
//  pushMatrix(); 
//  translate(x,y);
//  fill(grey);
// circle(x,y,b);
//  rect(x,y,b,40);
//  popMatrix();
// }
