void desenha_mapa(){
  for(int i=0; i<n_colunas; i++) {
    for(int j=0; j<n_linhas; j++) {
      if (mapa[i][j]==1) fill(255); else fill(cor_bg);
      rect(i*tam_Hcelula, j*tam_Vcelula, tam_Hcelula, tam_Vcelula);  
    }
  }  
}

void inicializa_mapa(){
  for(int i=0; i<n_colunas; i++) {
    for(int j=0; j<n_linhas; j++) {
      mapa[i][j]=0; 
    }
  }    
}

void edita_mapa(){
  if(mousePressed){
    for(int i=0; i<n_colunas; i++) {
      for(int j=0; j<n_linhas; j++) {
        if((mouseX>i*tam_Hcelula)&&(mouseX<i*tam_Hcelula+tam_Hcelula)&&
           (mouseY>j*tam_Vcelula)&&(mouseY<j*tam_Vcelula+tam_Vcelula)) 
            if (mouseButton==LEFT){
              mapa[i][j]=1;
            }
            else{
              mapa[i][j]=0;
        }
      }
    }
  }
}

//Desenha o ponto objetivo nas coordenadas indicadas (de 1 à 20).
void desenha_objetivo(int alvo_x, int alvo_y){
  if (alvo_x > 20 || alvo_x <= 0 ||
      alvo_y > 20 || alvo_y <= 0){
        println("ERRO: As coordenadas X e Y do ponto objetivo só podem ser de 1 à 20");
      }
  else{
    fill(vermelho);
    rect((alvo_x-1)*tam_Hcelula, (alvo_y-1)*tam_Vcelula, tam_Hcelula, tam_Vcelula);
  }
}

//Gera dois números aleatórios (de 10 à 20) para serem usados nas coordenadas do ponto objetivo
//Não consegui implementar
void randomiza_objetivo(){
    /////////RANDOMIZA OBJETIVO
  int objetivo_x = (int)random(10,20); println("objeitov_x: " + objetivo_x);
  int objetivo_y = (int)random(10,20); println("objeitov_y: " + objetivo_y);
  /////////RANDOMIZA OBJETIVO
}

//Desenha os textos padrão enquanto o jogo está rodando.
//Apresenta a quantidade de vidas do jogador e a pontuação acumulada.
void desenha_HUD(){
  int lifeText_x = 30; int lifeText_y = height-60;
  int scoreText_x = 250; int scoreText_y = height-60;
  textFont(hud_font);
  fill(255);
  textAlign(LEFT);
  text("LIFES", lifeText_x, lifeText_y);
  text("SCORE",scoreText_x, scoreText_y);
  fill(cor_bg);
  rect(width/2,height-50,width/2,50); //Faz um retangulo preto para evitar o desenho por cima, conforme a atualizacao do draw().
  textAlign(CENTER);
  fill(255);
  text(score, scoreText_x+50, scoreText_y+40);
  jogador.desenha_vidas(vermelho, lifeText_x+10, lifeText_y+40, 20);
}

//Mostra a tela de finalizacao do jogo, seja pelo fim das vidas ou dos níveis.
//Apresenta o score acumulado caso o jogador tenha ganho.
void GameOver()
{
  fill(0);
  rect(0, n_linhas*tam_Vcelula, width, tam_HUD);
  textFont(hud_font);
  fill(255);
  textAlign(CENTER);
  if (jogador.vidas <= 0)
    text("GAME OVER", width/2, height-tam_HUD/2);
  else
    text("(: ! YOU WIN ! :)",width/2, height-tam_HUD/2-20); 
    textAlign(LEFT);
    text("SCORE - ", 40, height-tam_HUD+80); 
    text(score, 200, height-tam_HUD+80);
} 
