
class Engine {
  float x = 0; 
  float y = 0;
  float z = 0;
  float s= 0;
  color c = color(0,0,0);
  
  Engine(float x, float y, float z, color c) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.c = c;
  }
  
  Engine(float x, float y, float z, float s, color c) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.s =s;
    this.c = c;
  }
}

class Craft {

  float s;
  float shapeX; 
  float shapeY = 35; 
  float shapeZ = 370;
  ArrayList<Engine> engines1 = new ArrayList<Engine>();
  ArrayList<Engine> engines2 = new ArrayList<Engine>();
  float amplitude = 10;
  float len = 300;
  float aceleration = 3;
  float velocity = 0;
  float zVelocity = 0.1;
  float zAmplitude = 30;
  float count = 0;
  float angle = 0;
  boolean direction = true;
  
  Craft(float size) {
    this.s = size;
  }
  
  void calculating(){
  
      angle += 0.2;
      shapeX = sin(angle/20)*50;
      
      if(count >= zAmplitude) {
        direction = !direction;
        count = 0;
      }
      if(direction) {
        shapeZ += zVelocity;
       
      } else {
        shapeZ -= zVelocity;
      }
      count +=zVelocity;
  
  }
  
  void display() {
  
    pushMatrix();
     translate(shapeX, shapeY, shapeZ);
     rotateX(-PI/50);
     rotateZ(-sin(angle/20)/2);
    translate(-shapeX, -shapeY, -shapeZ);
    stroke((colors[3]+120)%360,100,100);
    strokeWeight(4);
    noFill();
    pushMatrix();
    //craft
    translate(shapeX, shapeY, shapeZ);
   
    beginShape();
    vertex(-100*s, -50*s, 100*s);
    vertex( 100*s, -50*s, 100*s);
    vertex( 150*s,  50*s, 100*s);
    vertex( -150*s,  50*s, 100*s);
    vertex(-100*s, -50*s, 100*s);

    vertex(0,-25*s,-350*s);
    vertex( 100*s, -50*s, 100*s);
    
    vertex( 150*s,  50*s, 100*s);
    vertex(0,-25*s,-350*s);
    vertex( -150*s,  50*s, 100*s);
    
    
    endShape();
    
    beginShape();
    vertex(0, -50*s, 100*s);
    vertex( 0*s, -200*s, 200*s);
    vertex( 0*s,  -30*s, -100*s);
    vertex( 0,  -25*s, -350*s);
   
    
    endShape();
    popMatrix();
    
    //engine 1
    stroke(colors[3],100,100);
    strokeWeight(2);
    ArrayList<Engine> found = new ArrayList<Engine>();
    for(Engine engine: engines1) {
      engine.z += aceleration;
      pushMatrix();
      translate(engine.x, engine.y, engine.z);
      
      circle(0,0, 30*s);
      popMatrix();
      if(engine.z - shapeZ - 100*s > len ) {
        found.add(engine);
      }
    }
    engines1.removeAll(found);
    found.clear();
    //engine 2
    for(Engine engine: engines2) {
      engine.z += aceleration;
      pushMatrix();
      translate(engine.x, engine.y, engine.z);
      circle(0,0, 30*s);
      popMatrix();
      if(engine.z - shapeZ - 100*s > len) {
        found.add(engine);
      }
    }
    engines2.removeAll(found);
    
    velocity += aceleration;
    if(velocity > amplitude) {
        angle += 0.09;
        engines1.add(new Engine(shapeX + 80*s, shapeY, shapeZ + 100*s, 0));
        engines2.add(new Engine(shapeX -80*s,  shapeY, shapeZ + 100*s, 0));
        velocity = 0;
    }
     
     popMatrix();
  
  }


}
