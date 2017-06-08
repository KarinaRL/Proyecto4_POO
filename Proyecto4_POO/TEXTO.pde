PFont font;
String cadena ="Da click";
int xX=width-400;
float ct=255; 
void texto(){
   //background(255);
     textSize(32);
    xX=xX+3;
    println(xX);
    fill(255,random(ct),random(ct));
   if(xX==600){
     xX=0-500;
   }
   textAlign(CENTER);
   text(cadena,xX,60,900,80);
  
}