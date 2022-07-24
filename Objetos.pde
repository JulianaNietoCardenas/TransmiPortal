int cid = 1; //Contador de Identificaciones
class Estructuras{
  int id;
  float[] ubicacion = new float[2];
}

class Nodo extends Estructuras{
  boolean paradaCarga = false;
  boolean paradaDescarga = false;
  boolean interseccion = false;
  boolean ocupadoV = false;
  boolean prioridad = false;
  int pasajeros = 0;
  Vehiculo vehiculoNodo;
  ArrayList<Solicitud> solicitudesNodo = new ArrayList<Solicitud>();
  Nodo(float x, float y){
    id = cid;
    cid++;
    ubicacion[0] = x;
    ubicacion[1] = y;
    vehiculoNodo = v1;
    
    misNodos.add(this);
  }
}

class Enlace extends Estructuras{
  Nodo nodoInicio;
  Nodo nodoFin;
  float xa, ya, xb, yb;
  Enlace(Nodo inicio, Nodo fin){
    nodoInicio = inicio;
    nodoFin = fin;
    float x1 = nodoInicio.ubicacion[0];
    float y1 = nodoInicio.ubicacion[1];
    float x2 = nodoFin.ubicacion[0];
    float y2 = nodoFin.ubicacion[1];
    xa = x1;
    ya = y1;
    xb = x2;
    yb = y2;
    misEnlaces.add(this);
  }
  
}


class Vehiculo extends Estructuras{
  
  Nodo nodoVehiculo;
  Nodo nodoSiguiente;
  Nodo nodoParada;
  Ruta rutaVehiculo;
  PShape figuraVehiculo;
  boolean movido = false;
  int c1,c2,c3;
  boolean rutaTerminada = false;
  int tiempoParada;
  int capturaTiempo;
  int pasajeros;
  boolean recogiendo = false;
  boolean capturado = false;
  boolean ocupadoSiguiente;
  
  int tiempoCarga;  
  int tiempoSalida;
  int tiempoTotal;
  Vehiculo(Ruta ruta){
    id = cid;
    cid++;
    Nodo nodo = ruta.nodosRuta.get(0);    
    ruta.nodosRuta.get(0).vehiculoNodo = this;
    rutaVehiculo = ruta;
    nodoVehiculo = nodo;
    nodoVehiculo.ocupadoV = true;
    tiempoParada = (int)random(3,7);
    ubicacion[0] = nodo.ubicacion[0];
    ubicacion[1] = nodo.ubicacion[1];
    asignarNodoParada();
    
    misVehiculos.add(this);
    noStroke();
    c1 = (int)random(100,255);
    c2 = (int)random(0,255);
    c3 = (int)random(0,255);
    fill(c1,c2,0);
    
    
    
  }
  
  void recogerPasajeros(){
    if(rutaVehiculo.nombreRuta == "G22" || rutaVehiculo.nombreRuta == "H21"){
      int numRecoger = (int) random(240,260);      
      this.pasajeros = numRecoger;
      int pasajerosEsperando = nodoParada.pasajeros;
      this.tiempoCarga = portal80.tiempoActual;
      if(pasajerosEsperando - numRecoger > 0){
        nodoParada.pasajeros = pasajerosEsperando - numRecoger;
      }
      else{
        nodoParada.pasajeros = 0;
      }
      
    }
    
  }
  
  void asignarNodoParada(){
    
    if(rutaVehiculo.nombreRuta == "H21"){
      nodoParada = nodo19;
    }
    
    if(rutaVehiculo.nombreRuta == "D21"){
      nodoParada = nodo20;
    }
    
    if(rutaVehiculo.nombreRuta == "G22"){
      nodoParada = nodo8;
    }
    
    if(rutaVehiculo.nombreRuta == "D22"){
      nodoParada = nodo7;
    }
    
  }
  
  void ocupado(){
    for(int i = 0; i < misNodos.size(); i++){
      Nodo a = misNodos.get(i);
      if(cercaNodo(a)){
        misNodos.get(i).ocupadoV = true;
      }
      else{
        misNodos.get(i).ocupadoV = false;
      }
    }
  }
  
