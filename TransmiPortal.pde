import javax.swing.JOptionPane;

//Variables de control de la simulación
boolean p = false;  //Si p es true; significa que el usuario ya ha ingresado datos y dado clic al botón de Play 
boolean fin = false; //Si fin es true, significa que ya todos los buses creados han terminado su recorrido por el portal

portal portal80;
Ruta G22 = new Ruta("G22");
Ruta D22 = new Ruta("D22");
Ruta H21 = new Ruta("H21");
Ruta D21 = new Ruta("D21");
Vehiculo v1;
ArrayList<Vehiculo> misVehiculos = new ArrayList<Vehiculo>();
ArrayList<Nodo> misNodos = new ArrayList<Nodo>();
ArrayList<Enlace> misEnlaces = new ArrayList<Enlace>();

Nodo nodo1, nodo2, nodo3, nodo4, nodo5, nodo6, nodo7, nodo8, nodo9, nodo10, nodo11, nodo12, nodo13, nodo14, nodo15, nodo16, nodo17, nodo18, nodo19, nodo20, nodo21;


int prueba = 0;
void setup() {
  portal80 = new portal();
  fullScreen();
  background(250);


  nodo1 = new Nodo(542, 509);
  nodo2 = new Nodo(583, 424);  
  nodo3 = new Nodo(637, 319);
  nodo4 = new Nodo(691, 222);
  nodo5 = new Nodo(732, 125);
  nodo6 = new Nodo(662, 78);
  nodo7 = new Nodo(568, 77);
  nodo7.paradaDescarga = true;
  nodo8 = new Nodo(456, 94);
  nodo8.paradaCarga = true;
  nodo9 = new Nodo(374, 135);
  nodo10 = new Nodo(292, 180);
  nodo11 = new Nodo(222, 239);  
  nodo12 = new Nodo(258, 332);
  
  nodo13 = new Nodo(356, 397);
  nodo14 = new Nodo(452, 365);
  nodo15 = new Nodo(565, 311);
  nodo16 = new Nodo(539, 381);
  nodo17 = new Nodo(492, 462);
  nodo18 = new Nodo(336, 284);
  nodo19 = new Nodo(424, 222);
  nodo19.paradaCarga = true;
  nodo20 = new Nodo(520, 198);
  nodo20.paradaDescarga = true;
  nodo21 = new Nodo(604, 202);
  Enlace e1 = new Enlace(nodo1, nodo2);
  Enlace e2 = new Enlace(nodo2, nodo3);
  Enlace e3 = new Enlace(nodo3, nodo4);
  Enlace e4 = new Enlace(nodo4, nodo5);
  Enlace e5 = new Enlace(nodo5, nodo6);
  Enlace e6 = new Enlace(nodo6, nodo7);
  Enlace e7 = new Enlace(nodo7, nodo8);
  Enlace e8 = new Enlace(nodo8, nodo9);
  Enlace e9 = new Enlace(nodo9, nodo10);
  Enlace e10 = new Enlace(nodo10, nodo11);
  Enlace e11 = new Enlace(nodo11, nodo12);  
  Enlace e12 = new Enlace(nodo12, nodo13);
  Enlace e13 = new Enlace(nodo13, nodo14);
  Enlace e14 = new Enlace(nodo14, nodo15);
  Enlace e15 = new Enlace(nodo15, nodo16);  
  Enlace e16 = new Enlace(nodo16, nodo17);
  Enlace e4b = new Enlace(nodo4, nodo21);
  Enlace e21 = new Enlace(nodo21, nodo20);
  Enlace e20 = new Enlace(nodo20, nodo19);
  Enlace e19 = new Enlace(nodo19, nodo18);
  Enlace e18 = new Enlace(nodo18, nodo12);

  G22.agregar(nodo1);
  G22.agregar(nodo2);
  G22.agregar(nodo3);
  G22.agregar(nodo4);
  G22.agregar(nodo5);
  G22.agregar(nodo6);
  G22.agregar(nodo7);
  G22.agregar(nodo8);
  G22.agregar(nodo9);
  G22.agregar(nodo10);
  G22.agregar(nodo11);
  G22.agregar(nodo12);
  G22.agregar(nodo13);
  G22.agregar(nodo14);
  G22.agregar(nodo15);
  G22.agregar(nodo16);
  G22.agregar(nodo17);

  D22.agregar(nodo1);
  D22.agregar(nodo2);
  D22.agregar(nodo3);
  D22.agregar(nodo4);
  D22.agregar(nodo5);
  D22.agregar(nodo6);
  D22.agregar(nodo7);
  D22.agregar(nodo8);
  D22.agregar(nodo9);
  D22.agregar(nodo10);
  D22.agregar(nodo11);
  D22.agregar(nodo12);
  D22.agregar(nodo13);
  D22.agregar(nodo14);
  D22.agregar(nodo15);
  D22.agregar(nodo16);
  D22.agregar(nodo17);

  H21.agregar(nodo1);
  H21.agregar(nodo2);
  H21.agregar(nodo3);
  H21.agregar(nodo4);
  H21.agregar(nodo21);
  H21.agregar(nodo20);
  H21.agregar(nodo19);
  H21.agregar(nodo18);
  H21.agregar(nodo12);
  H21.agregar(nodo13);
  H21.agregar(nodo14);
  H21.agregar(nodo15);
  H21.agregar(nodo16);
  H21.agregar(nodo17);

  D21.agregar(nodo1);
  D21.agregar(nodo2);
  D21.agregar(nodo3);
  D21.agregar(nodo4);
  D21.agregar(nodo21);
  D21.agregar(nodo20);
  D21.agregar(nodo19);
  D21.agregar(nodo18);
  D21.agregar(nodo12);
  D21.agregar(nodo13);
  D21.agregar(nodo14);
  D21.agregar(nodo15);
  D21.agregar(nodo16);
  D21.agregar(nodo17);

  
  
   
}
int ij = 0;
void draw() {
  background(250);

  interfaz();
  
  

  verPasajerosNodos();


  if (p) {
    //v1.moverRuta();
    actualizarVehiculos();
    portal80.moverVehiculos();
    
  }

  for (int i = 0; i < portal80.vehiculosPortal.size(); i++) {
    Vehiculo v = portal80.vehiculosPortal.get(i);
    
  }
  
  cicloNodosOcupados();
}

