PVector[] locations = new PVector[40];
PGraphics buf = createGraphics(400, 400, P2D);
float rx, ry, zf, zoomPrev;
LowPass lp = new LowPass(15);

void setup() {
  size(320, 240, P2D);
  for(int i = 0; i < locations.length; i++) {
    locations[i] = new PVector(random(0, width), random(0, height));
  }
  stroke(0, 100);
  rx = random(0.1, 1);
  ry = random(0.1, 1);
  buf.background(0, 0);
}

void draw() {
  buf.beginDraw();
  background(150);
  for(int i = 0; i < locations.length; i++) {
    buf.point(locations[i].x, locations[i].y);
    locations[i].x += random(-1, 1);
    locations[i].y += random(-1, 1);
  }
  buf.endDraw();
  zf += random(0.01);
  float zoom = noise(zf) * 700;
  lp.input(zoom);
  float dZoom = abs(lp.output - zoomPrev) / 2;
  println(dZoom);
  zoomPrev = lp.output;
  
  rx += random(0, 0.01);
  ry += random(0, 0.01);
  PImage preZoom = buf.get();
  preZoom.filter(BLUR, dZoom);
  image(preZoom, 0 - (zoom * noise(rx)), 0 - (zoom * noise(ry)), width + int(zoom) , height + int(zoom));
}


