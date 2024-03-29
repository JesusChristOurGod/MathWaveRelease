
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
float frames = 0;
float plane;
int folder = 0;



void setup(){
  size (960, 720, P3D);
  colorMode(HSB, 360,100,100,100);
  setColors();
  //lights();
  frameRate(60);

  try{
  folder = Integer.parseInt(args[0]);
  }catch(Exception e){
    folder = -1;
  }

  plane=random(1);
  sun = new Sun();
  terrain = new Terrain();
  if (plane>0.5){
    craft = new Craft(0.3);
  }else{
    ufo = new UFO(0.3);
  }
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
  if (plane>0.5){
    craft.calculating();
  }else{
    ufo.calculating();
  }
  
  sky.display();
  for (int i = 0; i < stars.length; i++) {
    stars[i].update();
    stars[i].show();
  } 
  //drawing terrain
  terrain.display();
  //drawing engine
  if (plane>0.5){
    craft.display();
  }else{
    ufo.display();
  }
  shape1.calculating();
  shape1.display();

  
  shape2.calculating();
  shape2.display();
  //drawing sun
  sun.display();


  
  shape2.calculating();
  shape2.display();
  //drawing sun
  sun.display();
if (frames < 1800 && folder!= -1){
  saveFrame("render"+folder+"/output_####.png");
  
  frames++;
}
else if(folder != -1){
    exit();
}
}
