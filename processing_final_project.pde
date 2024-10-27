//  Code for final assignment of Module 1, Intro to Programming
//
//  Assignment made by Marek Roque s3178498 and Rodrigo Gonzalez s2871688
//
//  The main class does not hold much but it's the most important, here all 
//  the interactions made directly by the user are sent to the event handler class, 
//  where the rest of the classes interact with eachother.
 

EventHandler events;

void setup() {
  size(1000, 700);
  events = new EventHandler(width, height);  // Initialize the EventHandler
}

void draw() {
  events.display();  // Display and update the sky and door
}

void keyPressed() {
  if (key == ' ') {
    events.triggerSky();  // Trigger the sky change when spacebar is pressed
  }
  if (key == 'o') {
    events.triggerDoor();  // Trigger the door change when key "o" is pressed
  }
  if (key == 'l') {
    events.toggleLights();  // Toggle lights when "l" is pressed
  }
}

void mouseClicked() {
  events.checkMouseHit(mouseX, mouseY);  // Check for clicks on bike1 and door
}
