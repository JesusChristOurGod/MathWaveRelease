class Sponge implements GrafOBJ{
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
  ArrayList<Box> sponge;
  


  Sponge(){
   sponge = new ArrayList<Box>();

  // Star with one
  Box b = new Box(0, 0, 0, shapeSize);
  sponge.add(b);
  for (int i=1; i<3; i++){
  // Generate the next set of boxes
  ArrayList<Box> next = new ArrayList<Box>();
  for (Box c : sponge) {
    ArrayList<Box> newBoxes = c.generate();
    next.addAll(newBoxes);
  }
  sponge = next;
  }
   
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
    // An array of Box objects
  

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
  stroke((colors[5]+120)%360,100,100);
  strokeWeight(1);
   pushMatrix();
    translate(xShape+shapeMovementVelocity,yShape, zShape);
    rotateX(xRotation);
    rotateY(yRotation);
    rotateZ(zRotation);
    fill(color(colors[5],100,100));

    
    for (Box b : sponge) {
    b.show();
    }
    
   popMatrix();
   noFill();
  }
}
class Box {
  PVector pos;
  float r;

  Box(float x, float y, float z, float r_) {
    pos = new PVector(x, y, z);
    r = r_;
  }

  ArrayList<Box> generate() {
    ArrayList<Box> boxes = new ArrayList<Box>();
    for (int x = -1; x < 2; x++) {
      for (int y = -1; y < 2; y++) {
        for (int z = -1; z < 2; z++) {
          int sum = abs(x) + abs(y) + abs(z);
          float newR = r/3;
          if (sum > 1) {
            Box b = new Box(pos.x+x*newR, pos.y+ y*newR, pos.z+z*newR, newR);
            boxes.add(b);
          }
        }
      }
    }
    return boxes;
  }

  void show() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    
    box(r);
    popMatrix();
  }
}
