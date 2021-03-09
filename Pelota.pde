class Pelota{
  float[] pos = new float[2];
  float[] vel = new float[2];
  float radio;
  
  Pelota(float posX, float posY, float velX, float velY, float radioT){
    pos[0] = posX;
    pos[1] = posY;
    
    vel[0] = velX;
    vel[1] = velY;
    
    radio = radioT;
  }
  //izqder -> true -> derecha
  //izqDer -> flase -> izquierda
  void checaPaleta(float anchoP, float paletaS, float paletaI, boolean izqDer, float widthT, float heightT){
    float radioCuadrado = radio * radio;
    float extremoPelota;
    boolean enZona = false;
    int valorFor1= 0, valorFor2 = 0;
    if(izqDer){//Derecha
        extremoPelota = pos[0] + radio;
        if(extremoPelota>=widthT-anchoP){
           enZona = true;
           valorFor1 = int (widthT-anchoP);
           valorFor2 = int(widthT);
        }
    }
    else{
       extremoPelota = pos[0] - radio;
       if(extremoPelota<=anchoP){
           enZona = true; 
           valorFor1 = 0;
           valorFor2 = int (anchoP);
        }
    }
     //Si está en la zona
     if (enZona){ 
       
       boolean golpeConfirmado = true;
       //Golpe de lleno   
       if(pos[1] >= paletaS && pos[1] <= paletaI){
         
         if(pos[1] - radio <= paletaI){
           vel[0] = - vel[0];
           golpeConfirmado = false;
         }
         else if(pos[1] + radio >= paletaS){
           vel[0] = - vel[0];
           golpeConfirmado = false;
         }
       }
       //Base inferior paleta
       for (int i = valorFor1; i < valorFor2 && golpeConfirmado; i++){
         float dist = (pos[0]-i)*(pos[0]-i) + (pos[1]-paletaI)*(pos[1]-paletaI);
         if(dist <= radioCuadrado){

           if(pos[0]+radio < paletaI){
             vel[0] = - vel[0];
             vel[1] = - vel[1];
           }
           else{
             vel[1] = - vel[1];
           }
           golpeConfirmado = false;
         }
       }
       //Base superior paleta
       for (int i = valorFor1; i < valorFor2 && golpeConfirmado; i++){
         float dist = (pos[0]-i)*(pos[0]-i) + (pos[1]-paletaS)*(pos[1]-paletaS);
         if(dist <= radioCuadrado){
           if(pos[0]+radio > paletaS){
             vel[0] = - vel[0];
             vel[1] = - vel[1];
           }
           else{
             vel[1] = - vel[1];
           }
           golpeConfirmado = false;
         }
       }
     
   }
    
  }
  int checaParedes(float widthT, float heightT){
    boolean salio = false;
    int salida = 0;
    //Paredes horizontales
    if(pos[1]+radio >= heightT || pos[1]-radio <= 0){
      vel[1] = - vel[1];
    }
    if(pos[0]-radio <= 0){
      salida = 1;
      salio = true;
    }
    else if(pos[0]+radio >= widthT){
       salida = 2;
       salio = true;
    }
    if (salio){
      //Regresar al centro
      pos[0] = widthT / 2;
      pos[1] = heightT / 2;
      if(random(5) < 2.5){
        vel[0] = -vel[0];
      }
    }
    return salida;
  }
  void update(){
    //Actualizar posición
    pos[0] += vel[0];
    pos[1] += vel[1];
    stroke(255,200,50);
    fill(255,200,50);
    ellipse(pos[0],pos[1],radio+radio,radio+radio);
  }
  
}
