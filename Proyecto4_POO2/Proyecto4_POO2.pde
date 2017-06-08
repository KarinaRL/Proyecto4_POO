
indicaodor[] trayectoria;
int num;
static int c;
int x=mouseX;
int y=mouseY;
int t=5;
ArrayList<semilla> semillas;
//_________________________________________________________________________
void setup() {
  size(800, 600);
  ellipseMode(CENTER);
  stroke(random(200),random(255), random(255),random(255));
  smooth();
  num = 50;
  c = 2;
  trayectoria = new indicaodor[num];
  for(int i = 0; i < num; i++) trayectoria[i] = new indicaodor();
  semillas = new ArrayList<semilla>();
}
//-------------------------------------------------------------------------
void draw() {
    semilla p = new semilla(mouseX,mouseY);
    semillas.add(p);
   background(0);
  for (semilla b: semillas) {
    b.display();
  }
  for (int i = 0; i < trayectoria.length; i++) {
    
    PVector loc = trayectoria[i].ubicacion;
    PVector antLoc = trayectoria[i].UltimaUbicacion;
    stroke(random(240),random(240),random(240));
    strokeWeight(trayectoria[i].diametro);
    line(antLoc.x, antLoc.y, loc.x, loc.y);
     
    trayectoria[i].update();
   
  }
 
 //________________________________________________________________________   
}
void mousePressed() {
    
      trayectoria = new indicaodor[num];
  for(int i = 0; i < num; i++) trayectoria[i] = new indicaodor();
   

}