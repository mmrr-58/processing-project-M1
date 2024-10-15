class EventHandler {
  int posX, posY;

  EventHandler() {
    posX = 0;
    posY = 0;
  }

  void updatePositions() {
    posX = mouseX;
    posY = mouseY;
    event();
  }
  void event() {
    if (posX>=(8*width)/10) {
      if (posY<=(2*height)/10) {
        sky.change();
      }
    }
  }
}
