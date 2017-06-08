
class indicaodor {
  PVector UltimaUbicacion;
  PVector ubicacion;
  PVector velocidad;
  float diametro;
  boolean fin;
  indicaodor() {

    ubicacion = new PVector(xx, yy);
    
    UltimaUbicacion = new PVector(ubicacion.x, ubicacion.y);
    velocidad = new PVector(0, -20);
    diametro = random(10, 20);
    fin= false;
  }
  indicaodor(indicaodor r) {
    ubicacion = r.ubicacion.get();
    UltimaUbicacion = r.UltimaUbicacion.get();
    velocidad = r.velocidad.get();
    diametro = r.diametro * 0.6;
    fin = r.fin;
    r.diametro = diametro;
  }
  void update() {
    
    if(ubicacion.x > 10 & ubicacion.x <= width & ubicacion.y > 10 & ubicacion.y <= height +20) {
      UltimaUbicacion.set(ubicacion.x, ubicacion.y);
      if (diametro > 0.9) {
        c ++;
        PVector circulo = new PVector(random(-1, 1), random(-1, 1));
        velocidad.normalize();
        circulo.mult(0.2);
        velocidad.mult(0.7);
        velocidad.add(circulo);
        velocidad.mult(random(5, 10));
        ubicacion.add(velocidad);
        if (random(0, 1) < 0.2) { 
          trayectoria = (indicaodor[]) append(trayectoria, new indicaodor(this));
        }
      } else {
        if(!fin) {
          fin = true;
          noStroke();
           for (int i=0; i<X.length; i++){
    
    rR[i]=random(0,255);   
    gG[i]=random(0);
    b[i]=random(0,255);
       fill(rR[i],gG[i],b[i]);
    
       }
          ellipse(ubicacion.x, ubicacion.y, random(5,10), random(5,10));
          stroke(random(10,100), 0, 0, 200);
        }
      }
    }
  }
}