class semilla  {


  semilla(float x_, float y_) {
    xx = x_;
    yy = y_;
    w = 16;
    h = 16;
  }

  void display() {
    smooth();
     pushMatrix();
       for (int i=0; i<X.length; i++){
    
     rR[i]=random(0,255);   
    gG[i]=random(0,255);
  
  
    b[i]=random(0,255);
       fill(rR[i],gG[i],b[i]);
    stroke(0);
       }
    if(yy>=height){
      yy=yy-10;
     
    }else{ 
      yy=yy+2;
    
    }
    rectMode(CENTER);
    ellipse(xx,yy,w,h);
     popMatrix();
  }
}