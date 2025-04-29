//U5 Project
//colors ----------------------------
color white = #FFFFFF;
color red = #9d3e3e;

//target-----------------------------
float p1x,p1y, //position
      p1d; //diameter

float p2x, p2y, p2d;
      
//Key variables----------------------

boolean aKey, dKey, wKey, sKey; //false by default

void setup(){
   size (600,600); 
   p1x = width/2;
   p1y = height/2;
   p1d=100;
}
void draw(){
  background (white);
  circle(p1x,p1y,p1d);
 ;
 
 if (wKey)p1y= p1y-5;
 if (aKey)p1x= p1x-5;
 if (sKey)p1y= p1y+5;
 if (dKey)p1x= p1x+5;
}

void keyPressed(){
  //p1
  if (key == 'w')wKey = true; 
  if (key == 'a')aKey = true; 
  if (key == 's')sKey = true; 
  if (key == 'd')dKey = true;
 // if (keyCode == RIGHT);
 
 //p2
  if (key == 'w')wKey = true; 
  if (key == 'a')aKey = true; 
  if (key == 's')sKey = true; 
  if (key == 'd')dKey = true;
}

void keyReleased(){
  if (key == 'w')wKey = false; 
  if (key == 'a')aKey = false; 
  if (key == 's')sKey = false; 
  if (key == 'd')dKey = false; 
  
}
  
