PImage cookie;
PImage mon;
PImage wCookie;

//cookie

class particle{
  double myX, myY, myAngle, mySpeed;
  //int myColor;
  particle(){
    myX = myY = 250;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*10;
    //myColor = color(0,(int)(Math.random()*200), (int)(Math.random()*256));
  }
  void move(){
    myX = myX + Math.cos(myAngle)*mySpeed;
    myY = myY + Math.sin(myAngle)*mySpeed;
  }
  void end(){
    if (myX  < -50 || myX > 550 || myY < -50 || myY > 550){
      myX = 250;
      myY = 250;
    }
  }
  void show(){
    image(cookie,(float)(myX),(float)(myY),50,50);
  }
}

//cooie monster

class oddball extends particle{
 oddball(){
   myX = (int)(Math.random()*300)+50;
   myY = (int)(Math.random()*300)+50;
   myAngle = Math.random()*2*Math.PI;
   mySpeed = (Math.random()*10)+3;
 }
 void end(){
    if (myX < -10){
      myAngle = (Math.random()*(Math.PI))-(Math.PI/2);
      mySpeed = Math.random()*10;
    }
    if (myX > 430){
      myAngle = (Math.random()*Math.PI)+(Math.PI/2);
      mySpeed = Math.random()*10;
    }
    if (myY < -5){
      myAngle = (Math.random()*Math.PI);
      mySpeed = Math.random()*10;
    }
    if (myY > 440){
      myAngle = (Math.random()*-Math.PI);
      mySpeed = (Math.random()*20)+5;
    }
 }
 void show(){
   image(mon,(float)(myX),(float)(myY),75,75);
 }
  
}

//white choco

class wOddball extends particle{
   wOddball(){
    myX = myY = 250;
    myAngle = Math.random()*2*Math.PI;
    mySpeed = Math.random()*5;
  }
  void show(){
    image(wCookie,(float)(myX),(float)(myY), 100, 80);
  }
}

particle [] smol = new particle [120];
void setup(){
 frameRate(100000);
 cookie = loadImage("PerfectCookie.png");
 mon = loadImage("cookMon.png");
 wCookie = loadImage("whiteChoco.png");
 size(500,500);
 background(0,0,0);
 noStroke();
 for (int i = 0; i < smol.length-30; i++){
   smol[i] = new particle();
 }
 for (int k = 90; k < smol.length-10; k++){
   smol[k] = new wOddball();
 }
 for (int j = 110; j < smol.length; j++){
   smol[j] = new oddball();
 }
 
}

void draw(){
  fill(255,229,51,125);
  rect(0,0,500,500);
  for (int j = 110; j < smol.length; j++){
    smol[j].show();
    smol[j].move();
    smol[j].end();

  }
  for (int k = 90; k < smol.length-10; k++){
    smol[k].show();
    smol[k].move();
    smol[k].end();

  }
  for (int i = 0; i < smol.length-30; i++){
    smol[i].show();
    smol[i].move();
    smol[i].end();
  }

}
void keyPressed(){
  for (int i = 0; i < smol.length; i++){
     if (key == ' '){
      smol[i].mySpeed = (Math.random()*10)+5;
    }
  }  
}
void mousePressed()
{
 if(mouseButton == LEFT)
  {
    for(int i = 0; i < smol.length; i++)
    {
      smol[i].mySpeed*=-1;
    }
    redraw();
  }
}
