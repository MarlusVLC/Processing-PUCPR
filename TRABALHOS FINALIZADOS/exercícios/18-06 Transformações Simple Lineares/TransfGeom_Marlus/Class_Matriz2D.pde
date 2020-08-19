class Matriz2D {
    private int M;             // numero de linhas
    private int N;             // numero de colunas
    private float[][] data;    // M-by-N array

    // cria a matriz M-by-N de zeros
    public Matriz2D(int M, int N) {
        this.M = M;
        this.N = N;
        data = new float[M][N];
    }
    
    // imprime a matriz na tela 
    public void show(int xpos, int ypos) {
    fill(255,0,0);
    int tx=xpos;
        for (int i = 0; i < M; i++) {
            for (int j = 0; j < N; j++) {
            text(data[i][j], xpos, ypos);
            xpos=xpos+50;
      }
      ypos=ypos+20;
      xpos=tx;
        }
    }
    
    void desenhaObjeto(){ // somente para matrizes objetos 2D
    int M = this.M;
    for(int i=0; i<M-1; i++) {
    ellipse(data[i][0],height-data[i][1], 5,5);
    line(data[i][0],height-data[i][1], data[i+1][0],height-data[i+1][1]); 
      }
    }

    // cria a matriz baseado num array2d de dados 
    public Matriz2D(float[][] data) {
        M = data.length;
        N = data[0].length;
        this.data = new float[M][N];
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                    this.data[i][j] = data[i][j];
    }

    // transforma em matriz identidade
    public void identity() {
      if(this.M==this.N) {
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                    if (i==j) this.data[i][j] = 1;
                    else this.data[i][j] = 0;
      } else println("Erro: Matriz Identidade somente com M = N");
    }

    // cria e retorna a transposta da matriz que invocou o método
    public Matriz2D transpose() {
        Matriz2D A = new Matriz2D(N, M);
        for (int i = 0; i < M; i++)
            for (int j = 0; j < N; j++)
                A.data[j][i] = this.data[i][j];
        return A;
    }

    // return C = A + B
    public Matriz2D plus(Matriz2D B) {
        Matriz2D A = this;
        if (B.M == A.M && B.N == A.N){
          Matriz2D C = new Matriz2D(M, N);
          for (int i = 0; i < M; i++)
              for (int j = 0; j < N; j++)
                  C.data[i][j] = A.data[i][j] + B.data[i][j];
          return C;}
        else {
          println("Erro: Matrizes de tamanhos diferentes");
          return A;
        }
    }

    // return C = A - B
    public Matriz2D minus(Matriz2D B) {
        Matriz2D A = this;
        if (B.M == A.M && B.N == A.N) {
          Matriz2D C = new Matriz2D(M, N);
          for (int i = 0; i < M; i++)
              for (int j = 0; j < N; j++)
                  C.data[i][j] = A.data[i][j] - B.data[i][j];
          return C;}
         else {
         println("Erro: Matrizes de tamanhos diferentes");
         return A;
        }
    }

    // return C = A * B
    public Matriz2D times(Matriz2D B) {
        Matriz2D A = this;
        if (A.N == B.M) {
        Matriz2D C = new Matriz2D(A.M, B.N);
        for (int i = 0; i < C.M; i++)
            for (int j = 0; j < C.N; j++)
                for (int k = 0; k < A.N; k++)
                    C.data[i][j] += (A.data[i][k] * B.data[k][j]);
        return C;}
       else {
       println("Erro: Matrizes incompatíveis para multiplicação");
       return A;
      }        
    }

    // calcula determinante (método de triangularização)
    // triangulariza a matriz que invoca o método
    public float determinant(){
      Matriz2D A = this;
      if (M==N) {
        float temp, factor; 
        int count = 0;
        // faz a transformação em um triangulo...
        for(int i = 0; i < M - 1; i++)
        {
            if(A.data[i][i] == 0)
            {
                for(int k = i; k < M; k++)
                {
                    if(A.data[k][i] != 0)
                    {
                        for(int j = 0; j < M; j++)
                        {
                            temp = A.data[i][j];
                            A.data[i][j] = A.data[k][j];
                            A.data[k][j] = temp;
                        }
                        k = M;
                    }
                }
                count++;
            } 
            if(A.data[i][i] != 0)
            {
                for(int k = i + 1; k < M; k++)
                {
                    factor = -1.0 * A.data[k][i] /  A.data[i][i];
                    for(int j = i; j < M; j++)
                    {
                        A.data[k][j] = A.data[k][j] + (factor * A.data[i][j]);
                    }
                }
            }
        } 
        temp = 1.0;
        // Calcula o determinante, multiplica a diagonal
        for(int i = 0; i < M; i++) temp = temp * A.data[i][i];
        return temp; 
        }
        else {
        println("Erro: A Matriz não é quadrada");
        return 0;
        }
    }
    
///////MÉTODOS DE TRANSLACAO///////////////////////////////////////////

  public void extrairCentro()
  {
    int somaX = 0; int somaY = 0;
    int mediaX;  int mediaY;
    int quantPontos = data.length-1;
    for (int i = 0; i < quantPontos; i++)
    {
        somaX += data[i][0];
        somaY += data[i][1];
    }
    mediaX = somaX/quantPontos; mediaY = somaY/quantPontos;
    println ("SomaX: " + somaX + ", SomaY: " + somaY);
    println ("MediaX: " + mediaX + ", MediaY: " + mediaY);
  }
  
  private float extrairCentro(String eixo)
  {
    int soma = 0;
    int media = 0;
    int quantPontos = data.length-1;
    for (int i = 0; i < quantPontos; i++)
    {
      if (eixo.toLowerCase() == "x")    //Soma os pontos do objeto no eixo X
        soma += data[i][0]; 
       else if (eixo.toLowerCase() == "y")     //Soma os pontos do objeto no eixo Y;
        soma += data[i][1]; 
       else
         println("Somente é possível extrair o centro de um polígono 2D nos eixos X e Y");
    }
    media = soma/quantPontos; 
    return media;
  }

  public Matriz2D Transladar (float tx, float ty)
  {
    Matriz2D matrizOriginal = this;
    Matriz2D matrizT = new Matriz2D(3,3);
    matrizT.identity();
    matrizT.data[2][0] = tx;
    matrizT.data[2][1] = ty;
    Matriz2D matrizResultante = matrizOriginal.times(matrizT);
    return matrizResultante;
  }
  
  public Matriz2D Escalar (float Sx, float Sy, boolean isRelativeToSelf)
  {
    Matriz2D matrizOriginal = this;
    Matriz2D matrizS = new Matriz2D(3,3);
    matrizS.identity();  matrizS.data[0][0] = Sx;  matrizS.data[1][1] = Sy;
    Matriz2D matrizResultante = matrizOriginal.times(matrizS);
    if (isRelativeToSelf)
    {
        float X_pos = matrizOriginal.extrairCentro("x"); float Y_pos = matrizOriginal.extrairCentro("y"); 
        Matriz2D matrizTransladada = matrizOriginal.Transladar(-X_pos, -Y_pos);
        matrizResultante = matrizTransladada.times(matrizS);
        matrizResultante = matrizResultante.Transladar(X_pos, Y_pos);
    }
    return matrizResultante;
  }
  
  
  public Matriz2D Rotacionar (float angulo, boolean isRelativeToSelf)
  {
    Matriz2D matrizOriginal = this;
    Matriz2D matrizR = new Matriz2D(3,3);
    matrizR.identity();
    angulo *= PI/180;
    matrizR.data[0][0] = cos(angulo);
    matrizR.data[0][1] = sin(angulo);    
    matrizR.data[1][0] = -sin(angulo);
    matrizR.data[1][1] = cos(angulo);
    Matriz2D matrizResultante = matrizOriginal.times(matrizR);
    if (isRelativeToSelf)
    {
      float X_pos = matrizOriginal.extrairCentro("x"); float Y_pos = matrizOriginal.extrairCentro("y"); 
      Matriz2D matrizTransladada = matrizOriginal.Transladar(-X_pos, -Y_pos);
      matrizResultante = matrizTransladada.times(matrizR);
      matrizResultante = matrizResultante.Transladar(X_pos, Y_pos);
    }
    return matrizResultante;
  }
  
  
}
