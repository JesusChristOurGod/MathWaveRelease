class Octahedron implements GrafOBJ{
  float xShape;
  float yShape;
  float zShape;
  //variables for movement
  boolean shapeMovementDirection =true;
  int shapeMovementCount;
  int shapeMovementAmplitude = 60;
  float shapeMovementVelocity; //add this to all x or y or z vertex coordinates, to get a movement effect
  float shapeMovementAcceleration = 0.1;
  //variables for shrinking
  boolean shapeShrinkingDirection =true;
  int shapeShrinkingCount;
  int shapeShrinkingAmplitude = 200;
  float shapeShrinkingVelocity; //add this to all x or y or z vertex coordinates, to get a shrinking(scaling) effect
  float shapeShrinkingAcceleration = 0.1;

  float shapeSize =100;
  color shapeColor = color(200, 100,58);
  float xRotation;
  float yRotation;
  float zRotation;
  float xRotationSpeed=0.01;
  float yRotationSpeed=0.01; 
  float zRotationSpeed = 0;

Octahedron() {


}

void setuping(float xShape, float yShape, float zShape, int shapeMovementAmplitude, float shapeMovementAcceleration, int shapeShrinkingAmplitude,float shapeShrinkingAcceleration, float shapeSize, color shapeColor, float xRotation, float yRotation, float zRotation, float xRotationSpeed, float yRotationSpeed, float zRotationSpeed) {
  this.xShape = xShape;
  this.yShape = yShape;
  this.zShape = zShape;
  this.shapeMovementAmplitude = shapeMovementAmplitude;
  this.shapeMovementAcceleration = shapeMovementAcceleration;
  this.shapeShrinkingAmplitude = shapeShrinkingAmplitude;
  this.shapeShrinkingAcceleration = shapeShrinkingAcceleration;
  this.shapeSize = shapeSize;
  this.shapeColor = shapeColor;
  this.xRotation = xRotation;
  this.yRotation = yRotation;
  this.zRotation = zRotation;
  this.xRotationSpeed =  xRotationSpeed;
  this.yRotationSpeed =  yRotationSpeed;
  this.zRotationSpeed =  zRotationSpeed;

}

void calculating() {
  //calculating movement behaviour
if (shapeMovementDirection==true){
    shapeMovementVelocity+=shapeMovementAcceleration;
    shapeMovementCount++;
  }
  else{
    shapeMovementVelocity-=shapeMovementAcceleration;
    shapeMovementCount--;
  }
if (shapeMovementCount==shapeMovementAmplitude){
    
  shapeMovementDirection =false;
}
if (shapeMovementCount==-shapeMovementAmplitude){
    
  shapeMovementDirection =true;
}


//calculating shrinking behaviour
if (shapeShrinkingDirection==true){
    shapeShrinkingVelocity+=shapeShrinkingAcceleration;
    shapeShrinkingCount++;
  }
  else{
    shapeShrinkingVelocity-=shapeShrinkingAcceleration;
    shapeShrinkingCount--;
  }
if (shapeShrinkingCount==shapeShrinkingAmplitude){
    
  shapeShrinkingDirection =false;
}
if (shapeShrinkingCount==-shapeShrinkingAmplitude){
    
  shapeShrinkingDirection =true;
}

//changing angle of a shape
xRotation+=xRotationSpeed;
yRotation+=yRotationSpeed;
zRotation+=zRotationSpeed;

}


void display() {
stroke(shapeColor);
strokeWeight(4);

pushMatrix();
translate(xShape+shapeMovementVelocity,yShape, zShape);
rotateX(xRotation);
rotateY(yRotation);
rotateZ(zRotation);


//actually drawing the shape
beginShape(LINES);

vertex(shapeSize, -shapeSize/sqrt(3),0);
vertex(-shapeSize, -shapeSize/sqrt(3),0);

vertex(-shapeSize, -shapeSize/sqrt(3),0);
vertex(0, 2*shapeSize/sqrt(3), 0);

vertex(shapeSize, -shapeSize/sqrt(3),0);
vertex(0, 2*shapeSize/sqrt(3), 0);

vertex(0,0,3*shapeSize/sqrt(6));
vertex(shapeSize, -shapeSize/sqrt(3),0);

vertex(0,0,3*shapeSize/sqrt(6));
vertex(-shapeSize, -shapeSize/sqrt(3),0);

vertex(0,0,3*shapeSize/sqrt(6));
vertex(0, 2*shapeSize/sqrt(3), 0);
//
vertex(0,0,-3*shapeSize/sqrt(6));
vertex(shapeSize, -shapeSize/sqrt(3),0);

vertex(0,0,-3*shapeSize/sqrt(6));
vertex(-shapeSize, -shapeSize/sqrt(3),0);

vertex(0,0,-3*shapeSize/sqrt(6));
vertex(0, 2*shapeSize/sqrt(3), 0);


endShape();
popMatrix();
}
}
