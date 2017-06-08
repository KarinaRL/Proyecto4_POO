class semilla  {

  float x,y;
  float w,h;
  semilla(float x_, float y_) {
    x = x_;
    y = y_;
    w = 16;
    h = 16;
  }

  void display() {
     smooth();
     pushMatrix();
    int c=255;
    fill(random(c),random(c),random(c),100);
    rectMode(CENTER);
  float easing=0.05;

  x+=((mouseX - random(x))* easing)*-1 ;
  y+=((mouseX - random(y))* easing)*-1  ;
  
 
    ellipse(x,y,w,h);
   
    popMatrix();
    
  }
}