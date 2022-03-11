class WindRose implements GrafOBJ{
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

  float shapeSize =10;
  color shapeColor = color(188, 70,165);
  float xRotation;
  float yRotation;
  float zRotation;
  float xRotationSpeed = 0;
  float yRotationSpeed = 0.0008; 
  float zRotationSpeed = 0.0002;

//сюда передаём значения особых переменных
WindRose() {

}

//общие переменные
void setuping(float xShape, float yShape, float zShape,int shapeMovementAmplitude, float shapeMovementAcceleration, int shapeShrinkingAmplitude, float shapeShrinkingAcceleration, float shapeSize, color shapeColor, float xRotation, float yRotation, float zRotation, float xRotationSpeed, float yRotationSpeed, float zRotationSpeed) {
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
noFill();
strokeWeight(2);

pushMatrix();
translate(xShape,yShape, zShape);
rotateX(xRotation);
//rotateY(yRotation);
rotateZ(zRotation);
for (int i=0; i<4; i++){
rotateZ(PI/2);
beginShape();
vertex(0,0,0.4*shapeSize);
vertex(-0.2*shapeSize,0.2*shapeSize);
vertex(0,0.8*shapeSize);
vertex(0.2*shapeSize,0.2*shapeSize);
vertex(0,0,0.4*shapeSize);
vertex(0,0.8*shapeSize);
endShape();

}
rotateZ(PI/4);
for (int i=0; i<4; i++){
rotateZ(PI/2);
beginShape();
vertex(0,0,0.4*shapeSize);
vertex(-0.15*shapeSize,0.15*shapeSize);
vertex(0,0.6*shapeSize);
vertex(0.15*shapeSize,0.15*shapeSize);
vertex(0,0,0.4*shapeSize);
vertex(0,0.6*shapeSize);
endShape();

}
rotateZ(PI/4);
for (int i=0; i<4; i++){
rotateZ(PI/2);
beginShape();
vertex(0,0,-0.4*shapeSize);
vertex(-0.2*shapeSize,0.2*shapeSize);
vertex(0,0.8*shapeSize);
vertex(0.2*shapeSize,0.2*shapeSize);
vertex(0,0,-0.4*shapeSize);
vertex(0,0.8*shapeSize);
endShape();

}
rotateZ(PI/4);
for (int i=0; i<4; i++){
rotateZ(PI/2);
beginShape();
vertex(0,0,-0.4*shapeSize);
vertex(-0.15*shapeSize,0.15*shapeSize);
vertex(0,0.6*shapeSize);
vertex(0.15*shapeSize,0.15*shapeSize);
vertex(0,0,-0.4*shapeSize);
vertex(0,0.6*shapeSize);
endShape();



}
popMatrix();
}
}
