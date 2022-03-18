class UFO {
  float s; //size of ufo
  float shapeX; 
  float shapeY = 30; 
  float shapeZ = 420;
  ArrayList<Engine> engines1 = new ArrayList<Engine>();
  float amplitude = 2; //length between two circles of engine
  float len = 200; // len of engine trace
  float aceleration = 3; // trace speed
  float radius = 80;
  float velocity = 0;
  float yVelocity = 0;
  float yAcceleration = 0.02;
  float zVelocity = 0.1;
  float zAmplitude = 30;
  float count = 0;
  float angle = 0;
  boolean direction = true;
  
  

UFO(float s){
  this.s = s;

}

void calculating() {
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
      yVelocity += yAcceleration;
}

void display(){

  strokeWeight(2);
stroke(colors[3],100,100);
noFill();

pushMatrix();
 translate(shapeX, shapeY, shapeZ);
     rotateX(-PI/50);
     rotateZ(-sin(angle/20)/2);
    translate(-shapeX, -shapeY, -shapeZ);
    
    pushMatrix();
     translate(shapeX, shapeY, shapeZ);
     rotateX(PI / 2);
     rotateZ(yVelocity);
//нижние линии
beginShape(LINES);
  
   for (float dangle = 0; dangle < TWO_PI; dangle += TWO_PI/24) {
    float r = 200;
    float x =  r * cos(dangle);
    float y = r * sin(dangle);
    float z = 0;
    
    vertex(x*s, y*s, z*s);
    vertex(0, 0, -75*s);
  }
endShape();

// основной круг
beginShape();
  
   for (float dangle = 0; dangle < TWO_PI; dangle += TWO_PI/500) {
    float r = 200;
    float x =  r * cos(dangle);
    float y = r * sin(dangle);
    float z = 0;
    
     vertex(x*s, y*s, z*s);
    
  }
endShape();

//маленький круг внутри
beginShape();
  
   for (float dangle = 0; dangle < TWO_PI; dangle += TWO_PI/500) {
    float r = 100;
    float x =  r * cos(dangle);
    float y = r * sin(dangle);
    float z = 40;
    
     vertex(x*s, y*s, z*s);
    
  }
endShape();
//линии к маленькому кругу
beginShape(LINES);
  
   for (float dangle = 0; dangle < TWO_PI; dangle += TWO_PI/24) {
    float r = 200;
    float x =  r * cos(dangle);
    float y = r * sin(dangle);
    float z = 0;
    
     vertex(x*s, y*s, z*s);
    vertex(x/2*s, y/2*s, 40*s);
  }
endShape();

strokeWeight(3.5);
beginShape();
  
   for (float dangle = 0; dangle < PI; dangle += PI/500) {
    float r = 100;
    float x =  r * cos(dangle);
    float y = 0;
    float z = 40 + r * sin(dangle);
    
     vertex(x*s, y*s, z*s);
    
  }
endShape();



beginShape();
   rotateZ(PI/4);
   for (float dangle = 0; dangle < PI; dangle += PI/500) {
    float r = 100;
    float x =  0;
    float y = r * cos(dangle);
    float z = 40 + r * sin(dangle);
    
     vertex(x*s, y*s, z*s);
    
  }
endShape();

beginShape();
   rotateZ(PI/4);
   for (float dangle = 0; dangle < PI; dangle += PI/500) {
    float r = 100;
    float x =  0;
    float y = r * cos(dangle);
    float z = 40 + r * sin(dangle);
    
     vertex(x*s, y*s, z*s);
    
  }
endShape();

beginShape();
   rotateZ(PI/4);
   for (float dangle = 0; dangle < PI; dangle += PI/500) {
    float r = 100;
    float x =  0;
    float y = r * cos(dangle);
    float z = 40 + r * sin(dangle);
    
     vertex(x*s, y*s, z*s);
    
  }
endShape();

beginShape();
   rotateZ(PI/4);
   for (float dangle = 0; dangle < PI; dangle += PI/500) {
    float r = 100;
    float x =  0;
    float y = r * cos(dangle);
    float z = 40 + r * sin(dangle);
    
     vertex(x*s, y*s, z*s);
    
  }
endShape();
popMatrix();

//engine 1
   
    strokeWeight(3);
    ArrayList<Engine> found = new ArrayList<Engine>();
    for(Engine engine: engines1) {
      engine.z += aceleration;
      pushMatrix();
      beginShape(LINES);
      stroke(engine.c, 100 - 100*(engine.z - shapeZ - 100*s)/len);
      translate(engine.x, engine.y, engine.z);
      vertex(0,0,0);
      vertex(0,0,engine.s);
      endShape();
      popMatrix();
      if(engine.z - shapeZ - 100*s > len ) {
        found.add(engine);
      }
    }
    engines1.removeAll(found);
    found.clear();
    
    velocity += aceleration;
    if(velocity > amplitude) {
        angle += 0.09;
        engines1.add(new Engine(shapeX+2*random(-radius*s, radius*s), shapeY+random(-radius*s, radius*s)/3, shapeZ + 100*s, random(2,15), color(random(350), 100,100)));
        //engines1.add(new Engine(shapeX+2*random(-radius, radius), shapeY+random(-radius, radius)/3, shapeZ + 100*s, random(2,15), color(random(350), 100,100)));
        velocity = 0;
    }
popMatrix();
}
}
