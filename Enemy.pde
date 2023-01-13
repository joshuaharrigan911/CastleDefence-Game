class Enemy {
  PImage image;  // Variable to store the enemy image
  float x, y;  // Variables to store the enemy's position
  float dx, dy;  // Variables to store the enemy's movement
  Castle castle;  // Variable to store a reference to the castle object
  int attackPoints;
  int currentImage = 0;
  float originalX, originalY;
  float originalDX, originalDY;
  
  Enemy(Castle castle) {  
    image = loadImage("images/enemyWalk1.png");  // Load the enemy image
    originalX = x = random(0, width);  // Set the enemy's starting x position to a random location on the canvas
    originalY = y = random(0, height);  // Set the enemy's starting y position to a random location on the canvas
    originalDX = dx = random(-5, 5);  // Set the enemy's x movement to a random value between -5 and 5
    originalDY = dy = random(-5, 5);  // Set the enemy's y movement to a random value between -5 and 5
    this.castle = castle;  
    attackPoints = 10;
  }

  void update() {
    attack();
    float angle = atan2(castle.y - y, castle.x - x);  // Calculate the angle between the enemy and the castle
    dx = cos(angle);  // Set the enemy's x movement based on the angle
    dy = sin(angle);  // Set the enemy's y movement based on the angle
    x += dx;  // Update the enemy's x position based on its movement
    y += dy;  // Update the enemy's y position based on its movement
    currentImage = (currentImage + 1) % enemyWalk.length; // cycle through the images
  }

  void draw() {  // Method to draw the enemy on the canvas
     image(enemyWalk[currentImage], x, y);
     currentImage = (currentImage + 1) % enemyWalk.length; // cycle through the images
  }
  
  
  void attack() {
  if (dist(x, y, castle.x, castle.y) < 50) {  // Check if the enemy is within range of the castle
    castle.health -= attackPoints;  // Decrement the castle's health by the enemy's attack points
  }
  }
  void reset() {
      x = originalX;
      y = originalY;
      dx = originalDX;
      dy = originalDY;
  }
}
