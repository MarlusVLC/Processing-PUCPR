int branco=#FFFFFF, vermelho=#FF0000, azul=#0000FF, amarelo=#FFFF00;
int[] cores = {branco, vermelho, azul, amarelo};
int cor = 0;
int rect_width;


Vetor local, velocidade, board, mecha;

void setup() {
  size(640,360);
  local = new Vetor(100,100);
  velocidade = new Vetor(0, 0);
  board = new Vetor(width-10, 0);
  mecha = new Vetor(0,2);
  rect_width = 5;
}

void draw() {
  background(0);
  
  fill(cores[cor]);
  
  
  /////////BOLA///////
  local.SomaVetor(velocidade);
  
  
  if ((local.xcomp > width) || (local.xcomp < 0)) {
    velocidade.xcomp = velocidade.xcomp * -1;
  }
  if ((local.ycomp > height) || (local.ycomp < 0)) {
    velocidade.ycomp = velocidade.ycomp * -1;
  }
  
  ellipse(local.xcomp,local.ycomp,16,16);
  
  
  
  
  
  //////////////////////////////PRANCHA/RAQUETE///////////
  board.SomaVetor(mecha);
  if ((board.ycomp > height-90) || (board.ycomp < 0)){
    mecha.ycomp *= -1;
  }
  
  rect(board.xcomp,board.ycomp, rect_width, 90);
  
  
  
  
  
  
  ///////////////////CHECAR COLISÃO/////////////
  if(local.xcomp > width-rect_width && (local.ycomp < board.ycomp+90 
            && local.ycomp > board.ycomp)){
    if (cor / cores.length != cor){
      cor = 0;
    } else {
      cor++;
    }
  }

}

  

void keyPressed(){
  if (key == CODED) {
    if (keyCode == UP) velocidade.ycomp--;
    if (keyCode == DOWN) velocidade.ycomp++;
    if (keyCode == LEFT) velocidade.xcomp--;
    if (keyCode == RIGHT) velocidade.xcomp++;
  }
  if (key == 'S' || key =='s'){
    velocidade.ycomp=0;
    velocidade.xcomp=0;
  }
}
