class Square {
  //variables for the constructor
  int id, screenWidth, screenHeight;
  float xCor, yCor, w, h;
  //constructor for square class
  Square(int id, float xCor, float yCor, float w, float h, int screenWidth, int screenHeight) {
    //sets the variables 
    this.id = id;
    this.xCor = xCor;
    this.yCor = yCor;
    this.w = w;
    this.h = h;
    this.screenWidth = screenWidth;
    this.screenWidth = screenHeight;
    
  }

  
  
  void draw() {
    //draws the rect using the variables from the constructor.
    rect(xCor, yCor, w, h);
  }
}
