class Puntaje{
  int visitante, local;
  float[] pos = new float[2];
  
  Puntaje(float widthT){
    visitante = 0;
    local = 0;
    pos[0] = widthT / 2;
    pos[1] = 30;
  }
  
  void aumentarPuntaje(int puntaje){
    if (puntaje == 2){
      local += 1;
    }
    else if (puntaje == 1){
      visitante += 1;
    }
  }
  
  void update(){
    String impresion;
    impresion = "Puntaje";
    textAlign(CENTER);
    textSize(25);
    text(impresion, pos[0], pos[1]);
    impresion = "Local : " + str(local) + "   Visitante : " + str(visitante);
    text(impresion, pos[0], pos[1] + 40);
    
  }
  
}
