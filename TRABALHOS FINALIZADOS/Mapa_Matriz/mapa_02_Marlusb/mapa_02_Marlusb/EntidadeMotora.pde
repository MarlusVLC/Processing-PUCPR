/////Classe para entidades jogador e inimigos
import java.util.*;

class EntidadeMotora{
  int x_pos, y_pos, counter;
  color cor;
  boolean canGoUp, canGoDown, canGoRight, canGoLeft;
  
  EntidadeMotora(int x_pos, int y_pos){
    this.x_pos = x_pos;
    this.y_pos = y_pos;
    counter = 0;
  }
  
  
  void Navega_Mapa(){
  }
  
  
  
  
  
  //Determina a cor da entidade e em seguida à desenha na tela.
  protected void desenha_entidade(color cor){  
    this.cor = cor;
    fill(cor);
    ellipse(x_pos*tam_Hcelula+tam_Hcelula/2, y_pos*tam_Vcelula+tam_Vcelula/2, 5,5);  
  }
  
  
  
  
  //checa se as posições adjacentes estão bloqueadas ou dentro da matriz
  protected void checa_laterais(){ 
    canGoUp = true; canGoDown = true; canGoLeft = true; canGoRight = true;
    
      if (y_pos==0 || (mapa[x_pos][y_pos-1]!=0))           canGoUp = false;
      if (y_pos>=n_linhas-1 || (mapa[x_pos][y_pos+1]!=0))   canGoDown = false;
      if (x_pos==0 || (mapa[x_pos-1][y_pos]!=0))           canGoLeft = false;
      if (x_pos>=n_colunas-1 || (mapa[x_pos+1][y_pos]!=0))    canGoRight = false;      
  }
  
  //Um contador inteiro é ativado, para dar um delay no movimento da EntidadeMotora.
  protected boolean Esperar (int delayTime){
    counter++;
    if (counter >= delayTime)
    {
      counter = 0;
      return false;
    }  
    return true; 
  }
}
