EventHandler events;

void setup() {
  size(800, 700);
  events = new EventHandler();  // Initialize the EventHandler
}

void draw() {
  events.updateSky();  
}

// Handle spacebar press to trigger the event
void keyPressed() {
  if (key == ' ') {  
    events.triggerEvent();  
  }
}
