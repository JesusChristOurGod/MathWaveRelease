class LGBT implements GrafOBJ{
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
  float xRotationSpeed = 0;
  float yRotationSpeed = 0.0008; 
  float zRotationSpeed = 0.0002;
  float red = random(340, 360);
  float orange = random(15, 41);
  float yellow = random(46, 70);
  float green = random(71, 148);
  float blue = random(202, 253);
  float purple = random(260, 288);
  float[] massiv = {red, orange, yellow, green, blue, purple};


  LGBT(){
   
   
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
  strokeWeight(10);
  stroke(shapeColor);
   pushMatrix();
    translate(xShape+shapeMovementVelocity,yShape, zShape);
    rotateX(xRotation);
    rotateY(yRotation);
    rotateZ(zRotation);
    for (int j = 1; j<7; j++){
      beginShape();
      stroke(massiv[j-1], 100, 100, 100);
      for (float i=-shapeSize; i<shapeSize; i+=0.1){
      //fill(massiv[j-1], 100, 100, 100);
      float x = i/2;
      float y = 0.133*shapeSize*sin(0.025*i);
      //fill(massiv[j-1], 100, 100, 100);
      vertex(x,y+j*9.5);
      //noFill();
      }
      endShape();
    
  }
  popMatrix();
  strokeWeight(4);
}
}
