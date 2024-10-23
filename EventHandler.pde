class EventHandler {
  Sky sky;  

  EventHandler() {
    sky = new Sky();  // Initialize the sky 
  }

  void triggerEvent() {
    sky.change();  // Call the sky 
  }

  void updateSky() {
    sky.update();    // Update sky 
    sky.display();   // Display sky
  }
}
