class Veneric implements GrafOBJ{
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
Veneric() {

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
strokeWeight(4);

pushMatrix();
translate(xShape,yShape, zShape);
rotateX(xRotation);
rotateY(yRotation);
rotateZ(zRotation);

beginShape();
for (float angle=0; angle<TWO_PI; angle+=0.01){
  float x = shapeSize *cos(angle);
  float y = shapeSize*sin(angle);
  vertex(x,y);
}

endShape();
line(shapeSize *cos(HALF_PI), shapeSize*sin(HALF_PI), shapeSize *cos(HALF_PI), shapeSize*sin(HALF_PI)+shapeSize*1.4);
line(shapeSize *cos(HALF_PI)-shapeSize/2, shapeSize*sin(HALF_PI)+shapeSize/2, shapeSize *cos(HALF_PI)+shapeSize/2, shapeSize*sin(HALF_PI)+shapeSize/2);
popMatrix();
}
}
