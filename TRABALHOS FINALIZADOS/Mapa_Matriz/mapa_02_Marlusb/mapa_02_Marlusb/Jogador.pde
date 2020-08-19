class Jogador extends EntidadeMotora
{
  int vidas = 3;
  
  Jogador(int x_pos, int y_pos)
  {
    super(x_pos, y_pos);
    //cor = #ff0000;
    //cor = #ff9900;
  }
  
  void Navega_Mapa(){
    if (keyPressed) { 
      checa_laterais();
      //String dir = Character.toString(key);
      //dir.toLowerCase();
      if ((keyCode == UP || key == 'W' || key == 'w')    && canGoUp)     y_pos--; 
      if ((keyCode == DOWN || key == 'S' || key == 's') && canGoDown)   y_pos++;
      if ((keyCode == RIGHT || key == 'D' || key == 'd') && canGoRight)  x_pos++;
      if ((keyCode == LEFT || key == 'A' || key == 'a')  && canGoLeft)   x_pos--;
    }
  }
  
  //Checa se jogador e inimigo estão na mesma, caso estja, o jogador retorna
  //ao ponto inicial e perde uma vida
  void checa_colisao(Inimigo inimigo){
    if (x_pos == inimigo.x_pos && y_pos == inimigo.y_pos){
      x_pos = 0; y_pos = 0;
      this.vidas--; 
    }
  }
  
  //faz a contagem regressiva do score e checa se jogador está na posição objetivo.
  //se estiver, soma ao score acumulado, retorna o jogador ao ponto inicial, recomeca a contagem
  //e aumenta o nível.
  void checa_objetivo(){
    //println(level);
    scoreCounter--;
    if (x_pos == objetivo_x-1 && y_pos == objetivo_y-1){
      x_pos = 0; y_pos = 0; 
      if (scoreCounter<100)    scoreCounter = 100;
      score += scoreCounter;
      scoreCounter = scoreInicial;
      level++;
    }
  }
  
  
   void desenha_vidas(color cor, int X_pos, int Y_pos, int intervalo){  
    fill(cor);
    for (int i = 0; i < this.vidas; i++)
    {
      ellipse(X_pos+i*intervalo,Y_pos, 5, 5);
      fill(cor_bg);
      ellipse(X_pos+(vidas)*intervalo,Y_pos, 5, 5);
      fill(cor);
    }
  }
  
  int getVidas()
  {
    return this.vidas;
  }
    
}
