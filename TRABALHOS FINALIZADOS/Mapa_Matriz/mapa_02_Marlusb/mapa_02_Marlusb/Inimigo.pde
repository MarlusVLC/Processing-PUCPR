import java.util.*;

class Inimigo extends EntidadeMotora
{
  Inimigo(int x_pos, int y_pos)
  {
    super(x_pos, y_pos);
    //cor = #ff9900;
    cor = #ff0000;
  }
  
  
  //Checa a disponibilidade de espaços adjacentes e então pula para uma das casas livres
  void Navega_Mapa(){
    if (Esperar(50))   return; //Se o counter for menor que 50, o NPC nao muda a posicao.
    Random rand = new Random();
    int dir_X = 0;
    int dir_Y = 0;
    checa_laterais();
    
    if (canGoUp && canGoDown)         dir_Y = rand.nextInt(3)-1; //Se puder ir para cima e para baixo, gere um valor de -1 à 1 para somar em pos_Y
    else{
      if (!canGoUp)    dir_Y = rand.nextInt(2); //Se não puder ir para cima, gere um valor de 0 à 1 para somar em y_pos
      else             dir_Y = rand.nextInt(2)-1;// Se não puder ir para baixo, gere um valor de -1 à 0 para somar em y_pos
    }
    
    if (canGoLeft && canGoRight)      dir_X = rand.nextInt(3)-1;
    else{
      if (!canGoLeft)    dir_X = rand.nextInt(2);   //Se não puder ir para esquerda, gere um valor de 0 à 1 para somar em x_pos
      else               dir_X = rand.nextInt(2)-1;  // Se não puder ir para direita, gere um valor de -1 à 0 para somar em x_pos
    }
    
        
    y_pos += dir_Y;
    x_pos += dir_X;
    //println("NPC: "+x_pos+"-"+y_pos);
  }
}
