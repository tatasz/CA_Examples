//rule parameters //<>//
int b[] = {9, 13, 19, 52}; 

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
  //fill A with random values and B with 0s
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      A[i][j] = (random(1) < 0.9) ? 0 : 1;
      B[i][j] = 0;
    }
  }
}
 
void draw() {
  //for each cell
  for (int i = 5; i < width - 5; i++) {
    for (int j = 5; j < height - 6; j++) {
      //we save the actual cell value
      int outval = A[i][j];  
      //neighborhood sum
      int sum = A[i-5][j-1]+A[i-5][j+0]+A[i-5][j+1]+A[i-4][j-3]+A[i-4][j-2]+A[i-4][j+2]+A[i-4][j+3]+
                 A[i-3][j-4]+A[i-3][j-1]+A[i-3][j+0]+A[i-3][j+1]+A[i-3][j+4]+A[i-2][j-4]+A[i-2][j-2]+
                 A[i-2][j+2]+A[i-2][j+4]+A[i-1][j-5]+A[i-1][j-3]+A[i-1][j-1]+A[i-1][j+0]+A[i-1][j+1]+
                 A[i-1][j+3]+A[i-1][j+5]+A[i+0][j-5]+A[i+0][j-3]+A[i+0][j-1]+A[i+0][j+0]+A[i+0][j+1]+
                 A[i+0][j+3]+A[i+0][j+5]+A[i+1][j-5]+A[i+1][j-3]+A[i+1][j-1]+A[i+1][j+0]+A[i+1][j+1]+
                 A[i+1][j+3]+A[i+1][j+5]+A[i+2][j-4]+A[i+2][j-2]+A[i+2][j+2]+A[i+2][j+4]+A[i+3][j-4]+
                 A[i+3][j-1]+A[i+3][j+0]+A[i+3][j+1]+A[i+3][j+4]+A[i+4][j-3]+A[i+4][j-2]+A[i+4][j+2]+
                 A[i+4][j+3]+A[i+5][j-1]+A[i+5][j+0]+A[i+5][j+1];  
      //rule
      if (sum >= b[2] & sum <= b[3]){
        outval = 0;
      } 
      if (sum >= b[0] & sum <= b[1]){
        outval = 1;
      }  
      B[i][j] = outval;
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
