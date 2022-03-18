class Terrain {
  int cols;
  int rows;
  int scl = 20;
  int w = 1000;
  int h = 1000;
  float flying = 0;
  float terrainVelocity = 0.045;
  float[][] terrain;
  int terrainAmplitude = 40;
  color strokeColor = color (255);
  color terrainColor = color (0);
  
  Terrain() {
    cols = w/scl;
    rows = h/scl;
    terrain = new float[cols][rows];
  }
  
  Terrain(color strokeColor, color terrainColor) {
    this.strokeColor = strokeColor;
    this.terrainColor = terrainColor;
    cols = w/scl;
    rows = h/scl;
    terrain = new float[cols][rows];
  }
  
  void calculating() {
    flying-=terrainVelocity;
    float yoff = flying;
    for (int y = 0; y<rows; y++){
      float xoff = 0;
      for (int x = 0;  x<cols; x++){
        terrain[x][y] = map(noise(xoff,yoff), 0 ,1, -terrainAmplitude, terrainAmplitude);
        xoff+=0.3;
       }
      yoff+=0.3;
    }
  }


  void display() {
    stroke(strokeColor);
    strokeWeight(2);
    fill(terrainColor);
   
    pushMatrix();
    rotateX(PI/2.3);
    translate(-w/2,-h/2+500);
    for (int y = 0; y<rows-1; y++){
      beginShape(TRIANGLE_STRIP);
      for (int x = 0;  x<cols; x++){
        vertex(x*scl, y*scl, terrain[x][y]);
        vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
      }
      endShape();
    }
    popMatrix();
  }
}
