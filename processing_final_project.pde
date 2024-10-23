EventHandler events;
Facade facade;

void setup() {
  size(1000, 700);
  events = new EventHandler();  // Initialize the EventHandler
  facade = new Facade(width, height);  // Initialize the Facade
  
}

void draw() {
  events.updateSky();  
  facade.display();
}

// Handle spacebar press to trigger the event
void keyPressed() {
  if (key == ' ') {  
    events.triggerEvent();  
  }
}
