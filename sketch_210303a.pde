import processing.serial.*;


void keyPressed(){
  paletaI.tecla(int(key),480);
  paletaD.tecla(int(key),480);
}
Serial jugV;
String entrada = "00000";
Pelota pelota = new Pelota(320,200,-5,2.5,15);
Paleta paletaI = new Paleta(620,200,100,20,10,true);
Paleta paletaD = new Paleta(0,200,100,20,80,false);
Puntaje puntaje = new Puntaje(640);


void setup(){
  size(640,480);
  String portName = Serial.list()[0];
  jugV = new Serial(this, portName, 9600);
}
void draw(){
  background(0,0,0);
  pelota.checaPaleta(paletaI.dimension[1],paletaI.pos[1],paletaI.pos[1]+paletaI.dimension[0], paletaI.izqDer,640,480);
  pelota.checaPaleta(paletaD.dimension[1],paletaD.pos[1],paletaD.pos[1]+paletaD.dimension[0], paletaD.izqDer,640,480);
  puntaje.aumentarPuntaje(pelota.checaParedes(width, height));
  pelota.update();
  paletaI.update();
  paletaD.update();
  puntaje.update();
  if (jugV.available() > 0){
      entrada = jugV.readStringUntil(' ');
      print(entrada,"\n");

      //print("\t", entrada.length(), "\t", entrada.substring(0,entrada.length()-2),"\n");
      if (entrada != null){
        print((entrada.substring(0,entrada.length()-1)), "\n");
        paletaD.fpga(int(entrada.substring(0,entrada.length()-1)),480);
      }
      
  }
  
}
