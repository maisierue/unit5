//U5 Project
//colors ----------------------------
color white = #FFFFFF;
color red = #9d3e3e;

//target-----------------------------
float p1x,p1y, //position
      p1d; //diameter

float p2x, p2y, p2d;
      
//Key variables----------------------

boolean aKey, dKey, wKey, sKey, spaceKey; //false by default

void setup(){
   size (1200,800); 
   p1x = width/2;
   p1y = height/2;
   p1d=50;
}
void draw(){
  background (white);
  circle(p1x,p1y,p1d);
 ;
 
 if (wKey)p1y= p1y-5;
 if (aKey)p1x= p1x-5;
 if (sKey)p1y= p1y+5;
 if (dKey)p1x= p1x+5;
 if (spaceKey)p1y =p1y-5;
}

void keyPressed(){
  //p1
  if (key == 'w')wKey = true; 
  if (key == 'a')aKey = true; 
  if (key == 's')sKey = true; 
  if (key == 'd')dKey = true;
  if (key == ' ') spaceKey= true;
 // if (keyCode == RIGHT);
 
 //p2
  if (key == 'w')wKey = true; 
  if (key == 'a')aKey = true; 
  if (key == 's')sKey = true; 
  if (key == 'd')dKey = true;
}

void keyReleased(){
  if (keyCode == UP)wKey = false; 
  if (keyCode == DOWN)aKey = false; 
  if (keyCode ==  LEFT)sKey = false; 
  if (keyCode == RIGHT)dKey = false; 
  if (keyCode == ' ') spaceKey = false;
  
}
  
