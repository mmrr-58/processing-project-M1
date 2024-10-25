class EventHandler {
  Sky sky;  

  EventHandler() {
    sky = new Sky();  // Initialize the sky 
  }

  void triggerEvent() {
    sky.change();  // Call the sky 
  }

  void updateSky() {
    boolean isDay = sky.update();    // Update sky and return time of day
    sky.display();   // Display sky
  }
}
