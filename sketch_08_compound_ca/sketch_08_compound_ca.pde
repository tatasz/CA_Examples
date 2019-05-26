// rules //<>//
float b0[] = { 3.0 ,  3.0 ,  3.0 ,  5.0 };
float b1[] = { 84.0 ,  84.0 ,  84.0 ,  85.0 ,  187.0 ,  243.0 ,  252.0 ,  283.0 };
float b01[] = { 0.0 ,  5.0 ,  5.0 ,  6.0 };
float b11[] = { 7.0 ,  13.0 ,  26.0 ,  26.0 ,  36.0 ,  37.0 ,  39.0 ,  70.0 };
float b2[] = { 1277.0 ,  1281.0 };

//shader
PShader sh1;

void setup() {
  size(500, 500, P2D);
  sh1 = loadShader("frag.glsl");  
  sh1.set("res",float(width),float(height));
  for (int i = 0; i < width; i++){
    for (int j = 0; j < height; j++){
      //fill with random values
      float c = (random(1) < 0.9) ? 0 : 1;
      set(i,j, color(c * 255));
    }
  }

  //pass the parameters into the shader
  sh1.set("v00", b0[0], b0[1]);
  sh1.set("v01", b0[2], b0[3]);
  
  sh1.set("v10", b1[0], b1[1]);
  sh1.set("v11", b1[2], b1[3]);
  sh1.set("v12", b1[4], b1[5]);
  sh1.set("v13", b1[6], b1[7]);
  
  sh1.set("v001", b01[0], b01[1]);
  sh1.set("v011", b01[2], b01[3]);
  
  sh1.set("v101", b11[0], b11[1]);
  sh1.set("v111", b11[2], b11[3]);
  sh1.set("v121", b11[4], b11[5]);
  sh1.set("v131", b11[6], b11[7]);
  
  sh1.set("v40", b2[0], b2[1]);
}

void draw(){
  //I apply the shader twice because processing flips it vertically at each step, and I don't feel like figuring it out
  sh1.set("tex", get());
  shader(sh1);
  rect(0,0,width, height);
  sh1.set("tex", get());
  shader(sh1);
  rect(0,0,width, height);
}
