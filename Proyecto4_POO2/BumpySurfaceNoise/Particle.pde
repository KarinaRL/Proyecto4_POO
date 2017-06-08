// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// Box2DProcessing example

// A circular particle

class Particle {

// Necesitamos rastrear un Cuerpo y un radio
  Body body;
  float r;

  Particle(float x, float y, float r_) {
    r = r_;

// Esta función pone la partícula en el mundo Box2d
    makeBody(x,y,r);
  }


// Esta función elimina la partícula del mundo box2d
  void killBody() {
    box2d.destroyBody(body);
  }


// ¿Está lista la partícula para borrarla?
  boolean done() {

// Busquemos la posición de la pantalla de la partícula
    Vec2 pos = box2d.getBodyPixelCoord(body);
 
// ¿Está en la parte inferior de la pantalla?
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }

  // 
  void display() {

// Miramos cada cuerpo y conseguimos su posición en la pantalla
    Vec2 pos = box2d.getBodyPixelCoord(body);
 // Obtener su ángulo de rotación
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);

// Vamos a agregar una línea para que podamos ver la rotación
    line(0,0,r,0);
    popMatrix();
  }


// Aquí está nuestra función que añade la partícula al mundo Box2D
  void makeBody(float x, float y, float r) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x,y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);


// Haga de la forma del cuerpo un círculo
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;
    

// Acoplar el aparato al cuerpo
    body.createFixture(fd);

// Darle una velocidad inicial aleatoria (y velocidad angular)
    body.setLinearVelocity(new Vec2(random(-10f,10f),random(5f,10f)));
    body.setAngularVelocity(random(-10,10));
  }






}