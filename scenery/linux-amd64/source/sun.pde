class Sun {
  float radius =170;
  float angle = PI/180;
  float sunVelocity =0;
  float centerX = 0;
  float centerY =0;
  int count = 0;
  int sunAmplitude = 200;
  boolean direction;
  color from = color(0, 0, 0);
  color to = color(255, 255, 255);

  Sun() {
  
  }
  
  Sun(color from, color to) {
    this.from = from;
    this.to = to;
  }
  
  void calculating() {
    if (direction==true){
      sunVelocity+=0.1;
      count++;
    }
    else{
      sunVelocity-=0.1;
      count--;
    }
    if (count==sunAmplitude){
     direction =false;
    }
    if (count==-sunAmplitude){
      direction =true;
    }  
   }
   
   void display() {
    noFill();
    stroke(1.8* map(8, 0, 17, 0,255),0.6 *map(8, 0, 17, 0,255),1.1*map(8, 0, 17, 0,255));
    circle(centerX, centerY+sunVelocity,  radius*2);
    for (int i =0; i<18; i=i+1) {
      angle+=PI/18;
      float lineLen = 2*radius*sin(angle/2);
      float lineHeight = sqrt(radius*radius-(lineLen/2)*(lineLen/2));
      strokeWeight(1);
      stroke(1.8* map(i, 0, 17, 0,255),0.6 *map(i, 0, 17, 0,255),1.1*map(i, 0, 17, 0,255));
      line(-lineLen/2, lineHeight+sunVelocity, lineLen/2, lineHeight+sunVelocity);
      line(-lineLen/2, -lineHeight+sunVelocity, lineLen/2, -lineHeight+sunVelocity);
    }
   }
}