class portal {
  //Clase Principal
  /*Esta clase contiene la información del portal:
   - Mapa (nodos)
   - Rutas (G22, H21)
   - Datos de Simulación (Número de Buses y Pasajeros asignados por el usuario para cada ruta)
   */
  int[] datosSimulacion = {0, 0, 0, 0, 0, 0}; 
  /*datosSimulacion[0] <- G22: Numero de Buses
   datosSimulacion[1] <- G22: Numero de Pasajeros
   datosSimulacion[2] <- G22: Intervalo de tiempo de llegada de los buses al portal
   datosSimulacion[3] <- H21: Numero de Buses
   datosSimulacion[4] <- H21: Numero de Pasajeros
   datosSimulacion[5] <- H21: Intervalo de tiempo de llegada de los buses al portal
   */
  Nodo[] nodosPortal = new Nodo[21];

  
  int tiempoG22, tiempoH21;

  boolean inicioVehiculosG22 = false;
  boolean inicioVehiculosH21 = false;

  String rutaPrioridad;

  int contadorG22 = 0;
  int contadorH21 = 0;
  //Vehiculo[] vehiculosPortal = new Vehiculo[20];
  ArrayList<Vehiculo> vehiculosPortal = new ArrayList<Vehiculo>();
  ArrayList<Vehiculo> misG22 = new ArrayList<Vehiculo>();
  ArrayList<Vehiculo> misH21 = new ArrayList<Vehiculo>();
  
  
  boolean datosEnviados = false;
  int tiempo;
  int tiempoActual;
  
  //Opcion Prioridad
  int opcionPrioridad = 1;
  
  boolean revisarBuses() {
    int totalBuses = 0;
    for (int i = 0; i < datosSimulacion.length; i+=3) {
      totalBuses += datosSimulacion[i];
    }

    return !(totalBuses >= 20);
  }

  void cronometroVehiculos() {
    if(opcionPrioridad == 1){
      casoG22();
    }
    if(opcionPrioridad == 2){
      casoH21();
    }
    
    
  }
  
  void casoG22(){
    //G22
    if(tieneDatosG22()){
      if (tiempoActual == 0 && !inicioVehiculosG22) {      
      inicioVehiculosG22 = true;
      contadorG22++;
    }

    if (tiempoActual - tiempoG22 >= datosSimulacion[2] && contadorG22 < datosSimulacion[0]) {      
      tiempoG22 = tiempoActual;
      
      if(!H21.nodosRuta.get(0).ocupadoV){
        contadorG22++;
      }
      
    }
    }
    
    //H21
    if(contadorG22 == datosSimulacion[0]){
      if(tieneDatosH21()){
      if (tiempoActual >= datosSimulacion[0]*datosSimulacion[2] && !inicioVehiculosH21) {
      
      if(!H21.nodosRuta.get(0).ocupadoV){
        inicioVehiculosH21 = true;
        contadorH21++;
        tiempoH21 = tiempoActual;
      }      
    }

    if (tiempoActual - tiempoH21 >= datosSimulacion[5] && contadorH21 < datosSimulacion[3] && inicioVehiculosH21) {
      tiempoH21 = tiempoActual;
      if(!H21.nodosRuta.get(0).ocupadoV){
        contadorH21++;
      }
      
    }
    }
    }    
  }
  
