EventHandler events;

void setup() {
  size(1000, 700);
  events = new EventHandler(width, height);  //  Initialize the EventHandler
}

void draw() {
  events.display();  // Display and update the sky and door
}

// Handle key press to trigger events
void keyPressed() {
  if (key == ' ') {
    events.triggerSky();  //  Trigger the sky change when spacebar is pressed
  }
  if (key == 'o') {
    events.triggerDoor();  //  Trigger the door change when key "o" is pressed
  }
  if (key == 'l'){
    events.toggleLights(); // 
  }
}
