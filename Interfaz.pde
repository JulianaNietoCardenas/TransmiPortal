 
void interfaz(){
  //Resultados
  if(p && !fin){
    fill(#d9d9d9);
    rect(0,600,1200,200);
    fill(#000000);
    
    cronometro();
    portal80.cronometroVehiculos();  
    infoG22();
    infoH21();
  }
  
  {
  //Panel Izquierdo
  fill(#ff9999);
  noStroke();
  rect(1000,0,400,800); 
  }
  
  {
  //Titulo: TransmiPortal
  fill(255);
  textSize(40);
   text("TransmiPortal", 1050,50);
  }
  
  {
    //Datos de Simulación
    //Subtitulo: Datos de Simulación
    fill(#ff6666);
    rect(1050,70,270,50);
    fill(255);
    textSize(23);
    text("Datos de Simulación", 1070, 100);
    
    //Rutas
    //G22
    textSize(40);
    text("G22", 1050,180);
    textSize(28);
    text("Buses", 1070, 300-70);    
    text("Pasajeros", 1070, 340-70);
    textSize(15);
    text("Frecuencia (segs)", 1070, 380-70);
    
    {
      //Variables
      //Variable Buses     
      rect(1245,280-70,60,25); //Numero
      fill(#ff6666);
      rect(1220,280-70,25,25); //Menos
      rect(1300,280-70,25,25); //Mas
      //Variable Pasajeros     
      fill(255);
      rect(1245,320-70,60,25); //Numero
      fill(#ff6666);
      rect(1220,320-70,25,25); //Menos
      rect(1300,320-70,25,25); //Mas
      
      //Variable Frecuencia
      fill(255);
      rect(1245,360-70,60,25); //Numero
      fill(#ff6666);
      rect(1220,360-70,25,25); //Menos
      rect(1300,360-70,25,25); //Mas
      
      //
      fill(0);
      textSize(20);
      text(portal80.datosSimulacion[0],1265,300-70); // Numero de Buses
      text(portal80.datosSimulacion[1],1265,340-70); // Numero de Pasajeros
      textSize(15);
      text(portal80.datosSimulacion[2],1260,380-70); // Frecuencia
      
      fill(250);
      //Buses
      textSize(20);
      text("-", 1227,298-70);
      text("+", 1305,298-70);
      //Pasajeros
      text("-", 1227,338-70);
      text("+", 1305,338-70);
      //Frecuencia
      text("-", 1227,378-70);
      text("+", 1305,378-70);
    }
    fill(255);
    textSize(40);
    text("H21", 1050,400-30);
    textSize(28);
    text("Buses", 1070, 450-30);    
    text("Pasajeros", 1070, 490-30);
    textSize(15);
    text("Frecuencia (segs)", 1070, 530-30);
    {
      //Variables
      //Variable Buses     
      rect(1245,430-30,60,25); //Numero
      fill(#ff6666);
      rect(1220,430-30,25,25); //Menos
      rect(1300,430-30,25,25); //Mas
      //Variable Pasajeros     
      fill(255);
      rect(1245,470-30,60,25); //Numero
      fill(#ff6666);
      rect(1220,470-30,25,25); //Menos
      rect(1300,470-30,25,25); //Mas
      //Variable Frecuencia     
      fill(255);
      rect(1245,510-30,60,25); //Numero
      fill(#ff6666);
      rect(1220,510-30,25,25); //Menos
      rect(1300,510-30,25,25); //Mas
      fill(0);
      textSize(20);
      text(portal80.datosSimulacion[3],1265,450-30); //Numero de Buses
      text(portal80.datosSimulacion[4],1265,490-30); //Numero de Pasajeros
      textSize(15);
      text(portal80.datosSimulacion[5],1265,530-30); //Frecuencia
      fill(250);
      //Buses
      text("-", 1227,448-30);
      text("+", 1305,448-30);
      //Pasajeros
      text("-", 1227,488-30);
      text("+", 1305,488-30);
      //Frecuencias
      text("-", 1227,528-30);
      text("+", 1305,528-30);
    }
  }
  
  {
  //Prioridad
  //Titulo
  textSize(30);
  text("Prioridad", 1050, 550);
  
  //Boton Anterior
  fill(#ff6666);
  rect(1080, 580, 40, 40);
  fill(250);
  text("<", 1085, 608);
  //Caja Texto Prioridad
  fill(255);
  rect(1120,580,160,40);
  fill(10);
  textSize(25);
  text(obtenerPrioridad(), 1130, 608 );
  //Boton Siguiente
  fill(#ff6666);
  rect(1280, 580, 40, 40);
  fill(255);
  text(">", 1285, 608);
  }
  
  {
    //Ejecución
    //Botón Play
    fill(#ff6666);
    ellipse(1180,700,110,110);
    fill(250);
    textSize(40);
    text("PLAY",1130,710);
  }
  
  //Mostrar Tiempo
  
  
  actualizarObjetos();
  mostrarDatosEnviados();
  
  
}

void actualizarObjetos(){
  actualizarEnlaces();
  actualizarNodos();
}


void actualizarVehiculos(){  
  actualizarG22();
  actualizarH21();
}

void actualizarG22(){
  
  for(int i = 0; i < portal80.contadorG22; i++){
    Vehiculo v = portal80.misG22.get(i);
    fill(240,0,0);
    noStroke();
    
    v.figuraVehiculo = createShape(ELLIPSE,v.ubicacion[0], v.ubicacion[1], 40,40);
    
    shape(v.figuraVehiculo);
    
    fill(0);
    textSize(20);
    text(v.rutaVehiculo.nombreRuta, v.ubicacion[0], v.ubicacion[1]);
  }
}

void actualizarH21(){
  
  for(int i = 0; i < portal80.contadorH21; i++){
    Vehiculo v = portal80.misH21.get(i);
    fill(240,0,0);
    noStroke();
    
    
      v.figuraVehiculo = createShape(ELLIPSE,v.ubicacion[0], v.ubicacion[1], 40,40);
    shape(v.figuraVehiculo);
    
    fill(0);
    textSize(20);
    text(v.rutaVehiculo.nombreRuta, v.ubicacion[0], v.ubicacion[1]);
    
  }
}


void mouseReleased(){
  int x = mouseX;
  int y = mouseY;
  
  
  if(!p){
  if(portal80.revisarBuses()){
    
  boolean xG22Mas = 1300 <= x && x <= 1325;
  boolean yG22Mas = 280-70 <= y && y <= 305-70;
  if(xG22Mas && yG22Mas){    
    portal80.datosSimulacion[0]+=2;
  
  }  
  
  //rect(1300,430,25,25); //Mas
  boolean xH21Mas = 1300 <= x && x <= 1325;
  boolean yH21Mas = 430-30 <= y && y <= 455-30;
  if(xH21Mas && yH21Mas){
    portal80.datosSimulacion[3]+=2;
  }
  }
  
  //rect(1220,280,25,25); //Menos
  boolean xG22Menos = 1220 <= x && x <= 1245;
  boolean yG22Menos = 280-70 <= y && y <= 305-70;
  if(portal80.datosSimulacion[0] != 0){
    if(xG22Menos && yG22Menos){
      portal80.datosSimulacion[0]-=2;
    }
  }
  
  //rect(1220,430,25,25); //Menos
  boolean xH21Menos = 1220 <= x && x <= 1245;
  boolean yH21Menos = 430-30 <= y && y <= 455-30;
  if(portal80.datosSimulacion[3] != 0){
    if(xH21Menos && yH21Menos){
      portal80.datosSimulacion[3]-=2;
    }
  }
  
  //Pasajeros
  //G22
  //rect(1300,320,25,25); //Mas
  boolean xG22MasP = 1300 <= x && x <= 1325;
  boolean yG22MasP = 320-70 <= y && y <= 345-70;
  if(portal80.datosSimulacion[1] < 600 && xG22MasP && yG22MasP){
    portal80.datosSimulacion[1]+=20;
  }
  //rect(1220,320,25,25); //Menos
  boolean xG22MenosP = 1220 <= x && x <= 1245;
  boolean yG22MenosP = 320-70 <= y && y <= 345-70;
  if(portal80.datosSimulacion[1] != 0 && xG22MenosP && yG22MenosP){
    portal80.datosSimulacion[1]-=5;
  }
  
  //H21
  //rect(1300,470,25,25); //Mas
  boolean xH21MasP = 1300 <= x && x <= 1325;
  boolean yH21MasP = 470-30 <= y && y <= 495-30;
  if(portal80.datosSimulacion[4] < 600 && xH21MasP && yH21MasP){
    portal80.datosSimulacion[4]+=20;
  }
  //rect(1220,470,25,25); //Menos
  boolean xH21MenosP = 1220 <= x && x <= 1245;
  boolean yH21MenosP = 470-30 <= y && y <= 495-30;
  if(portal80.datosSimulacion[4] != 0 && xH21MenosP && yH21MenosP){
    portal80.datosSimulacion[4]-=5;
  }
  
  
  
  //G22
  //Frecuencia
  //rect(1300,360-70,25,25); //Mas
  boolean xFG22Mas = 1300 <= x && x <= 1325;
  boolean yFG22Mas = 360-70 <= y && y <= (360-70)+25;
  if(xFG22Mas && yFG22Mas){
    portal80.datosSimulacion[2]+=5;
  }
  
  //rect(1220,360-70,25,25); //Menos
  boolean xFG22Menos = 1220 <= x && x <= 1245;
  boolean yFG22Menos = 360-70 <= y && y <= (360-70)+25;
  if(portal80.datosSimulacion[2]!=0){
    if(xFG22Menos && yFG22Menos){
      portal80.datosSimulacion[2]-=5;
    }
  }
  
  //H21
  //Frecuencia
  //rect(1300,510-30,25,25); //Mas
  boolean xFH21Mas = 1300 <= x && x <= 1325;
  boolean yFH21Mas = 510-30 <= y && y <= (510-30)+25;
  
    if(xFH21Mas && yFH21Mas){
      portal80.datosSimulacion[5]+=5;
    }
  
  //rect(1220,510-30,25,25); //Menos
  boolean xFH21Menos = 1220 <= x && x <= 1245;
  boolean yFH21Menos = 510-30 <= y && y <= (510-30)+25;
  if(portal80.datosSimulacion[5]!=0){
    if(xFH21Menos && yFH21Menos){
      portal80.datosSimulacion[5]-=5;
    }
  }
  
  }
  //+++++
  
  //Prioridad
  //Anterior
  //rect(1080, 580, 40, 40);
  boolean xAnterior = 1080 <= x && x <= 1120;
  boolean yAnterior = 580 <= y && y <= 620;
  
  if(xAnterior && yAnterior){
    if(portal80.opcionPrioridad == 1){
      portal80.opcionPrioridad = 2;
    }
    else{
      portal80.opcionPrioridad--;
    }
  }
  
  //Siguiente
  //rect(1280, 580, 40, 40);
  boolean xSiguiente = 1280 <= x && x <= 1320;
  boolean ySiguiente = 580 <= y && y <= 620;
  if(xSiguiente && ySiguiente){
    if(portal80.opcionPrioridad == 2){
      portal80.opcionPrioridad = 1;
    }
    else{
      portal80.opcionPrioridad++;
    }
  }
  
  //Play
  //ellipse(1180,630,150,150); ellipse(1180,630,150,150);
  boolean xPlay = (1180-(150/2)) <= x && x <= (1180+(150/2));
  boolean yPlay = (630-(150/2)) <= y && y <= (630+(150/2));  
  
  
  if(xPlay && yPlay && !portal80.datosEnviados){
    //println(portal80.comprobarDatosBuses());
    
    if(portal80.comprobarDatosConjuntos()){
      portal80.alistarDatos();
      
    alistarPasajeros();
    portal80.datosEnviados = true;
    p = true;
    portal80.tiempo = millis();
    portal80.establecerRutaPrioridad();
    }
  }
 
}

void alistarPasajeros(){
  //Nodo 8 = Parada de Carga de Pasajeros para G22
  nodo8.pasajeros = portal80.datosSimulacion[1];
  //Nodo 19 = Para de Carga de Pasajeros para H21
  nodo19.pasajeros = portal80.datosSimulacion[4];
  
  //Comprobación
  
}

//150
//Carga 100
//Descarga 200
void actualizarNodos(){
  for(int i = 0; i < misNodos.size(); i++){
    Nodo nodo = misNodos.get(i);
    
    
    if(!(nodo.paradaCarga || nodo.paradaDescarga)){
      fill(150);
      noStroke();
      ellipse(misNodos.get(i).ubicacion[0],misNodos.get(i).ubicacion[1],30,30);
    }
    
    
    
    
    if(misNodos.get(i).paradaCarga){
      fill(100);
      noStroke();
      ellipse(misNodos.get(i).ubicacion[0],misNodos.get(i).ubicacion[1],30,30);
    }
    if(misNodos.get(i).paradaDescarga){
      fill(180);
      noStroke();
      ellipse(misNodos.get(i).ubicacion[0],misNodos.get(i).ubicacion[1],30,30);
    }
    if(nodo.interseccion){
      fill(250);
      stroke(10);
      strokeWeight(1);
      ellipse(misNodos.get(i).ubicacion[0],misNodos.get(i).ubicacion[1],30,30);
    }
    
  }
}

void actualizarEnlaces(){
  for(int i = 0; i < misEnlaces.size(); i++){
    stroke(150);
    strokeWeight(12);
    line(misEnlaces.get(i).xa,misEnlaces.get(i).ya,misEnlaces.get(i).xb,misEnlaces.get(i).yb);
  }
}

void mostrarDatosEnviados(){
  if(portal80.datosEnviados){
    
    
  }
}


void cronometro(){
    if(!simulacionTerminada()){
      portal80.tiempoActual = -(portal80.tiempo - millis())/1000;
    }  
    
    fill(10);
    //println("--"+portal80.tiempoActual+"--");
    textSize(20);
    text("Tiempo de ", 50 ,650);
    text("Simulación", 50, 680);
    textSize(25);
    int x = 35;
    text(portal80.tiempoActual,x,720);
    
    if(portal80.tiempoActual <= 1){
      text("segundo", 75, 720);
    }
    else{
      if(portal80.tiempoActual > 1 && portal80.tiempoActual < 100){
        text("segundos" , 75, 720);
      }
      if(portal80.tiempoActual >= 100 && portal80.tiempoActual <= 999){
        text("segundos", 88, 720);       
        }
      
      if(portal80.tiempoActual > 999){
        text("segundos", 97, 720);
      }
    }
      
    }
    
    



boolean tieneDatosG22(){
  return ((portal80.datosSimulacion[0] > 0) && (portal80.datosSimulacion[1] > 0) && (portal80.datosSimulacion[2] > 0)); 
}

boolean tieneDatosH21(){
  return ((portal80.datosSimulacion[3] > 0) && (portal80.datosSimulacion[4] > 0) && (portal80.datosSimulacion[5] > 0)); 
}

void cicloNodosOcupados(){
  for(int i = 0; i < misNodos.size(); i++){
    Nodo a = misNodos.get(i);
    //println("Nodo " + a.id + ". Ocupado: " + a.ocupadoV);
  }
}

//La simulacion termina cuando todos los vehiculos creados han salido del portal. Es decir cuando sus coordenadas son 4000,4000
boolean simulacionTerminada(){
  boolean finalizado = true;
  for(int i = 0; i < portal80.datosSimulacion[0] + portal80.datosSimulacion[3]; i++){
    Vehiculo n = portal80.vehiculosPortal.get(i);
    if(n.ubicacion[0] == 4000 && n.ubicacion[1] == 4000){
      finalizado &= true;
    }
    else{
      finalizado &= false;
    }
  }
  
  return finalizado;
}
 
 
 
 //Ver
 void verPasajerosNodos(){
   for(int i = 0; i < misNodos.size(); i++){
     Nodo n = misNodos.get(i);
     //println("Nodo " + n.id + ". Número de Pasajeros: " + n.pasajeros + ". Ocupado: " + n.ocupadoV);
   }
 }
 
String obtenerPrioridad(){
  switch(portal80.opcionPrioridad){
    case 1:
    return "Ruta 22";
    case 2:
    return "Ruta 21";
    
  }
  return "-error-";
}  

void infoG22(){
  textSize(25);
  fill(10);
  text("G22", 250, 650);
  textSize(20);
  text("Buses Enviados: ", 260, 680);
  text(portal80.contadorG22, 420, 680);
  text("Pasajeros esperando: ", 260, 710);
  text(nodo8.pasajeros, 470, 710 );
  if(simulacionTerminada()){
    fill(10);
    text("Tiempo de salida: ", 260, 740);
    fill(10);
    text(promedioG22() + " segundos", 445, 740);
    
  }
}

void infoH21(){
  textSize(25);
  fill(10);
  text("H21", 650, 650);
  textSize(20);
  text("Buses Enviados: ", 660, 680);
  text(portal80.contadorH21, 820, 680);
  text("Pasajeros esperando: ", 660, 710);
  text(nodo19.pasajeros, 870, 710 );
  if(simulacionTerminada()){
    fill(10);
    text("Tiempo de salida: ", 660, 740);
    fill(10);
    text(promedioH21() + " segundos", 845, 740);
    
  }
}


int promedioG22(){
  int suma = 0;
  for(int i = 0; i < portal80.misG22.size()/2; i++){
    Vehiculo v = portal80.misG22.get(i);
    suma += v.tiempoTotal;
  }
  int promedio = suma/(portal80.misG22.size()/2);
  return promedio;
}

int promedioH21(){
  int suma = 0;
  for(int i = 0; i < portal80.misH21.size()/2; i++){
    Vehiculo v = portal80.misH21.get(i);
    suma += v.tiempoTotal;
  }
  int promedio = suma/(portal80.misH21.size()/2);
  return promedio;  
}
