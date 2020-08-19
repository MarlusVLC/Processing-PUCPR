class Barra{
  int padHeight = 60;
  int padWidth = 15;
  int player; 
  int score;
  float X_pos, Y_pos, speed, Ymuda = 0;
  float centerX_pos = X_pos + padWidth/2;
  float centerY_pos = Y_pos + padHeight/2;
  
  Barra(int player){
    this.player = player;
    this.score = 0;
    if (player == 1)        this.X_pos = 0;
    else if (player == 2)   this.X_pos = width-padWidth;
    else                    println("Só podem haver dois jogadores: 1 ou 2");
    this.Y_pos = height/2;
  }
  
  public void desenha_barra(){
    rect(X_pos, Y_pos, padWidth, padHeight);
    println(player + ": " + Y_pos);  
  }

  
  public void mover(float speed){
    Ymuda = speed;
  }
  
  public void atualizar(){
    Y_pos += Ymuda;
    Y_pos = constrain(Y_pos, 0, height-padHeight);
  }
  

}
