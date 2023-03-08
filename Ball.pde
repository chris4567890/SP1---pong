class Ball {
  int x, y, w, h ,screenWidth, screenHeight,player1Points,player2Points;
  float speedX, speedY;
  
  Ball(int x, int y, int w, int h, float speedX, float speedY, int screenWidth, int screenHeight) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.screenWidth = screenWidth;
    this.screenHeight = screenHeight;
    this.speedX = speedX;
    this.speedY = speedY;
    
  }
  
  void setup(){
    
  }

  void draw() {
    rect(x, y, w,h);
    moveBall();
  }

  void moveBall() {

    x += speedX;
    y += speedY;
    if (y > screenHeight || y <0) {
      speedY *= -1;
    }
    if(x+w > screenWidth){
      ++player1Points;
      x = screenWidth/2;
      y = screenHeight/2;
    }
    if(x<0 & y+w!=0){
      ++player2Points;
      x = screenWidth/2;
      y = screenHeight/2;
    }
  }
}
