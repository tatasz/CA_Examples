//rule params //<>//
int a[] = {13, 36};
int b[] = {16, 39};
int c[] = {12, 17};
int d[] = {12, 35};

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
  for (int i = 4; i < width - 4; i++) {
    for (int j = 4; j < height - 4; j++) {
      //we save the actual cell value
      int outval = A[i][j];  
      //neighborhood sum
      int sum = A[i-4][j-1]+A[i-4][j]+A[i-4][j+1]+A[i-3][j-3]+A[i-3][j-2]+A[i-3][j]+A[i-3][j+2]+A[i-3][j+3]+A[i-2][j-3]+A[i-2][j-1]+
                 A[i-2][j+1]+A[i-2][j+3]+A[i-1][j-4]+A[i-1][j-2]+A[i-1][j-1]+A[i-1][j]+A[i-1][j+1]+A[i-1][j+2]+A[i-1][j+4]+A[i][j-4]+
                 A[i][j-3]+A[i][j-1]+A[i][j+1]+A[i][j+3]+A[i][j+4]+A[i+1][j-4]+A[i+1][j-2]+A[i+1][j-1]+A[i+1][j]+A[i+1][j+1]+
                 A[i+1][j+2]+A[i+1][j+4]+A[i+2][j-3]+A[i+2][j-1]+A[i+2][j+1]+A[i+2][j+3]+A[i+3][j-3]+A[i+3][j-2]+A[i+3][j]+A[i+3][j+2]+
                 A[i+3][j+3]+A[i+4][j-1]+A[i+4][j]+A[i+4][j+1];  
  
      //rules
        if (sum >= a[0] & sum <= b[0]){
          outval = 1;
        }    
        if (sum >= a[1] & sum <= b[1]){
          outval = 1;
        }   
        if (sum >= c[0] & sum <= d[0]){
          outval = 0;
        } 
        if (sum >= c[1] & sum <= d[1]){
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
