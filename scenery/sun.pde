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
  PImage s;
  
  

  Sun() {
  if (random(2)>1){
       s = loadImage("data/SunPNG.png");
  } else {
       s = loadImage("data/SunLinear.png");

  }
  s.loadPixels();
     for(int x = 0; x < s.width; x++){
       for(int y = 0; y < s.height; y++){
         if(alpha(s.get(x,y)) != 0){
             int loc = x + y * s.width;
             s.pixels[loc] = color(map(y,s.height, -s.height, colors[1], colors[2]), 100, 100);
             
       }
       
       }
     
     }
     s.updatePixels();
  
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
     
     
      image(s, -150,-200+sunVelocity, 300,300);
    
   }
}
