int branco=#FFFFFF, vermelho=#FF0000, azul=#0000FF, amarelo=#FFFF00;
int[] cores = {branco, vermelho, azul, amarelo};

float centerStripWidth = 2;
float centerStripHeight = 10;
float centerStripeInterval = 5;

Vetor local, velocidade, board, mecha;

Barra jogador1, jogador2;
Bola bola;

PFont hud_font; 

void setup() {
  size(640,360);
  //local = new Vetor(250,100);
  //velocidade = new Vetor(0, 0);
  //board = new Vetor(width-10, 0);
  //mecha = new Vetor(0,2);
  //rect_width = 5;
  jogador1 = new Barra(1);
  jogador2 = new Barra(2);
  bola = new Bola();
}

void draw() {
  background(0);
  fill(cores[0]);
  
  hud_font = createFont("8-BIT WONDER.TTF", 36);
  
  jogador1.desenha_barra(); /*jogador1.mover();*/ jogador1.atualizar();
  jogador2.desenha_barra(); /*jogador2.mover();*/ jogador2.atualizar();
  
  bola.desenha_bola(); bola.mover(); 
  bola.checaColisao(jogador1); bola.checaColisao(jogador2);
  if (bola.position.xcomp > width+bola.raio*2 || bola.position.xcomp < -bola.raio*2)
  {
    bola.pontuar();
    bola.reposicionar();
  }
  
  //textAlign(CENTER);
  textFont(hud_font);  
  text(jogador1.score, width/2-80, 80); text(jogador2.score, width/2+40,80);
    
  for (int i = 0; i*(centerStripHeight+centerStripeInterval) < height; i++){
    rect(width/2, i*(centerStripHeight+centerStripeInterval), centerStripWidth, centerStripHeight);
  }
}

void keyReleased(){
  jogador1.mover(0);
  jogador2.mover(0);
}

void keyPressed(){
  if (key == 'w' || key == 'W')      jogador1.mover(-10);
  else if (key == 's' || key == 'S') jogador1.mover(10);

  if (keyCode == UP)        jogador2.mover(-10);
  else if (keyCode == DOWN) jogador2.mover(10);
}


  
