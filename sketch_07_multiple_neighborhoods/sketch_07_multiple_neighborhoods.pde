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
  for (int i = 0; i < width; i++) {
    int ii[] = new int[29];
    for (int k = 0; k < 29; k++){
      ii[k] = (i - 14 + k + width) % width;
    }
    for (int j = 0; j < width; j++) {
      int jj[] = new int[29];
      for (int k = 0; k < 29; k++){
        jj[k] = (j - 14 + k + width) % width;
      }
      //we save the actual cell value
      int outval = A[i][j];  
      //neighborhood sum
      int sum0 = A[ii[13]][jj[13]]+A[ii[13]][jj[14]]+A[ii[13]][jj[15]]+A[ii[14]][jj[13]]+A[ii[14]][jj[15]]+A[ii[15]][jj[13]]+A[ii[15]][jj[14]]+A[ii[15]][jj[15]];
      int sum1 = A[ii[0]][jj[12]]+A[ii[0]][jj[13]]+A[ii[0]][jj[14]]+A[ii[0]][jj[15]]+A[ii[0]][jj[16]]+A[ii[1]][jj[9]]+A[ii[1]][jj[10]]+A[ii[1]][jj[11]]+A[ii[1]][jj[12]]+A[ii[1]][jj[13]]+A[ii[1]][jj[14]]+A[ii[1]][jj[15]]+A[ii[1]][jj[16]]+A[ii[1]][jj[17]]+A[ii[1]][jj[18]]+A[ii[1]][jj[19]]+A[ii[2]][jj[7]]+A[ii[2]][jj[8]]+A[ii[2]][jj[9]]+A[ii[2]][jj[10]]+A[ii[2]][jj[11]]+A[ii[2]][jj[12]]+A[ii[2]][jj[13]]+A[ii[2]][jj[14]]+A[ii[2]][jj[15]]+A[ii[2]][jj[16]]+A[ii[2]][jj[17]]+A[ii[2]][jj[18]]+A[ii[2]][jj[19]]+A[ii[2]][jj[20]]+A[ii[2]][jj[21]]+A[ii[3]][jj[5]]+A[ii[3]][jj[6]]+A[ii[3]][jj[7]]+A[ii[3]][jj[8]]+A[ii[3]][jj[9]]+A[ii[3]][jj[10]]+A[ii[3]][jj[18]]+A[ii[3]][jj[19]]+A[ii[3]][jj[20]]+A[ii[3]][jj[21]]+A[ii[3]][jj[22]]+A[ii[3]][jj[23]]+A[ii[4]][jj[4]]+A[ii[4]][jj[5]]+A[ii[4]][jj[6]]+A[ii[4]][jj[7]]+A[ii[4]][jj[8]]+A[ii[4]][jj[13]]+A[ii[4]][jj[14]]+A[ii[4]][jj[15]]+A[ii[4]][jj[20]]+A[ii[4]][jj[21]]+A[ii[4]][jj[22]]+A[ii[4]][jj[23]]+A[ii[4]][jj[24]]+A[ii[5]][jj[3]]+A[ii[5]][jj[4]]+A[ii[5]][jj[5]]+A[ii[5]][jj[6]]+A[ii[5]][jj[10]]+A[ii[5]][jj[11]]+A[ii[5]][jj[12]]+A[ii[5]][jj[16]]+A[ii[5]][jj[17]]+A[ii[5]][jj[18]]+A[ii[5]][jj[22]]+A[ii[5]][jj[23]]+A[ii[5]][jj[24]]+A[ii[5]][jj[25]]+A[ii[6]][jj[3]]+A[ii[6]][jj[4]]+A[ii[6]][jj[5]]+A[ii[6]][jj[8]]+A[ii[6]][jj[9]]+A[ii[6]][jj[19]]+A[ii[6]][jj[20]]+A[ii[6]][jj[23]]+A[ii[6]][jj[24]]+A[ii[6]][jj[25]]+A[ii[7]][jj[2]]+A[ii[7]][jj[3]]+A[ii[7]][jj[4]]+A[ii[7]][jj[7]]+A[ii[7]][jj[8]]+A[ii[7]][jj[20]]+A[ii[7]][jj[21]]+A[ii[7]][jj[24]]+A[ii[7]][jj[25]]+A[ii[7]][jj[26]]+A[ii[8]][jj[2]]+A[ii[8]][jj[3]]+A[ii[8]][jj[4]]+A[ii[8]][jj[6]]+A[ii[8]][jj[7]]+A[ii[8]][jj[21]]+A[ii[8]][jj[22]]+A[ii[8]][jj[24]]+A[ii[8]][jj[25]]+A[ii[8]][jj[26]]+A[ii[9]][jj[1]]+A[ii[9]][jj[2]]+A[ii[9]][jj[3]]+A[ii[9]][jj[6]]+A[ii[9]][jj[22]]+A[ii[9]][jj[25]]+A[ii[9]][jj[26]]+A[ii[9]][jj[27]]+A[ii[10]][jj[1]]+A[ii[10]][jj[2]]+A[ii[10]][jj[3]]+A[ii[10]][jj[5]]+A[ii[10]][jj[23]]+A[ii[10]][jj[25]]+A[ii[10]][jj[26]]+A[ii[10]][jj[27]]+A[ii[11]][jj[1]]+A[ii[11]][jj[2]]+A[ii[11]][jj[5]]+A[ii[11]][jj[23]]+A[ii[11]][jj[26]]+A[ii[11]][jj[27]]+A[ii[12]][jj[0]]+A[ii[12]][jj[1]]+A[ii[12]][jj[2]]+A[ii[12]][jj[5]]+A[ii[12]][jj[23]]+A[ii[12]][jj[26]]+A[ii[12]][jj[27]]+A[ii[12]][jj[28]]+A[ii[13]][jj[0]]+A[ii[13]][jj[1]]+A[ii[13]][jj[2]]+A[ii[13]][jj[4]]+A[ii[13]][jj[24]]+A[ii[13]][jj[26]]+A[ii[13]][jj[27]]+A[ii[13]][jj[28]]+A[ii[14]][jj[0]]+A[ii[14]][jj[1]]+A[ii[14]][jj[2]]+A[ii[14]][jj[4]]+A[ii[14]][jj[24]]+A[ii[14]][jj[26]]+A[ii[14]][jj[27]]+A[ii[14]][jj[28]]+A[ii[15]][jj[0]]+A[ii[15]][jj[1]]+A[ii[15]][jj[2]]+A[ii[15]][jj[4]]+A[ii[15]][jj[24]]+A[ii[15]][jj[26]]+A[ii[15]][jj[27]]+A[ii[15]][jj[28]]+A[ii[16]][jj[0]]+A[ii[16]][jj[1]]+A[ii[16]][jj[2]]+A[ii[16]][jj[5]]+A[ii[16]][jj[23]]+A[ii[16]][jj[26]]+A[ii[16]][jj[27]]+A[ii[16]][jj[28]]+A[ii[17]][jj[1]]+A[ii[17]][jj[2]]+A[ii[17]][jj[5]]+A[ii[17]][jj[23]]+A[ii[17]][jj[26]]+A[ii[17]][jj[27]]+A[ii[18]][jj[1]]+A[ii[18]][jj[2]]+A[ii[18]][jj[3]]+A[ii[18]][jj[5]]+A[ii[18]][jj[23]]+A[ii[18]][jj[25]]+A[ii[18]][jj[26]]+A[ii[18]][jj[27]]+A[ii[19]][jj[1]]+A[ii[19]][jj[2]]+A[ii[19]][jj[3]]+A[ii[19]][jj[6]]+A[ii[19]][jj[22]]+A[ii[19]][jj[25]]+A[ii[19]][jj[26]]+A[ii[19]][jj[27]]+A[ii[20]][jj[2]]+A[ii[20]][jj[3]]+A[ii[20]][jj[4]]+A[ii[20]][jj[6]]+A[ii[20]][jj[7]]+A[ii[20]][jj[21]]+A[ii[20]][jj[22]]+A[ii[20]][jj[24]]+A[ii[20]][jj[25]]+A[ii[20]][jj[26]]+A[ii[21]][jj[2]]+A[ii[21]][jj[3]]+A[ii[21]][jj[4]]+A[ii[21]][jj[7]]+A[ii[21]][jj[8]]+A[ii[21]][jj[20]]+A[ii[21]][jj[21]]+A[ii[21]][jj[24]]+A[ii[21]][jj[25]]+A[ii[21]][jj[26]]+A[ii[22]][jj[3]]+A[ii[22]][jj[4]]+A[ii[22]][jj[5]]+A[ii[22]][jj[8]]+A[ii[22]][jj[9]]+A[ii[22]][jj[19]]+A[ii[22]][jj[20]]+A[ii[22]][jj[23]]+A[ii[22]][jj[24]]+A[ii[22]][jj[25]]+A[ii[23]][jj[3]]+A[ii[23]][jj[4]]+A[ii[23]][jj[5]]+A[ii[23]][jj[6]]+A[ii[23]][jj[10]]+A[ii[23]][jj[11]]+A[ii[23]][jj[12]]+A[ii[23]][jj[16]]+A[ii[23]][jj[17]]+A[ii[23]][jj[18]]+A[ii[23]][jj[22]]+A[ii[23]][jj[23]]+A[ii[23]][jj[24]]+A[ii[23]][jj[25]]+A[ii[24]][jj[4]]+A[ii[24]][jj[5]]+A[ii[24]][jj[6]]+A[ii[24]][jj[7]]+A[ii[24]][jj[8]]+A[ii[24]][jj[13]]+A[ii[24]][jj[14]]+A[ii[24]][jj[15]]+A[ii[24]][jj[20]]+A[ii[24]][jj[21]]+A[ii[24]][jj[22]]+A[ii[24]][jj[23]]+A[ii[24]][jj[24]]+A[ii[25]][jj[5]]+A[ii[25]][jj[6]]+A[ii[25]][jj[7]]+A[ii[25]][jj[8]]+A[ii[25]][jj[9]]+A[ii[25]][jj[10]]+A[ii[25]][jj[18]]+A[ii[25]][jj[19]]+A[ii[25]][jj[20]]+A[ii[25]][jj[21]]+A[ii[25]][jj[22]]+A[ii[25]][jj[23]]+A[ii[26]][jj[7]]+A[ii[26]][jj[8]]+A[ii[26]][jj[9]]+A[ii[26]][jj[10]]+A[ii[26]][jj[11]]+A[ii[26]][jj[12]]+A[ii[26]][jj[13]]+A[ii[26]][jj[14]]+A[ii[26]][jj[15]]+A[ii[26]][jj[16]]+A[ii[26]][jj[17]]+A[ii[26]][jj[18]]+A[ii[26]][jj[19]]+A[ii[26]][jj[20]]+A[ii[26]][jj[21]]+A[ii[27]][jj[9]]+A[ii[27]][jj[10]]+A[ii[27]][jj[11]]+A[ii[27]][jj[12]]+A[ii[27]][jj[13]]+A[ii[27]][jj[14]]+A[ii[27]][jj[15]]+A[ii[27]][jj[16]]+A[ii[27]][jj[17]]+A[ii[27]][jj[18]]+A[ii[27]][jj[19]]+A[ii[28]][jj[12]]+A[ii[28]][jj[13]]+A[ii[28]][jj[14]]+A[ii[28]][jj[15]]+A[ii[28]][jj[16]];
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
