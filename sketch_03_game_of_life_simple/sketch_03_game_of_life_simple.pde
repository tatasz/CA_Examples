//variables for current and next state
int A[][];
int B[][];

//initial state
void setup() { //<>//
  size(500, 500);
  //initialize A and B
  A = new int[width][height];
  B = new int[width][height];
  //fill A with random values and B with 0s
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      A[i][j] = (random(1) < 0.9) ? 0 : 1;
      B[i][j] = 0;
    }
  }
}

//iterative part
void draw() {
  //for each cell
  for (int i = 1; i < width - 1; i++) { //<>//
    for (int j = 1; j < height - 1; j++) {
      //number of living cells in the neighborhood
      int sum = A[i - 1][j - 1] + A[i - 1][j] + A[i - 1][j + 1] + 
                A[i][j - 1] + A[i][j + 1] + 
                A[i + 1][j - 1] + A[i + 1][j] + A[i + 1][j + 1]; //<>//
      //apply rule
      if (A[i][j] == 1) {
        if (sum >= 2 & sum <= 3) B[i][j] = 1;
        else B[i][j] = 0;
      } else {
        if (sum == 3) B[i][j] = 1;
        else B[i][j] = 0;        
      }
    }
  }
  loadPixels();
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      //fill A with B values
      A[i][j] = B[i][j];
      //draw cell
      pixels[i + j * width] = color(A[i][j] * 255);
    }
  }
  updatePixels();
}
