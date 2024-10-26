class EventHandler {
  Sky sky;
  Door door;
  Facade facade;

  boolean isDay;  // Track whether it's day or night

  EventHandler(int sizeX, int sizeY) {
    sky = new Sky(sizeX, sizeY);  // Initialize the sky
    door = new Door(((sizeX / 10) * 4) + 30, sizeY - 310, ((sizeX / 10) * 6) - 30, sizeY - 310, ((sizeX / 10) * 6) - 30, 555, ((sizeX / 10) * 4) + 30, 555);
    facade = new Facade(sizeX, sizeY); // Initialize the Facade
  }

  void display() {
    isDay = sky.update();  // Update sky and check if it's day
    sky.display();         // Display the sky
    facade.display();      // Display the facade
    door.display();        // Display the door
  }

  void triggerSky() {
    sky.change();  // Trigger sky change
    door.closed(); // Close the door if it's nighttime
  }

  void triggerDoor() {
    if (isDay) {
      door.open();  // Open the door if it's daytime
    }
  }
}
