class Lights {
  boolean lightsOn;
  color lightBulb, glaze;
  int x, y, glow;

  Lights(int sizeX, int sizeY) {
    x = sizeX;
    y = sizeY;
    lightsOn = false;
  }

  void display() {
    print(lightBulb);
    lamp1();
    lamp3();
  }

  void toggle() {
    if (lightsOn!= true) {
      lightBulb = #000000;
      glaze = //Add glaze eventually
        glow = 20;
      lightsOn = true;
    }
    if (lightsOn) {
      lightBulb = #F5F5F5;
      lightsOn = false;
    }
  }

void lamp1() {
  pushMatrix();
  translate((3*x)/4, y/2);
  scale(0.4);
  for (int i = 50; i<=250; i= i+50) {
    if (i%100==0) {
      fill(#000000);
      rect(i-3, 100, 6, 50);
      fill(lightBulb);
      ellipse(i, 150, 30, 30);
      fill(#F5F5F5, 80);
      ellipse(i, 150, 50, 50);
    } else {
      fill(#000000);
      rect(i-3, 100, 6, 80);
      fill(lightBulb);
      ellipse(i, 180, 30, 30);
      fill(#F5F5F5, 80);
      ellipse(i, 180, 50, 50);
    }
  }
  fill(#000000);
  rect(147, 65, 6, 100);
  fill(#858585);
  rect(0, 100, 300, 20);
  popMatrix();
}

void lamp3() {
  pushMatrix();
  translate(x/5, ((3*y)-40)/4); //change height and width
  scale(0.4);
  fill(#c2c2c2);
  rect(-5, 50, 10, 50);
  fill(lightBulb);
  ellipse(0, 50, 30, 30);
  fill(#FFFFFF, 95);
  ellipse(0, 0, 200, 200);
  stroke(#000000);
  strokeWeight(4);
  noFill();
  bezier(-100, 0, -70, 20, -40, -10, -70, -70);
  bezier(-30, 95, 0, 70, -50, -30, 20, -98);
  bezier(100, 0, -50, -30, 80, 60, 30, 95);
  pushMatrix();
  translate(200, 50);
  noStroke();
  fill(#c2c2c2);
  rect(-5, 0, 10, 50);
  fill(lightBulb);
  ellipse(0, 0, 30, 30);
  fill(#FFFFFF, 95);
  ellipse(0, 0, 100, 100);
  stroke(#000000);
  strokeWeight(4);
  noFill();
  bezier(-50, 0, -30, -60, 40, 30, 40, -30);
  bezier(-30, 38, -10, 0, 40, 20, 20, 43);
  popMatrix();
  popMatrix();
}

}
