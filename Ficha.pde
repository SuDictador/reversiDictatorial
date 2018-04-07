class FichaGame{

  int col =0;
  int positionX =0;
  int positionY =0;
  int size =0; 
  ArrayList<FichaGame> ligadas;
  public FichaGame(int col,int positionY,int positionX,int size){
    this.col = col;
    this.positionX = positionX;
    this.positionY = positionY;
    this.size = size;
    this.ligadas = new ArrayList<FichaGame>();
  }
  
  
  public void drawFichaGame(){
    
    if(this.col==1){
      //System.out.println("blanca");
     fill(255); 
    }
    if(this.col==-1){
     fill(0); 
     //System.out.println("negra");
    }
    ellipse(this.positionX*this.size+(this.size/2),this.positionY*this.size+(this.size/2),this.size-2,this.size-2);  
  }
  
  public void drawPosibleB(){
    fill(204, 102, 0);
    ellipse(this.positionX*this.size+(this.size/2),this.positionY*this.size+(this.size/2),this.size-2,this.size-2);
  }
  
  public void drawPosibleW(){
    fill(220);
    ellipse(this.positionX*this.size+(this.size/2),this.positionY*this.size+(this.size/2),this.size-5,this.size-5);
  }
  
  public int getX(){
   return this.positionX; 
  }
  
  public int getY(){
   return this.positionY; 
  }

  @Override
  public boolean equals(Object obj){
   if((obj instanceof FichaGame) && ((FichaGame)obj).getX() == this.positionX && ((FichaGame)obj).getY() == this.positionY){
     return true;
   } 
   
   return false;
  }

  public String toString(){   
    String colo = "neutro";
    if(this.col == -1)
      colo = "negra";
    if(this.col == 1)
      colo = "blanca";
     if(this.col == 0)
      colo = "Vacia";
    return "( "+colo+"(Y = "+this.positionY+" , X = "+this.positionX+" ))";
  }

}
