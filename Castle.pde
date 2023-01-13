class Castle {
  PImage image;  // Variable to store the castle image
  int x, y;  // Variables to store the castle's position
  int health;  // Variable to store the castle's health
  int maxHealth;  // Maximum health value of the castle

  Castle() {  
    imageMode(CENTER);
    image = loadImage("images/castle2.png");  // Load the castle image
    x = width/2;  // Set the castle's x position to the center of the canvas
    y = height/2;  // Set the castle's y position to the center of the canvas
    health = 100;  // Set the castle's initial health to 100
    maxHealth = 100;
  }
  void drawHealthBar() {  
    noStroke();  // Don't draw a stroke around the health bar
    fill(255, 0, 0);  // Set the fill color to red
    rect(x - 50, y - 60, 100, 10);  // Draw the background of the health bar
    fill(0, 255, 0);  // Set the fill color to green
    float healthPercent = health / (float)maxHealth;  // Calculate the percentage of health remaining
    rect(x - 50, y - 60, healthPercent * 100, 10);  // Draw the foreground of the health bar
  }

  void draw() {  // Method to draw the castle on the canvas
    image(image, x, y);  // Draw the castle image
    drawHealthBar();  // Call the method to draw the health bar
  }
}