  Nodo cerca(){
    for(int i = 0; i < misNodos.size(); i++){
      Nodo a = misNodos.get(i);
      if(cercaNodo(a)){
        return a;
      }
    }
    return null;
  }
  
  
  void moverSiguiente(){
  
  
    int act = rutaVehiculo.nodosRuta.indexOf(nodoVehiculo);
    
    
    //Verificación cercanía nodo Actual
    if(!cercaNodo(rutaVehiculo.nodosRuta.get(act))){
      rutaVehiculo.nodosRuta.get(act).ocupadoV = false;
      rutaVehiculo.nodosRuta.get(act).vehiculoNodo = null;
    }
    else{
      
      
        rutaVehiculo.nodosRuta.get(act).ocupadoV = true;
        rutaVehiculo.nodosRuta.get(act).vehiculoNodo = this;
      
      
    }
    
    
    
    
    
  act++;
  
    
  
  if(act < rutaVehiculo.nodosRuta.size()){
    
    
    if(!rutaVehiculo.nodosRuta.get(act).ocupadoV || rutaVehiculo.nodosRuta.get(act).vehiculoNodo == this){
      rutaVehiculo.nodosRuta.get(act).vehiculoNodo = this;
      rutaVehiculo.nodosRuta.get(act).ocupadoV = true;
      
      if(!rutaTerminada){
    
    
  
  float push = random(0,.1/7);  
  float miX = lerp(nodoVehiculo.ubicacion[0],rutaVehiculo.nodosRuta.get(act).ubicacion[0],push);
  float miY = lerp(nodoVehiculo.ubicacion[1],rutaVehiculo.nodosRuta.get(act).ubicacion[1],push);
  float X = miX - nodoVehiculo.ubicacion[0];
  float Y = miY - nodoVehiculo.ubicacion[1];
  
  
  
  println(" -- -- -- -- " + cercaPrioridad(act) + " -- " + rutaVehiculo.nombreRuta);
  if(cercaPrioridad(act)){
    println(" -- --  " + portal80.rutaPrioridad == "22");
    if(portal80.rutaPrioridad == "22"){
      println(" " + rutaVehiculo.nombreRuta == "G22" || rutaVehiculo.nombreRuta == "D22");
      if(rutaVehiculo.nombreRuta == "G22" || rutaVehiculo.nombreRuta == "D22"){
        rutaVehiculo.nodosRuta.get(act).prioridad = true;
      }
    }
    if(portal80.rutaPrioridad == "21"){
      if(rutaVehiculo.nombreRuta == "H21" || rutaVehiculo.nombreRuta == "D21"){
        rutaVehiculo.nodosRuta.get(act).prioridad = true;
      }
    }    
  }
  else{
    rutaVehiculo.nodosRuta.get(act).prioridad = false;
  }
  
  
  if(cercaNodo(rutaVehiculo.nodosRuta.get(act))){
    
    
    nodoVehiculo = rutaVehiculo.nodosRuta.get(act);
    
    rutaVehiculo.nodosRuta.get(act).vehiculoNodo = this;
    ubicacion[0] = nodoVehiculo.ubicacion[0];
    ubicacion[1] = nodoVehiculo.ubicacion[1];
    
  }
  if(!recogiendo){
    if(!rutaVehiculo.nodosRuta.get(act).prioridad){
      ubicacion[0] += X;
      ubicacion[1] += Y;
    }else{
      if(rutaVehiculo.nodosRuta.get(act).vehiculoNodo == this){
        ubicacion[0] += X;
      ubicacion[1] += Y;
      }
    }
    
  }
  
  if(cercaNodo(nodoParada) && !capturado){
    capturaTiempo = portal80.tiempoActual;
    recogiendo = true;
    capturado = true;
    recogerPasajeros();
  } 
  
  if(capturaTiempo <= portal80.tiempoActual && portal80.tiempoActual <= capturaTiempo + tiempoParada){
  }
  else{
    recogiendo = false;
  }
  
  }//--
    }
  
  
  }
  else{
    if(!rutaTerminada){
     println("FIN---");
    ubicacion[0] = 4000;
    ubicacion[1] = 4000;
    rutaTerminada = true;
    tiempoSalida = portal80.tiempoActual;
    tiempoTotal = tiempoSalida - tiempoCarga;
    }    
  } //Fin Verificacion Ruta
  
  
  
  
  
  
  }

  boolean cercaPrioridad(int a){
    int n = a + 2;
    int n2 = a + 1;
    if(n < rutaVehiculo.nodosRuta.size()){
      Nodo nodoC = rutaVehiculo.nodosRuta.get(n);
    if(nodoC.id == 12){
      return true;
    }
    if(rutaVehiculo.nodosRuta.get(n2).id == 12){
      return true;
    }
    if(rutaVehiculo.nodosRuta.get(a).id == 12){
      return true;
    }
    else{
      return false;
    }  
    }
    else{
      return false;
    }
}
  
  boolean siguienteVacio(){
    
    int act = rutaVehiculo.nodosRuta.indexOf(v1.nodoVehiculo);
    if(act < rutaVehiculo.nodosRuta.size() - 1){
      act++;
      Nodo nodoSiguiente = rutaVehiculo.nodosRuta.get(act);
      int s = misNodos.indexOf(nodoSiguiente);
      Nodo n = misNodos.get(s);
      
      //println("---Nodo " + n.id + ". Ocupado: " + n.ocupadoV);
      return !n.ocupadoV;
    }
    else{
      return false;
    }
    
  }
  
  void moverRuta(){
    
    while(siguienteVacio()){
      moverSiguiente();
    }
  }
  
  boolean cercaNodo(Nodo nodo){
    float v1 = nodo.ubicacion[0]-2;
    float v2 = nodo.ubicacion[0]+2;
    float v3 = nodo.ubicacion[1]-2;
    float v4 = nodo.ubicacion[1]+2;
    float X = ubicacion[0];
    float Y = ubicacion[1];
    return v1 <= X && X <= v2 && v3 <= Y && Y <= v4;
  }
  
  boolean nodoUbicado(){
    float mx = this.ubicacion[0];
    float my = this.ubicacion[1];
    for(int i = 0; i < misNodos.size(); i++){
      float nx = misNodos.get(i).ubicacion[0];
      float ny = misNodos.get(i).ubicacion[1];
      if(mx == nx && ny == nx){
        return true;
      }
    }
    return false;
  } 
  
  
}

class Ruta{
  String nombreRuta;
  ArrayList<Nodo> nodosRuta = new ArrayList<Nodo>();
  
  Ruta(String nombre){
    nombreRuta = nombre;
  }
  void agregar(Nodo nodo){ //Agregar Nodo
    nodosRuta.add(nodo);
  }
  
}

class Solicitud{
  int id;
  String ruta;
  int numPas;
  int tipo;
}

void ubicarNodos(){
  for(int i = 0; i < misVehiculos.size(); i++){
    boolean ubicado = false;
    Vehiculo vehiculoActual = misVehiculos.get(i);
    while(!ubicado){
      for(int j = 0; j < misNodos.size(); j++){
        
      }
    }
  }
}
