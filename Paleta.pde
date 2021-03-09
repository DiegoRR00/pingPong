
class Paleta{ 
  float[] pos = new float[2];
  float[] dimension = new float[2]; 
  float vel;
  boolean izqDer;
  int entradaAnt = 0;
  
  Paleta(float posX, float posY, float altura, float ancho, float velY, boolean lado){
    pos[0] = posX;
    pos[1] = posY;
    dimension[0] = altura;
    dimension[1] = ancho;
    vel = velY;
    izqDer = lado;
  }
  void tecla(int tecla, int heightT){

    if(izqDer){
      if(tecla == 111 || tecla == 79){
        if (pos[1]>=0){
          pos[1] -= vel;
        }
      }
      else if(tecla == 108 || tecla == 76 ){
        if(pos[1] + dimension[0] < heightT){
          pos[1] += vel;
        }
      }
     
    }
    else{
      if(tecla == 119 || tecla == 87){
        if (pos[1]>=0){
          pos[1] -= vel;
        }
      }
      else if(tecla == 115 || tecla == 83){
        if(pos[1] + dimension[0] < heightT){
          pos[1] += vel;
        }
      }
    }
  }
  void fpga(int tecla, int heightT){
    print(tecla, "\t", entradaAnt);
      if(!izqDer){
        print("Cereal\n");
        if(tecla > entradaAnt + 15){//Arriba
          if (pos[1]>=0){
            print(" Arriba");
            pos[1] -= vel;
          }
        }
        else if(tecla < entradaAnt - 15){//Abajo
        print(" Abajo");
          if(pos[1] + dimension[0] < heightT){
            
            pos[1] += vel;
            
          }
         }
        entradaAnt = tecla;
      }
  }
  void update(){
    stroke(255,255,255);
    fill(255,255,255);
    rect(pos[0], pos[1], dimension[1], dimension[0]);
  }
}
