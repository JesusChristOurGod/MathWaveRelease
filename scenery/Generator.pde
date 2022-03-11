static class Generator {

 
  Generator() {
    
  }
  
  static GrafOBJ generate(GrafOBJ obj,float xShape, float yShape, float zShape, int shapeMovementAmplitude, float shapeMovementAcceleration, int shapeShrinkingAmplitude, float shapeShrinkingAcceleration, float shapeSize, color shapeColor, float xRotation, float yRotation, float zRotation, float xRotationSpeed, float yRotationSpeed, float zRotationSpeed) {
    obj.setuping(xShape, yShape, zShape,shapeMovementAmplitude, shapeMovementAcceleration, shapeShrinkingAmplitude, shapeShrinkingAcceleration, shapeSize, shapeColor, xRotation, yRotation, zRotation, xRotationSpeed, yRotationSpeed, zRotationSpeed);
    return obj;
  }
  

}

class Randomizer {
    int randShape = -1;
    int side = -1;
    int col = 4;
  
    GrafOBJ generate() {
    
     if(randShape == -1) randShape = int(random(0,28));
     else {
       side = 1;
       col = 5;
       int rs = randShape;
       while(rs == randShape) {
         randShape = int(random(0,28));
       }
     
     }
    
    
     switch(randShape){
    case 0:
      return Generator.generate(new Cube(), side*300, -150, 10, 60, 0.1, 200, 0.1, 50, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
      
    case 1:
      return Generator.generate(new StarShape(), side*300, -150, 10, 60, 0.1, 200, 0.1, 80, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
      
    case 2:
      return Generator.generate(new Merkaba(), side*300, -150, 10, 60, 0.1, 200, 0.1, 65, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    
    case 3:
      return Generator.generate(new Octahedron(), side*300, -150, 10, 60, 0.1, 200, 0.1, 65, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
     
    case 4:
      return Generator.generate(new Heart(), side*300, -150, 10, 60, 0.1, 200, 0.1, 50, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
     
    case 5:
      return Generator.generate(new Tetrahedron(), side*300, -150, 10, 60, 0.1, 200, 0.1, 60, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
      
    case 6:
      return Generator.generate(new SuperShape(), side*300, -150, 10, 60, 0.1, 200, 0.1, 70, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
      
    case 7:
      return Generator.generate(new Sphere(), side*300, -150, 10, 60, 0.1, 200, 0.1, 50, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
      
    case 8:
      return Generator.generate(new StrangeHedron1(), side*300, -150, 10, 60, 0.1, 200, 0.1, 50, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    
    case 9:
      return Generator.generate(new StrangeHedron2(), side*300, -150, 10, 60, 0.1, 200, 0.1, 50, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
      
    case 10:
      return Generator.generate(new StrangeHedron3(), side*300, -150, 10, 60, 0.1, 200, 0.1, 50, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 11:
      return Generator.generate(new Square(), side*300, -150, 10, 60, 0.1, 200, 0.1, 50, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 12:
      return Generator.generate(new Circle(), side*300, -150, 10, 60, 0.1, 200, 0.1, 50, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 13:
      return Generator.generate(new Triangle(), side*300, -150, 10, 60, 0.1, 200, 0.1, 50, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 14:
      return Generator.generate(new Veneric(), side*300, -150, 10, 60, 0.1, 200, 0.1, 40, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 15:
      return Generator.generate(new Mars(), side*300, -150, 10, 60, 0.1, 200, 0.1, 40, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 16:
      return Generator.generate(new Trans(), side*300, -150, 10, 60, 0.1, 200, 0.1, 40, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 17:
      return Generator.generate(new Smile(), side*300, -150, 10, 60, 0.1, 200, 0.1, 55, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 18:
      return Generator.generate(new HavaNagila(), side*300, -150, 10, 60, 0.1, 200, 0.1, 55, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 19:
      return Generator.generate(new SuperShape3D1(), side*300, -150, 10, 60, 0.1, 200, 0.1, 80, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 20:
      return Generator.generate(new SuperShape3D2(), side*300, -150, 10, 60, 0.1, 200, 0.1, 80, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 21:
      return Generator.generate(new SuperShape3D3(), side*300, -150, 10, 60, 0.1, 200, 0.1, 80, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 22:
      return Generator.generate(new SerpTriangle(), side*300, -150, 10, 60, 0.1, 200, 0.1, 230, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 23:
      return Generator.generate(new Sponge(), side*300, -150, 10, 60, 0.1, 200, 0.1, 90, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 24: 
      return Generator.generate(new WindRose(), side*300, -150, 10, 60, 0.1, 200, 0.1, 90, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 25:
      return Generator.generate(new Pacific(), side*300, -150, 10, 60, 0.1, 200, 0.1, 60, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 26:
      return Generator.generate(new MaurerRose(), side*300, -150, 10, 60, 0.1, 200, 0.1, 70, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);
    case 27:
      return Generator.generate(new LGBT(), side*300, -150, 10, 60, 0.1, 200, 0.1, 100, color(colors[col],100,100), 0, 0, 0, 0, 0.008, 0.002);

    default:
      return null;
     }
      
    }


}
