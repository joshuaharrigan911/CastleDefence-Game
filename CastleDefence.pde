PImage startButton;
PImage resetButton;
PImage[] enemyWalk;
Castle castle;  // Declare a variable for the castle object
Enemy[] enemies;  // Declare an array to store the enemy objects
Player player;  // Declare a variable for the player object
DataManager dataManager;
int score = 0;  // Declare and initialize the score variable
boolean startGame = false;
boolean gameOver = false;

void setup() 
{
  size(800, 600);  // Set the size of the canvas
  enemyWalk = new PImage[4];
  enemyWalk[0] = loadImage("images/enemyWalk1.png");
  enemyWalk[1] = loadImage("images/enemyWalk2.png");
  enemyWalk[2] = loadImage("images/enemyWalk3.png");
  enemyWalk[3] = loadImage("images/enemyWalk4.png");
  startButton = loadImage("images/start_button.png");
  resetButton = loadImage("images/start_button.png");
  player = new Player();  // Create a new player object
  castle = new Castle();  // Create a new castle object
  enemies = new Enemy[5];  // Create an array to store 5 enemy objects
  dataManager = new DataManager("highscore.txt");
  for (int i = 0; i < enemies.length; i++) {  // Loop through the array
    enemies[i] = new Enemy(castle);  // Create a new enemy object and store it in the array
  }
}

void draw() {
  if (!startGame) {
    // Draw the start button and check if it's clicked
    image(startButton, width/2, height/2);
    if (mousePressed && mouseX > width/2 && mouseX < width/2 + startButton.width && mouseY > height/2 && mouseY < height/2 + startButton.height) {
      startGame = true;
    }
  } 
  else 
  {
    // Draw the game elements
    background(0, 255, 0); 
    castle.draw();  
    player.update();  
    player.draw();  
    for (int i = 0; i < enemies.length; i++) {  
      enemies[i].update();  
      enemies[i].draw();  
      player.attack(enemies[i]);  
    }
    fill(255);
    textSize(32);
    text("Score: " + score, width-200, height-50);

    if (castle.health <= 0 && !gameOver) {  
      textSize(32);  
      fill(255, 0, 0);  
      textAlign(CENTER, CENTER);  
      text("Game Over", width/2, height/2); 
      image(resetButton, width/2 - resetButton.width/2, height/2 + resetButton.height + 10);
      gameOver = true;
      if(dataManager.newHighScore) {
        text("New High Score !", width/2, height/2+50);
      }
      noLoop(); 
    }
  }
}

void mousePressed() {
    if (gameOver && mouseX > width/2 - resetButton.width/2 && mouseX < width/2 + resetButton.width/2 && mouseY > height/2 + resetButton.height + 10 && mouseY < height/2 + resetButton.height + 10 + resetButton.height) {
        reset();
    }
}
void reset() {
    for (int i = 0; i < enemies.length; i++) {
    enemies[i].reset();
}
    score = 0;
    castle.health = 100;
    gameOver = false;
    startGame = true;
    loop();
}
