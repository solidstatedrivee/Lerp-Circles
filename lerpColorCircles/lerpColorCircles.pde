color from, to, interp;
float imap, hueRange, satRange, brightRange;

void setup() {
  size(500, 500);
  background(128);
  hueRange = 360;
  satRange = 100;
  brightRange = 100; 
  colorMode(HSB, hueRange, satRange, brightRange);
  frameRate(15);
}

void draw() {
  renderCircle(115, 85, 100, 5);
  renderCircle(250, 450, 225, 7);
  renderCircle(325, 115, 80, 4);
}

void renderCircle(float x, float y, float diam, float layers) {
  from = color(random(hueRange), 100, 100);
  to = color(random(hueRange), 100, 100);
  float layersDiam = diam/layers;
  x = map(x, 0, width, diam/2, width-diam/2);
  y = map(y, 0, height, diam/2, height-diam/2);
  for (int i = 0; i < layers; i++) {  
    noStroke();
    imap = map(i, 0, 10, 0, 1);
    interp = lerpColor(from, to, imap);
    fill(interp);
    ellipse(x, y, diam - i*layersDiam, diam - i*layersDiam);
  }
}
