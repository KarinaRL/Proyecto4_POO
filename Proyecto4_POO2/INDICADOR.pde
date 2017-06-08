
class indicaodor {
  PVector UltimaUbicacion;
  PVector ubicacion;
  PVector velocidad;
  float diametro;
  boolean fin;
  indicaodor() {
    ubicacion = new PVector(mouseX, mouseY);
    UltimaUbicacion = new PVector(ubicacion.x, ubicacion.y);
    velocidad = new PVector(0, -10);
    diametro = random(10, 20);
    fin= false;
  }
  indicaodor(indicaodor r) {
    ubicacion = r.ubicacion.get();
    UltimaUbicacion = r.UltimaUbicacion.get();
    velocidad = r.velocidad.get();
    diametro = r.diametro * 0.62;
    fin = r.fin;
    r.diametro = diametro;
  }
  void update() {
    
    if(ubicacion.x > 10 & ubicacion.x < width& ubicacion.y > 10 & ubicacion.y < height +20) {
      UltimaUbicacion.set(ubicacion.x, ubicacion.y);
      if (diametro > 0.9) {
        c ++;
        PVector circulo = new PVector(random(-1, 1), random(-1, 1));
        velocidad.normalize();
        circulo.mult(0.60);
        velocidad.mult(0.5);
        velocidad.add(circulo);
        velocidad.mult(random(5, 20));
        ubicacion.add(velocidad);
        if (random(0, 1) < 0.2) { 
          trayectoria = (indicaodor[]) append(trayectoria, new indicaodor(this));
        }
      } else {
        if(fin) {
          fin = false;
          noStroke();
          fill(random(240),random(240) , random(240),random(240));
          ellipse(ubicacion.x, ubicacion.y, 10, 10);
          
        }
      }
    }
  }
}