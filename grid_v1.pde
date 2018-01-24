int cols, rows;
int scl = 20;
int w = 2800;
int h= 1800;
float flying = 0;

float[][] terrain;
float[][] valley;

void setup(){
  size(1200,700,P3D);

  cols = w /scl;
  rows = h / scl;
  terrain = new float[cols][rows];
 
}

void draw(){
  flying -= 0.1;
  float joff = flying;
  for(int j = 0; j < rows; ++j){
    float ioff = 0;
    for(int i= 0; i< cols; ++i){
       if( ((i > 0) && (i < (cols/3))) || ((i > (cols - cols/3)) && (i < cols)) ){
        terrain[i][j] = map(noise(ioff,joff),0,1,-150,350);
      }else if((i > (cols/3)) && (i < (cols/2 - 4)) || (i > (cols/2 + 4)) && (i < (cols - cols/3))){
        terrain[i][j] = map(noise(ioff,joff),0,1,-150,200);
      }else{
        terrain[i][j] = map(noise(ioff,joff),0,1,-100,100);
      }
      ioff += 0.1;
    }
    joff += 0.1;
  }
  

  background(0);
  stroke(220,0,255);
  strokeWeight(2);
  fill(20, 100);
  smooth();
  
  translate(width/2,height/2);
  rotateX(PI/2.3);
  translate(-w/2, -h/2);
  
  for(int j = 0; j< rows-1; ++j){
    beginShape(TRIANGLE_STRIP);
    for(int i = 0; i < cols; ++i){
      vertex(i*scl, j*scl, terrain[i][j]);
      vertex(i*scl, (j+1)*scl, terrain[i][j+1]);
    }
    endShape();
  }
  
}