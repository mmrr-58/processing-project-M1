//  Lights is the class used to display and toggle the lights on and off. 
//  The main methods include the drawing of lamp groups, as well as a change in some values 
//  so that they are able to turn on at night.


class Lights {
  boolean lightsOn;
  color lightBulb, glaze;
  int x, y, glow;

  Lights(int sizeX, int sizeY) {
    x = sizeX;
    y = sizeY;
    lightsOn = false;
    lightBulb = #b5b5b5;
    glaze = #b8b597;
    glow = 0;
  }

  void display() {
    lamp1();
    lamp2();
    lamp3();
  }

  void toggle() {
    if (lightsOn) {
      lightBulb = #F5F5F5;
      glow = 15;
      glaze = #fffbd4;
      lightsOn = false;
    } else {
      lightBulb = #b5b5b5;
      glaze = #b8b597;
      glow = 0;
      lightsOn = true;
    }
  }

  void toggleOff() {
    lightBulb = #b5b5b5;
    glaze = #b8b597;
    glow = 0;
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
    fill(lightBulb, glow);
    ellipse(150, 180, 300, 300);
    popMatrix();
  }

  void lamp2() {
    pushMatrix();
    translate(x/7, (2*y)/5);
    scale(0.6);

    // Yellow lamp
    fill(#333232);
    rect(-3, -100, 6, 100);
    fill(#fffb17);
    ellipse(0, 0, 92, 40);
    quad(-40, -10, -10, -40, 10, -40, 40, -10);
    quad(-15, -45, -10, -40, 10, -40, 15, -45);
    ellipse(0, -45, 30, 10);
    fill(glaze);
    ellipse(0, 16, 40, 5);
    fill(#fffbd4, glow);
    ellipse(0, 0, 200, 200);

    // Blue lamp
    pushMatrix();
    translate(150, 0);
    fill(#333232);
    rect(-3, -100, 6, 100);
    fill(#17d8ff);
    ellipse(0, 0, 92, 40);
    quad(-40, -10, -10, -40, 10, -40, 40, -10);
    quad(-15, -45, -10, -40, 10, -40, 15, -45);
    ellipse(0, -45, 30, 10);
    fill(glaze);
    ellipse(0, 16, 40, 5);
    fill(#fffbd4, glow);
    ellipse(0, 0, 200, 200);
    popMatrix();

    // Orange lamp
    pushMatrix();
    translate(300, 0);
    fill(#333232);
    rect(-3, -100, 6, 100);
    fill(#ffb914, 90);
    ellipse(0, -30, 100, 90);
    fill(#fcb91c);
    quad(-45, -10, -10, -75, 10, -75, 45, -10);
    quad(-45, -10, -25, 30, 25, 30, 45, -10);
    fill(glaze);
    ellipse(0, 30, 46, 5);
    fill(#fffbd4, glow);
    ellipse(0, 0, 200, 200);
    popMatrix();

    popMatrix();
  }

  void lamp3() {
    pushMatrix();
    translate(x/5, ((3*y)-40)/4);
    scale(0.4);
    fill(#c2c2c2);
    rect(-5, 50, 10, 50);
    fill(lightBulb);
    ellipse(0, 50, 30, 30);
    fill(lightBulb, glow);
    ellipse(0, 0, 350, 350);
    fill(#FFFFFF, 80);
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
    fill(lightBulb, glow);
    ellipse(0, 0, 350, 350);
    fill(#FFFFFF, 80);
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
