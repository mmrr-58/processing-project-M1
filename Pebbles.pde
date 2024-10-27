class Pebble {
  float posX, posY;
  color pebbleColor;
  float scale;

  Pebble(float posX, float posY, color pebbleColor, float scale) {
    this.posX = posX;
    this.posY = posY;
    this.pebbleColor = pebbleColor;
    this.scale = scale;
  }

  void display() {
    fill(pebbleColor);
    noStroke();
    ellipse(posX, posY, scale * 5, scale * 3);
  }
}
