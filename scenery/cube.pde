class Cube implements GrafOBJ{
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

  Cube () {
  
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
      shapeMovementVelocity+=0.25;
      shapeMovementCount++;
    }
    else{
      shapeMovementVelocity-=0.25;
      shapeMovementCount--;
    }
    if (shapeMovementCount==shapeMovementAmplitude){
      shapeMovementDirection =false;
    }
    if (shapeMovementCount==-shapeMovementAmplitude){
      shapeMovementDirection =true;
    }

    xRotation+=xRotationSpeed;
    yRotation+=yRotationSpeed;;
    zRotation += zRotationSpeed;
  }

  void display() {
    noFill();
    stroke(shapeColor);
    strokeWeight(4);
    pushMatrix();
    translate(xShape+shapeMovementVelocity, yShape, zShape);
    rotateZ(zRotation);
    rotateX(xRotation);
    rotateY(yRotation);
    beginShape(LINES);

      vertex(-shapeSize, -shapeSize, shapeSize);
      vertex(shapeSize, -shapeSize,shapeSize);
      
      vertex(shapeSize,shapeSize,shapeSize);
      vertex(-shapeSize, shapeSize, shapeSize);
      
      vertex(-shapeSize, shapeSize,-shapeSize);
      vertex(shapeSize,shapeSize,-shapeSize);
      
      vertex(shapeSize, -shapeSize, -shapeSize);
      vertex(-shapeSize, -shapeSize, -shapeSize);
      
      vertex(-shapeSize,shapeSize,shapeSize);
      vertex(-shapeSize,-shapeSize,shapeSize);
      
      vertex (shapeSize,shapeSize,shapeSize);
      vertex(shapeSize,-shapeSize,shapeSize);
      
      vertex(-shapeSize,shapeSize,-shapeSize);
      vertex(-shapeSize,-shapeSize,-shapeSize);
      
      vertex (shapeSize,shapeSize,-shapeSize);
      vertex(shapeSize,-shapeSize,-shapeSize);
      
      vertex(-shapeSize,shapeSize,shapeSize);
      vertex(-shapeSize,shapeSize,-shapeSize);
      
      vertex(shapeSize,shapeSize,shapeSize);
      vertex(shapeSize,shapeSize,-shapeSize);
      
      vertex(-shapeSize,-shapeSize,shapeSize);
      vertex(-shapeSize,-shapeSize,-shapeSize);
      
      vertex(shapeSize,-shapeSize,shapeSize);
      vertex(shapeSize,-shapeSize,-shapeSize);

    endShape();
    popMatrix();
  }
}
