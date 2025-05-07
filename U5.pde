//U5 Project
//colors ----------------------------
color white = #FFFFFF;
color red = #9d3e3e;
color grey = 646464;

//target-----------------------------
float p1x,p1y, //position
      p1d; //diameter

float p2x, p2y, p2d;
      
//Key variables----------------------

boolean aKey, dKey, wKey, sKey, spaceKey; //false by default
boolean upKey, downKey, leftKey, rightKey; //p2
void setup(){
   size (1200,800); 
   p1x = 150;
   p1y = 275;
   p1d=50;
   
   p2x = 150;
   p2y = 575;
   p2d = 50;
}
void draw(){
  background (white);
   strokeWeight(3);
  line(0,300,1200,300);
  line(0,600,1200,600);//lines separating players
  
  strokeWeight (1);
  fill(red);
  circle(p1x,p1y,p1d);//p1
 
  fill(white);
  circle(p2x,p2y,p2d);//p2
  
  //bird
  
 
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
  
  void bird(float x, float y, float b){
    pushMatrix(); 
    translate(x,y);
    fill(grey);
    circle(x,y,b);
    rect(x,y,b,40);
    popMatrix();
  }
