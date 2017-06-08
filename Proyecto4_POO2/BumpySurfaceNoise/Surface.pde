
// Un límite de superficie irregular

class Surface {

// Seguiremos todos los puntos de la superficie
  ArrayList<Vec2> surface;


  Surface() {
    surface = new ArrayList<Vec2>();


// Esto es lo que box2d usa para poner la superficie en su mundo
    ChainShape chain = new ChainShape();


// Argumento de ruido de Perlin
    float xoff = 0.0;


// Esto tiene que ir hacia atrás para que los objetos reboten de la parte superior de la superficie
    // ¡Esta "edgechain" sólo funcionará en una dirección!
    for (float x = width+10; x > -10; x -= 5) {


// Hacer algunas cosas con ruido perlin para calcular una superficie que apunta hacia abajo en un lado
      // y por el otro
      float y;
      if (x > width/2) {
        y = 100 + (width - x)*1.1 + map(noise(xoff),0,1,-80,80);
      } 
      else {
        y = 100 + x*1.1 + map(noise(xoff),0,1,-80,80);
      }


// Almacena el vértice en coordenadas de pantalla
      surface.add(new Vec2(x,y));

   
// Desplazarse por el ruido perlin
      xoff += 0.1;

    }
    

// Construye una matriz de vértices en coordenadas Box2D
    // de la ArrayList que hicimos
    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      Vec2 edge = box2d.coordPixelsToWorld(surface.get(i));
      vertices[i] = edge;
    }
    

// Crear la cadena!
    chain.createChain(vertices,vertices.length);
    
    
// La cadena de borde está ahora unida a un cuerpo a través de un accesorio
    BodyDef bd = new BodyDef();
    bd.position.set(0.0f,0.0f);
    Body body = box2d.createBody(bd);
// Atajo, podríamos definir un accesorio si
    // quiere especificar fricciones, restitución, etc.
    body.createFixture(chain,1);

  }

// Una función simple para dibujar la cadena de borde como una serie de puntos de vértice
  void display() {
    strokeWeight(2);
    stroke(0);
    noFill();
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x,v.y);
    }
    endShape();
  }

}