//rule parameters //<>//
int b0[] = {1, 3, 6, 6};
int b1[] = {76, 206, 247, 266}; 

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
  for (int i = 14; i < width - 14; i++) {
    for (int j = 14; j < height - 14; j++) {
      //we save the actual cell value
      int outval = A[i][j];  
      //neighborhood sum
      int sum0 = A[i-1][j-1]+A[i-1][j]+A[i-1][j+1]+A[i][j-1]+A[i][j+1]+A[i+1][j-1]+A[i+1][j]+A[i+1][j+1];
      int sum1 = A[i-14][j-2]+A[i-14][j-1]+A[i-14][j]+A[i-14][j+1]+A[i-14][j+2]+A[i-13][j-5]+A[i-13][j-4]+A[i-13][j-3]+A[i-13][j-2]+A[i-13][j-1]+A[i-13][j]+A[i-13][j+1]+A[i-13][j+2]+A[i-13][j+3]+A[i-13][j+4]+A[i-13][j+5]+A[i-12][j-7]+A[i-12][j-6]+A[i-12][j-5]+A[i-12][j-4]+A[i-12][j-3]+A[i-12][j-2]+A[i-12][j-1]+A[i-12][j]+A[i-12][j+1]+A[i-12][j+2]+A[i-12][j+3]+A[i-12][j+4]+A[i-12][j+5]+A[i-12][j+6]+A[i-12][j+7]+A[i-11][j-9]+A[i-11][j-8]+A[i-11][j-7]+A[i-11][j-6]+A[i-11][j-5]+A[i-11][j-4]+A[i-11][j+4]+A[i-11][j+5]+A[i-11][j+6]+A[i-11][j+7]+A[i-11][j+8]+A[i-11][j+9]+A[i-10][j-10]+A[i-10][j-9]+A[i-10][j-8]+A[i-10][j-7]+A[i-10][j-6]+A[i-10][j-1]+A[i-10][j]+A[i-10][j+1]+A[i-10][j+6]+A[i-10][j+7]+A[i-10][j+8]+A[i-10][j+9]+A[i-10][j+10]+A[i-9][j-11]+A[i-9][j-10]+A[i-9][j-9]+A[i-9][j-8]+A[i-9][j-4]+A[i-9][j-3]+A[i-9][j-2]+A[i-9][j+2]+A[i-9][j+3]+A[i-9][j+4]+A[i-9][j+8]+A[i-9][j+9]+A[i-9][j+10]+A[i-9][j+11]+A[i-8][j-11]+A[i-8][j-10]+A[i-8][j-9]+A[i-8][j-6]+A[i-8][j-5]+A[i-8][j+5]+A[i-8][j+6]+A[i-8][j+9]+A[i-8][j+10]+A[i-8][j+11]+A[i-7][j-12]+A[i-7][j-11]+A[i-7][j-10]+A[i-7][j-7]+A[i-7][j-6]+A[i-7][j+6]+A[i-7][j+7]+A[i-7][j+10]+A[i-7][j+11]+A[i-7][j+12]+A[i-6][j-12]+A[i-6][j-11]+A[i-6][j-10]+A[i-6][j-8]+A[i-6][j-7]+A[i-6][j+7]+A[i-6][j+8]+A[i-6][j+10]+A[i-6][j+11]+A[i-6][j+12]+A[i-5][j-13]+A[i-5][j-12]+A[i-5][j-11]+A[i-5][j-8]+A[i-5][j+8]+A[i-5][j+11]+A[i-5][j+12]+A[i-5][j+13]+A[i-4][j-13]+A[i-4][j-12]+A[i-4][j-11]+A[i-4][j-9]+A[i-4][j+9]+A[i-4][j+11]+A[i-4][j+12]+A[i-4][j+13]+A[i-3][j-13]+A[i-3][j-12]+A[i-3][j-9]+A[i-3][j+9]+A[i-3][j+12]+A[i-3][j+13]+A[i-2][j-14]+A[i-2][j-13]+A[i-2][j-12]+A[i-2][j-9]+A[i-2][j+9]+A[i-2][j+12]+A[i-2][j+13]+A[i-2][j+14]+A[i-1][j-14]+A[i-1][j-13]+A[i-1][j-12]+A[i-1][j-10]+A[i-1][j+10]+A[i-1][j+12]+A[i-1][j+13]+A[i-1][j+14]+A[i][j-14]+A[i][j-13]+A[i][j-12]+A[i][j-10]+A[i][j+10]+A[i][j+12]+A[i][j+13]+A[i][j+14]+A[i+1][j-14]+A[i+1][j-13]+A[i+1][j-12]+A[i+1][j-10]+A[i+1][j+10]+A[i+1][j+12]+A[i+1][j+13]+A[i+1][j+14]+A[i+2][j-14]+A[i+2][j-13]+A[i+2][j-12]+A[i+2][j-9]+A[i+2][j+9]+A[i+2][j+12]+A[i+2][j+13]+A[i+2][j+14]+A[i+3][j-13]+A[i+3][j-12]+A[i+3][j-9]+A[i+3][j+9]+A[i+3][j+12]+A[i+3][j+13]+A[i+4][j-13]+A[i+4][j-12]+A[i+4][j-11]+A[i+4][j-9]+A[i+4][j+9]+A[i+4][j+11]+A[i+4][j+12]+A[i+4][j+13]+A[i+5][j-13]+A[i+5][j-12]+A[i+5][j-11]+A[i+5][j-8]+A[i+5][j+8]+A[i+5][j+11]+A[i+5][j+12]+A[i+5][j+13]+A[i+6][j-12]+A[i+6][j-11]+A[i+6][j-10]+A[i+6][j-8]+A[i+6][j-7]+A[i+6][j+7]+A[i+6][j+8]+A[i+6][j+10]+A[i+6][j+11]+A[i+6][j+12]+A[i+7][j-12]+A[i+7][j-11]+A[i+7][j-10]+A[i+7][j-7]+A[i+7][j-6]+A[i+7][j+6]+A[i+7][j+7]+A[i+7][j+10]+A[i+7][j+11]+A[i+7][j+12]+A[i+8][j-11]+A[i+8][j-10]+A[i+8][j-9]+A[i+8][j-6]+A[i+8][j-5]+A[i+8][j+5]+A[i+8][j+6]+A[i+8][j+9]+A[i+8][j+10]+A[i+8][j+11]+A[i+9][j-11]+A[i+9][j-10]+A[i+9][j-9]+A[i+9][j-8]+A[i+9][j-4]+A[i+9][j-3]+A[i+9][j-2]+A[i+9][j+2]+A[i+9][j+3]+A[i+9][j+4]+A[i+9][j+8]+A[i+9][j+9]+A[i+9][j+10]+A[i+9][j+11]+A[i+10][j-10]+A[i+10][j-9]+A[i+10][j-8]+A[i+10][j-7]+A[i+10][j-6]+A[i+10][j-1]+A[i+10][j]+A[i+10][j+1]+A[i+10][j+6]+A[i+10][j+7]+A[i+10][j+8]+A[i+10][j+9]+A[i+10][j+10]+A[i+11][j-9]+A[i+11][j-8]+A[i+11][j-7]+A[i+11][j-6]+A[i+11][j-5]+A[i+11][j-4]+A[i+11][j+4]+A[i+11][j+5]+A[i+11][j+6]+A[i+11][j+7]+A[i+11][j+8]+A[i+11][j+9]+A[i+12][j-7]+A[i+12][j-6]+A[i+12][j-5]+A[i+12][j-4]+A[i+12][j-3]+A[i+12][j-2]+A[i+12][j-1]+A[i+12][j]+A[i+12][j+1]+A[i+12][j+2]+A[i+12][j+3]+A[i+12][j+4]+A[i+12][j+5]+A[i+12][j+6]+A[i+12][j+7]+A[i+13][j-5]+A[i+13][j-4]+A[i+13][j-3]+A[i+13][j-2]+A[i+13][j-1]+A[i+13][j]+A[i+13][j+1]+A[i+13][j+2]+A[i+13][j+3]+A[i+13][j+4]+A[i+13][j+5]+A[i+14][j-2]+A[i+14][j-1]+A[i+14][j]+A[i+14][j+1]+A[i+14][j+2];
      //apply rules to first neighborhood
      if (sum0 >= b0[0] & sum0 <= b0[1]){
        outval = 1;
      }         
      if (sum0 >= b0[2] & sum0 <= b0[3]){
        outval = 0;
      } 
      //apply rules to second neighborhood
      if (sum1 >= b1[0] & sum1 <= b1[1]){
        outval = 0;
      } 
      if (sum1 >= b1[2] & sum1 <= b1[3]){
        outval = 1;
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
