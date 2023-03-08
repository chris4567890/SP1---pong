//wanted to waste some memory 
import java.*;
class Control {
  char control1, control2;

  int speed;

  Square square;
  Ball ball;
  //the control takes both the square and the ball in order for the hitbox to work.
  Control(char control1, char control2, Square square, int speed,  Ball ball) {
    this.control1 = control1;
    this.control2 = control2;
    this.square = square;
    this.speed = speed;
    //for coalition
    this.ball = ball;
  }
  //works about 90% of the time if you don't clip the square and ball.  
  boolean interSect(Ball ball) {
    //source for the hitbox: https://happycoding.io/tutorials/processing/collision-detection
    if (ball.x + ball.w + ball.speedX > square.xCor && ball.x+ball.speedX+speed < square.xCor+square.w && ball.y + ball.h > square.yCor && ball.y < square.yCor+square.h) {
      return true;
    }else{
      return false;
    }
  }  

  void draw() {
    //makes the squares go up and down until they hit the edge of the screen they are compatible with height change but not with
    if (pressedKeys.contains((int)control1) && square.yCor > 0) {
      square.yCor -= speed;
    } else if (pressedKeys.contains((int)control2) && square.yCor+square.h <square.screenWidth ) {
      square.yCor += speed;
    }
  }
}

void keyPressed(){
  //reason for the add is to fix the key override bug in processing.
 pressedKeys.add(keyCode);
 
}
//also part of the bug fix for key override in processing.
void keyReleased(){
  pressedKeys.remove(keyCode);
}
