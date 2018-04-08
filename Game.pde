class Tablero{

  int[][] grid;
  int dimension =0;
  FichaGame ficha;
  int isPair =0;
  int turno =0;
  int square =0;
  Play plays;
  ArrayList<FichaGame> fichas;
  int heigh=0;
  Tablero(int dimension,int heigh){
    this.turno = -1;
    this.heigh=heigh;
    this.dimension = dimension;
    this.grid = new int[dimension][dimension];
    this.isPair = dimensionPair();
    this.plays = new Play(this.grid,this.dimension);
    this.fichas = new ArrayList<FichaGame>();   
    int a,b;
    if(this.isPair==0){
      a = this.dimension/2;
      b = a-1;
    }else{
      a = (int)(this.dimension/2);
      b = (int)(Math.ceil(this.dimension/2));
    }

    grid[a][a]=1;
    grid[b][b]=1;
    grid[b][a]=-1;
    grid[a][b]=-1;
    
    FichaGame Empty;
    this. square =  (heigh/this.dimension);
    
    FichaGame ficha1 = new FichaGame(1,a,a,this.square);
    FichaGame ficha2 = new FichaGame(1,b,b,this.square);
    FichaGame ficha3 = new FichaGame(-1,b,a,this.square);
    FichaGame ficha4 = new FichaGame(-1,a,b,this.square);
    System.out.println(ficha1.toString());
    System.out.println(ficha2.toString());
    System.out.println(ficha3.toString());
    System.out.println(ficha4.toString());
    
    //this.fichas.add(ficha1);
    //this.fichas.add(ficha2);
    //this.fichas.add(ficha3);
    //this.fichas.add(ficha4);
    System.out.println(fichas.size());
    
    this.plays.addBlack(ficha3);
    this.plays.addBlack(ficha4);
    this.plays.addWhite(ficha1);
    this.plays.addWhite(ficha2);
    System.out.println("***************************");
    //System.out.println(this.plays.black.size());
    //ficha1.drawFichaGame();
    //ficha2.drawFichaGame();
    //ficha3.drawFichaGame();
    //ficha4.drawFichaGame();
     /*for(FichaGame ficha : this.plays.black){
       ficha.drawFichaGame();
      // System.out.println(ficha.toString());
    }
     for(FichaGame ficha : this.plays.white){
       ficha.drawFichaGame();
      // System.out.println(ficha.toString());
    }*/
  }
  public void drawGrid(){
    this.square =  (this.heigh/this.dimension);
    for(int i=0; i< this.dimension+1;i++){
       line(this.square*i,0,this.square*i,this.heigh);
       line(0,this.square*i,this.heigh,this.square*i);      
    } 
    
    
  }

  
  
  private int dimensionPair(){
     if((this.dimension%2)==0){
         return 0;
     }
      return 1;
  }
  
  public void jugadasB(){
     System.out.println("NEGRAS");
    this.plays.playsBlack();
  }
  
  public void jugadasW(){
     System.out.println("Blancas");
    this.plays.playsWhite();
  }
    //if(this.turno == 1){
         
    //if(this.turno == -1){
    
   // }
   
  



}
Tablero juego = new Tablero(8,512);
void setup(){
background(248, 249, 249);
size(512, 512);
}

Boolean bandera2 = true;
void draw(){
  //background(248, 249, 249);
  juego.drawGrid();
   if(bandera2==true){
    System.out.println("ENTRO++++++++++++++++++++++"); 
    juego.plays.pintar();
    bandera2=false;
    System.out.println("ENTRO++++++++++++++++++++++");
  } 
}

Boolean bandera = false;

void mouseClicked() {
  //println(mouseX/(width/tablero.dimension), mouseY/(height/tablero.dimension));
  int i = mouseX/(width/juego.dimension); 
  int j =  mouseY/(height/juego.dimension);
  
 
  System.out.println(juego.turno);
  System.out.println(bandera);
  if(bandera == false){
  if(juego.turno==-1)
   juego.jugadasB();
   if(juego.turno==1)
   juego.jugadasW();
  }
  if(juego.turno == -1){
    bandera=true;
    if(juego.plays.pBlack(j,i)==true){
     bandera=false;      
      juego.turno = 1;
      juego.plays.pintar();
    }
    if(bandera == false){
  if(juego.turno==-1)
   juego.jugadasB();
   if(juego.turno==1)
   juego.jugadasW();
  }
  }
  
  if(juego.turno == 1){
    bandera=true;
    if(juego.plays.pWhite(j,i)==true){
      juego.turno = -1;
      bandera=false;
      juego.plays.pintar();
    }
  }
        
  /* Si está disponible esa posición. */
  /*if (tablero.jugadasPermitidas(i,j,tablero.getTurno())){
    tablero.mundo[i][j] = (tablero.getTurno()) ? -1 : 1;
    /* Cambia de turno. */
   /* tablero.setTurno(!tablero.getTurno()); 
  } */
}
