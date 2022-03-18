class SuperShape3D3 implements GrafOBJ{
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
float total = 40;
float m = 5;
float a = 1;
float b = 1;
float osc = 0;
PVector[][] globe;


SuperShape3D3(){}

SuperShape3D3(float m, float a, float b, float osc){
  this.m = m;
  this.a = a;
  this.b = b;
  this.total = 75;
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
  globe = new PVector[76][76];

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


osc += 0.01;
m = map(sin(osc), -1, 1, 1, 4);
}
void display(){
  
stroke(shapeColor);
strokeWeight(0.3);
noFill();
 
pushMatrix();
translate(xShape+shapeMovementVelocity,yShape, zShape); 
rotateX(xRotation);
rotateY(yRotation);
rotateZ(zRotation);
  
  
  
for (int i = 0; i < total+1; i++) {
    float lat = map(i, 0, total, -HALF_PI, HALF_PI);
    float r2 = supershape(lat, m, 0.5, 0.2, 0.2);
    //float r2 = supershape(lat, 2, 10, 10, 10);
    for (int j = 0; j < total+1; j++) {
      float lon = map(j, 0, total, -PI, PI);
      float r1 = supershape(lon, 0.2, 0.1, 1.7, 1.7);
      //float r1 = supershape(lon, 8, 60, 100, 30);
      float x = shapeSize * r1 * cos(lon) * r2 * cos(lat);
      float y = shapeSize * r1 * sin(lon) * r2 * cos(lat);
      float z = shapeSize * r2 * sin(lat);
      globe[i][j] = new PVector(x, y, z);
    }
  }
for (int i = 0; i < total; i++) {
    //float hu = map(i, 0, total, 0, 255*6);
    //fill((hu + offset) % 255 , 255, 255);
    beginShape(TRIANGLE_STRIP);
    for (int j = 0; j < total+1; j++) {
      PVector v1 = globe[i][j];
      vertex(v1.x, v1.y, v1.z);
      PVector v2 = globe[i+1][j];
      vertex(v2.x, v2.y, v2.z);
    }
    endShape();
  }
popMatrix();
strokeWeight(4);
}

float supershape(float theta, float m, float n1, float n2, float n3) {
  float t1 = abs((1/a)*cos(m * theta / 4));
  t1 = pow(t1, n2);
  float t2 = abs((1/b)*sin(m * theta/4));
  t2 = pow(t2, n3);
  float t3 = t1 + t2;
  float r = pow(t3, - 1 / n1);
  return r;
}
}
