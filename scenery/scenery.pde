//test

Sun sun;
GrafOBJ shape1;
GrafOBJ shape2;
Terrain terrain;
Craft craft;
UFO ufo;
Star[] stars = new Star[500];
Sky sky;
float[] colors = new float[6];
color backgroundColor = color(0);
boolean recording = false;
float frames;





void setup(){
  size (960, 720, P3D);
  colorMode(HSB, 360,100,100,100);
  setColors();
  //lights();
  frameRate(60);
  
  sun = new Sun();
  terrain = new Terrain();
  //craft = new Craft(0.3);
  ufo = new UFO(0.3);

  Randomizer rnd = new Randomizer();
  shape1 = rnd.generate();
  shape2 = rnd.generate();
 

  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  
  sky = new Sky(colors[0]);
  
}

void draw(){
  translate(width/2,height/2);
  //calculating for terrain
  terrain.calculating();
  //calculating for sun
  sun.calculating();
  //craft.calculating();
  ufo.calculating();
    //preparing the screen
  //background(backgroundColor);
  sky.display();
  
  //calculating for shape

  
  //drawing terrain
  terrain.display();
  //drawing shape
  
  //drawing engine
  //craft.display();
  
  ufo.display();

shape1.calculating();
shape1.display();

shape2.calculating();
shape2.display();
//drawing sun
  sun.display();
  

  
  
  //drawing stars
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  } 
//if (recording){
//  saveFrame("render/output_####.png");
  
//  frames++;
//  println(frames/60 + "seconds recorded");
//}
}

void mouseClicked(){

  recording = true;

}
