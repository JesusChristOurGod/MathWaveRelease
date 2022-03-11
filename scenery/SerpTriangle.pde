class SerpTriangle implements GrafOBJ{
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

  float shapeSize=300;
  color shapeColor = color(200, 100,58);
  float xRotation;
  float yRotation;
  float zRotation;
  float xRotationSpeed = 0;
  float yRotationSpeed = 0.0008; 
  float zRotationSpeed = 0.0002;
     int depth   = 6;  // recursion depth

 

  SerpTriangle() {
   
   
  }
  
  void setuping(float xShape, float yShape, float zShape, int shapeMovementAmplitude, float shapeMovementAcceleration, int shapeShrinkingAmplitude, float shapeShrinkingAcceleration, float shapeSize, color shapeColor, float xRotation, float yRotation, float zRotation, float xRotationSpeed, float yRotationSpeed, float zRotationSpeed) {
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
  
  void display(){
    stroke(shapeColor);
    strokeWeight(1);
    
    pushMatrix();
    translate(xShape,yShape, zShape);
    rotateX(xRotation);
    rotateY(yRotation);
    rotateZ(zRotation);

    PVector startPoint = new PVector(150.0/600*shapeSize, 183.7/600*shapeSize, 173.2/600*shapeSize);

    //actually drawing the shape
    sierpinski(startPoint, depth);
    popMatrix();
  }
  void sierpinski(PVector currentPoint, int currentDepth)
{
 
// 3D Sierpinski tetrahedron vertices
PVector [] coord = {
  new PVector(   0, 0, 0), 
  new PVector( 300.0/600*shapeSize, 0, 0), 
  new PVector( 150.0/600*shapeSize, 0, -260.0/600*shapeSize), 
  new PVector( 150.0/600*shapeSize, -245.0/600*shapeSize, -86.6/600*shapeSize)
};
int verts = 4;

 
// "random" start point (mid point)
  if (currentDepth == 0) {
    
    point (currentPoint.x-150.0/600*shapeSize, 245.0/1700*shapeSize+currentPoint.y, 260.0/1700*shapeSize+currentPoint.z);
    
    return;
  }
  for (int v=0; v<verts; v++) {
    sierpinski(new PVector(
        (currentPoint.x+coord[v].x)/2,
        (currentPoint.y+coord[v].y)/2,
        (currentPoint.z+coord[v].z)/2),
      currentDepth-1);
  }
}
}
