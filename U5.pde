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
boolean upKey, downKey, leftKey, rightKey; //p2
void setup(){
   size (1200,800); 
   p1x = width/2;
   p1y = height/2;
   p1d=50;
   
   p2x = width/2;
   p2y = height/2;
   p2d = 40;
}
void draw(){
  background (white);
  fill(red);
  circle(p1x,p1y,p1d);
 
  fill(white);
  circle(p2x,p2y,p2d);
  
 strokeWeight(3);
  line(600,0,600,800);
  
 
 strokeWeight (1);
 if (wKey)p1y= p1y-5;
 if (aKey)p1x= p1x-5;
 if (sKey)p1y= p1y+5;
 if (dKey)p1x= p1x+5;
 if (spaceKey)p1y =p1y-5;
 
 if (upKey)p2y= p2y-8;
 if (leftKey)p2x= p2x-8;
 if (rightKey)p2x= p2x+8;
 if (downKey)p2y= p2y+8;
 
 // if (downKey)p2x= p1x+5; error code that made the circle tp to the other circle

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
  if (keyCode == UP)upKey = true; 
  if (keyCode == DOWN)downKey = true; 
  if (keyCode ==  LEFT)leftKey = true; 
  if (keyCode == RIGHT)rightKey = true; 

}

void keyReleased(){
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
  
