import java.util.*;
import processing.sound.*;
SoundFile sound;
int sizeWidth = 750;
int sizeHeight = 750;
int speed = 10;
//this sometimes bug out in an annoying way when one of the numbers becomes 0
float ballSpeedX = random(-10,10);
float ballSpeedY = random(-10,10);


//to fix key override bug in processing.
HashSet<Integer> pressedKeys = new HashSet();

//classes with the main logic first being the ball
Ball ball = new Ball(sizeWidth/2, sizeHeight/2,50, 50,ballSpeedX, ballSpeedY, sizeWidth, sizeHeight);
//the two player classes controlling a rect on each side starting in the middle half of each screen
Square s1 = new Square(1, 25, 300, 50, 250, sizeWidth, sizeHeight);
Square s2 = new Square(2, 675, 300, 50, 250, sizeWidth, sizeHeight);
//setting up the control and hitboxes for the ball and players 
Control c1 = new Control('W', 'S', s1, speed,ball);
Control c2 = new Control('I', 'K', s2, speed,ball);

void settings() {
  //in settings as it's more appropriate here than setup
  size(sizeWidth, sizeHeight);
    
}

void setup() {
  //fits better to setup the canvas here
  background(255);
  sound = new SoundFile(this,"W.wav");
}
//changes the direction of the ball when it hit's the player square 
void coalition(){
  //source for sound library https://processing.org/reference/libraries/sound/SoundFile_play_.html
  //source for wilhelm scream https://bigsoundbank.com/detail-0477-wilhelm-scream.html
  sound.play();
  ball.speedX *= -1;
  ball.speedY *= -1;
  if(ball.speedY <0){
    ball.speedY = random(-5,-30);
    
  }
  if(ball.speedY >0){
    ball.speedY = random(5,30);
  }
}

void draw() { 
  
  background(255);
  textSize(15);
  fill(211,211,211);
  //to fill in requirement for a loop 
  for(int i = 14; i>=0; --i){
    rect(sizeHeight/2,i*50,50,50);
    //rect(sizeHeight/2,i*50,50,50);
  }
  //prints the players point
  text("Points: "+ball.player1Points,25,50);
  text("Points: "+ball.player2Points,600,50);
  fill(255);
  //draws the objects
  ball.draw();
  s1.draw();
  c1.draw();
  s2.draw();
  c2.draw();
  
  //checks for coalition detection here.
  if(c1.interSect(ball) || c2.interSect(ball)){
    coalition();
  }
  
}
