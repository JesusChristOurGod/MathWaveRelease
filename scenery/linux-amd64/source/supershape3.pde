class SuperShape3 implements GrafOBJ{
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

float shapeSize =200;
color  shapeColor = color(200, 100,58);
float xRotation;
float yRotation;
float zRotation;
float xRotationSpeed = 0;
float yRotationSpeed = 0.0008; 
float zRotationSpeed = 0.0002;
//supershape variables
float n1 = 100;
float n2 = 15.25;
float n3 = -26.0;

float m = 10;
float a = 0.29;
float b = 0.34;
float osc = 0;

SuperShape3(){}

SuperShape3(float n1, float n2, float n3, float m, float a, float b, float osc){
  this.n1 = n1;
  this.n2 = n2;
  this.n3 = n3;
  this.m = m;
  this.a = a;
  this.b = b;
  this.osc = osc;
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


osc += 0.02;
}
void display(){
  
stroke(shapeColor);
strokeWeight(4);
noFill();
 
pushMatrix();
translate(xShape,yShape, zShape); 
rotateX(xRotation);
rotateY(yRotation);
rotateZ(zRotation);
  
  
  
beginShape();
  
   for (float angle = 0; angle < TWO_PI; angle += TWO_PI/500) {
    float r = super_shape(angle);
    float x = shapeSize * r * cos(angle);
    float y = shapeSize * r * sin(angle);
    float z = 0;

    vertex(x+shapeMovementVelocity, y, z);
  }
endShape();
popMatrix();
}

float super_shape(float theta){
  float part1 = (1 / a) * cos(theta * m / 4);
  part1 = abs(part1);
  part1 = pow(part1, n2);

  float part2 = (1 / b) * sin(theta * m / 4);
  part2 = abs(part2);
  part2 = pow(part2, n3);

  float part3 = pow(part1 + part2, 1 / n1);

  if (part3 == 0) {
    return 0;
  }

  return (1 / part3);
}
}
