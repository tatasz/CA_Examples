//range
int range = 7;
//constants for the rule
int b1 = 12;
int b2 = 12;
int a1 = 12;
int a2 = 12;

//variables for current and next state
int A[][];
int B[][];

//initial state
void setup() {
  size(500, 500);
  noStroke();
  //initialize A and B
  A = new int[width][height];
  B = new int[width][height];
  //fill A with random values and B with 0s //<>//
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      A[i][j] = (random(1) < 0.9) ? 0 : 1;
      B[i][j] = 0;
    }
  }
}
 
void draw() {
  //for each cell
  for (int i = range; i < width - range; i++) {
    for (int j = range; j < height - range; j++) {
      //number of living cells in the neighborhood
      int sum = 0; //<>//
      for (int ii = -range; ii <= range; ii++){
        for (int jj = -range; jj <= range; jj++){ //<>//
          sum += A[i + ii][j + jj];
        }
      }
      //apply rule
      if (A[i][j] == 1 & sum >= a1 & sum <= a2){
        B[i][j] = 1;
      } else {
        if (A[i][j] == 0 & sum >= b1 & sum <= b2){
          B[i][j] = 1;
        } else {
          B[i][j] = 0;
        }
      }
    }
  }
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      //fill A with B values
      A[i][j] = B[i][j];
      //draw cell
      fill(A[i][j] * 255);
      rect(i, j, 1, 1);
    }
  }
}