  void casoH21(){
  
    //H21    
      if(tieneDatosH21()){
      if (tiempoActual == 0 && !inicioVehiculosH21) {
      inicioVehiculosH21 = true;
      contadorH21++;
      }

    if (tiempoActual - tiempoH21 >= datosSimulacion[5] && contadorH21 < datosSimulacion[3]) {
      tiempoH21 = tiempoActual;
      contadorH21++;
    }
    
    }  
    
  //G22
  if(contadorH21 == datosSimulacion[3]){
    if(tieneDatosG22()){
      if (tiempoActual >= datosSimulacion[3]*datosSimulacion[5] && !inicioVehiculosG22) {      
      if(!G22.nodosRuta.get(0).ocupadoV){
        inicioVehiculosG22 = true;
        contadorG22++;
        tiempoG22 = tiempoActual;
      } 
    }

    if (tiempoActual - tiempoG22 >= datosSimulacion[2] && contadorG22 < datosSimulacion[0] && inicioVehiculosG22) {      
      tiempoG22 = tiempoActual;
      
      if(!H21.nodosRuta.get(0).ocupadoV){
        contadorG22++;
      }
      
    }
    
    
    }
  }   
  }

  void alistarDatos() {
    alistarVehiculos();
  }

  void alistarVehiculos() {
    alistarG22();
    alistarH21();
  }


  void alistarG22() {
    //G22
    for (int i = 0; i < datosSimulacion[0]/2; i++) {
      Vehiculo vi = new Vehiculo(G22);
      misG22.add(vi);
      vehiculosPortal.add(vi);
    }
    //D22
    for (int i = 0; i < datosSimulacion[0]/2; i++) {
      Vehiculo vi = new Vehiculo(D22);
      misG22.add(vi);
      vehiculosPortal.add(vi);
    }
  }

  void alistarH21() {
    //H21
    for (int i = 0; i < datosSimulacion[3]/2; i++) {
      Vehiculo vi = new Vehiculo(H21);
      misH21.add(vi);
      vehiculosPortal.add(vi);
    }
    //D21
    for (int i = 0; i < datosSimulacion[3]/2; i++) {
      Vehiculo vi = new Vehiculo(D21);
      misH21.add(vi);
      vehiculosPortal.add(vi);
    }
  }

  /*La función del siguiente método es comprobar si las variables para los buses de cada una de las rutas del
   portal ya han sido inicializadas*/
  boolean comprobarDatosBuses() {
    return !(datosSimulacion[0] == 0 && datosSimulacion[3] == 0);
  }

  /*La función de comprobarFrecuencia verifica que exista un número entero mayor a cero ingresado dentro de las casillas para
   cada una de las rutas del portal*/
  boolean comprobarDatosFrecuencia() {
    return !(datosSimulacion[2] == 0 && datosSimulacion[5] == 0);
  }

  boolean comprobarDatosConjuntos() {
    if (datosSimulacion[0] > 0) {
      return datosSimulacion[2] > 0;
    } else {
      if (datosSimulacion[3] > 0) {
        return datosSimulacion[5] > 0;
      }
    }
    return false;
  }


  //Mueve los vehiculos del portal
  void moverVehiculos() {
    if(opcionPrioridad == 1){    
      moverG22();
      moverH21();
    }
    if(opcionPrioridad == 2){
      moverH21();
      moverG22();
    }    
  }
  
  void moverG22(){
    for(int i = 0; i < portal80.contadorG22; i++){
    Vehiculo v = portal80.misG22.get(i);
    v.moverSiguiente();
    
  }
  }
  
  void moverH21(){
    for(int i = 0; i < portal80.contadorH21; i++){
    Vehiculo v = portal80.misH21.get(i);
    v.moverSiguiente();
    
  }
  }
  
  void establecerRutaPrioridad(){
    if(opcionPrioridad == 1){
      rutaPrioridad = "22";
    }
    if(opcionPrioridad == 2){
      rutaPrioridad = "21";
    }
  }
  }
  
  
