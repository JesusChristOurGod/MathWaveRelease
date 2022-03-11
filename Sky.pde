class Sky {
float skyColor;

Sky(float skyColor){
  this.skyColor = skyColor;
}

void display(){
loadPixels();
// Loop through every pixel column
for (int x = 0; x < width; x++) {
   // Loop through every pixel row
  for (int y = 0; y < height; y++) {
      // Use the formula to find the 1D location
      int loc = x + y * width;
      pixels[loc] = color(skyColor,95, map(y , 0, height, 0, 50));
   }
}
updatePixels();
}
}
