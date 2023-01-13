class DataManager {
  int highScore; 
  String fileName; 
  boolean newHighScore; 

  DataManager(String fileName) {
    this.fileName = fileName;
    loadData(); // Call the loadData method
    newHighScore = false; // initially set to false
  }

  // Method to load data from the file
  void loadData() {
    String[] data = loadStrings(fileName); // Load the data from the file into a String array
    if (data.length > 0) {
      highScore = Integer.parseInt(data[0]); // Convert the first element of the array to an int and store it in the highScore variable
    } else {
      highScore = 0; // If the file is empty, set the highScore to 0
    }
  }

  // Method to save data to the file
  void saveData(int currentScore) {
    if (currentScore > highScore) {
      highScore = currentScore;
      newHighScore = true; // new high score is set
    }
    String[] data = new String[1]; // Create a new String array with one element
    data[0] = str(highScore); // Convert the highScore variable to a String and store it in the first element of the array
    saveStrings(fileName, data); // Save the data to the file
  }
}
