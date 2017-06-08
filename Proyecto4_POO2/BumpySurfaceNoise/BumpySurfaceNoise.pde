

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.*;

// Una referencia a nuestro mundo box2d
Box2DProcessing box2d;


// ArrayList de partículas que caerán sobre la superficie
ArrayList<Particle> particles;


// Inicializar la física box2d y crear el mundo
Surface surface;

void setup() {
  size(500,300);
  smooth();


// Inicializar la física box2d y crear el mundo
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

// Estamos estableciendo una gravedad personalizada
  box2d.setGravity(0, -20);


// Crear la lista vacía
  particles = new ArrayList<Particle>();
  // Create the surface
  surface = new Surface();
}

void draw() {

// Si el ratón es presionado, hacemos nuevas partículas
  if (mousePressed) {
    float sz = random(2,6);
    particles.add(new Particle(mouseX,mouseY,sz));
  }


// Debemos siempre paso a través del tiempo!
  box2d.step();

  background(255);

// Dibuja la superficie
  surface.display();


// Dibuja todas las partículas
  for (Particle p: particles) {
    p.display();
  }


// Partículas que salen de la pantalla, las eliminamos
  // (tenga en cuenta que deben eliminarse tanto del mundo box2d como de nuestra lista
  for (int i = particles.size()-1; i >= 0; i--) {
    Particle p = particles.get(i);
    if (p.done()) {
      particles.remove(i);
    }
  }


// Sólo dibujando el framerate para ver cuántas partículas puede manejar
  fill(0);
  text("framerate: " + (int)frameRate,12,16);
}