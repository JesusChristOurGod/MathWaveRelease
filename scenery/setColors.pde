void setColors(){
float sky, grad1, grad2;
float h = random(0,190);
float s = random(50,90);
float b = random(50,90);

sky = random(230,270);
if (random(2)>1){
grad1 = random(0, 50);
} else {
grad1 = random(310, 360);
}
if (random(2)>1){
grad2 = random(0, 50);
} else {
grad2 = random(310, 360);
}
colors[0] = sky;
colors[1] = grad1;
colors[2] = grad2;
colors[3] = random(0,180);
colors[4] = random(0,180);;
colors[5] = random(0,180);;
//print("sh");
}
