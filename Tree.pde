//  Finally the Tree is the class used to denote the tree that is outside of the store, 
//  and that changes with each passing day. The main methods are display and grow. 
//  Where grow is used to increase the amount of branches by each passing day.
//  This code was given as an example in one of the lectures, we thought it would be fun to add what the teacher showed. 
//  It's his code


class Tree {
  float posX, posY;
  float scale = 0.5;            // Larger initial scale for better spread
  float stemHeight = 80;        // Larger initial stem height for faster visible growth

  float maxScale = 0.6;         // Control maximum scale for outward spread
  float maxStemHeight = 300;    // Lower maximum stem height for bushier tree
  float growScale = 0.01;       // Faster growth in scale
  float growStemHeight = 8.0;   // Faster stem height growth

  Tree(float x, float y) {
    posX = x;
    posY = y;
  }

  void display() {
    drawTree(new PVector(posX, posY), new PVector(0, -stemHeight), 0);
  }

  void grow() {
    // Increase stem height and scale up to the maximum values
    stemHeight = min(stemHeight + growStemHeight, maxStemHeight);
    scale = min(scale + growScale, maxScale);
  }

  void drawTree(PVector pos, PVector heading, int depth) {
    if (heading.mag() < 8 || depth > 6) return;  // Stop condition for shorter tree with fewer levels

    PVector newPos = pos.copy().add(heading);

    color c = lerpColor(#672D00, #358623, depth * 1.0 / 6);  // Adjust depth for color transition

    stroke(c);
    strokeWeight(max(1, 0.1 * heading.mag()));
    line(pos.x, pos.y, newPos.x, newPos.y);

    // Adjust new heading with wider initial angle for outward growth
    PVector newHeading = heading.copy().mult(scale).rotate(radians(-30)); // Start with a wider angle

    // Increase branches and adjust rotation for better outward spread
    for (int i = 0; i < 3; ++i) {  // Use 3 branches for a balanced spread
      drawTree(newPos, newHeading, depth + 1);
      newHeading.rotate(radians(30));  // Wider angle between branches for outward growth
    }
  }
}
