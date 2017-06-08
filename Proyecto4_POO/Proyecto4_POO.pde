
indicaodor[] trayectoria;
int num;
static int c;
int x=mouseX;
int y=mouseY;
int t=5;
ArrayList<semilla> semillas;
  float xx,yy;
  float w,h;
  //-------------------------------------------
  float [] X= new float[3000];

float [] rR= new float[3000];
int R;
float [] gG= new float[3000];
int G;
float b[] = new float[3000];
int B;
//_________________________________________________________________________
void setup() {
     font = loadFont("SitkaSmall-Italic-48.vlw");
  textFont(font);
  size(800, 600);
  ellipseMode(CENTER);
  stroke(200, 0, 0, 200);
  smooth();
  num = 5;
  c = 2;
  trayectoria = new indicaodor[num];
  for(int i = 0; i < num; i++) trayectoria[i] = new indicaodor();
  semillas = new ArrayList<semilla>();
  
}
//-------------------------------------------------------------------------
void draw() {
  texto();
 for (semilla b: semillas) {
    b.display();
  }
  for (int i = 0; i < trayectoria.length; i++) {
    
    PVector loc = trayectoria[i].ubicacion;
    PVector antLoc = trayectoria[i].UltimaUbicacion;
    strokeWeight(trayectoria[i].diametro);
    line(antLoc.x, antLoc.y, loc.x, loc.y);
    trayectoria[i].update();
    
  }
 
 //________________________________________________________________________   
}
void mousePressed() {
  semilla p = new semilla(mouseX-10,mouseY-10);
    semillas.add(p);
 
  trayectoria = new indicaodor[num];
  for(int i = 0; i < num; i++) trayectoria[i] = new indicaodor();

}