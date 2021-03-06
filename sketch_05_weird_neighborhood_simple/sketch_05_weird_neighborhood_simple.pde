//rule parameters //<>//
int a = 9;
int b = 13;
int c = 19;
int d = 52; 

//variables for current and next state
int A[][];
int B[][];

//initial state
void setup() {
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
 
void draw() {
  //for each cell
  for (int i = 5; i < width - 5; i++) {
    for (int j = 5; j < height - 5; j++) {
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
      if (sum >= a & sum <= b){
        outval = 1;
      }  
      if (sum >= c & sum <= d){
        outval = 0;
      } 
      B[i][j] = outval;
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
