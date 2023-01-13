class Player {
  PImage image;  // Variable to store the player image
  int x, y;  // Variables to store the player's position

  Player() {  
    image = loadImage("images/Knight 1.png");  // Load the player image
  }

  void update() {  // Method to update the player's position
    x = mouseX;  // Set the player's x position to the mouse's x position
    y = mouseY;  // Set the player's y position to the mouse's y position
  }

  void draw() {  // Method to draw the player on the canvas
    image(image, x, y);  // Draw the player image
  }

  void attack(Enemy enemy) {  // Method to attack an enemy
  if (mousePressed && mouseButton == LEFT) {  // Check if the left mouse button is pressed
    if (dist(x, y, enemy.x, enemy.y) < 50) {  // Check if the mouse is within range of the enemy
      enemy.x = -100;  // Set the enemy's x position off the canvas to remove it from the game
      enemy.y = -100;  // Set the enemy's y position off the canvas to remove it from the game
      score += 1;
    if(score > dataManager.highScore) {
    dataManager.saveData(score);
    if (dataManager.newHighScore){
    dataManager.newHighScore = false; // reset the variable
    }
    } 
  }
}
}
}
