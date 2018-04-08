class Play {

  
  ArrayList<FichaGame> white;
  ArrayList<FichaGame> black;
  ArrayList<FichaGame> available;
  ArrayList<FichaGame> possibleBlack;
  ArrayList<FichaGame> possibleWhite;
  ArrayList<FichaGame> ligadas;
  int ligadas1 =0;
  int liga =0;
   int dimension =0;
  int game[][];
  public Play(int[][] game,int dimension){
    this.white = new ArrayList<FichaGame>();
    this.black = new ArrayList<FichaGame>();
    this.available = new ArrayList<FichaGame>();
    this.possibleWhite = new ArrayList<FichaGame>();
    this.possibleBlack = new ArrayList<FichaGame>();
    this.ligadas = new ArrayList<FichaGame>();
    this.game = game;
    this.dimension = dimension;
    
  }
  
  public void addWhite(FichaGame ficha){
   this.white.add(ficha); 
  }
  
  public void addBlack(FichaGame ficha){
   this.black.add(ficha); 
  }
  
  public void addAvailable(FichaGame ficha){
   this.available.add(ficha); 
  }
  
  public void removeWhite(FichaGame ficha){
    this.white.remove(ficha);
  }
  public void removeBlack(FichaGame ficha){
   this.black.remove(ficha); 
  }
  public void removeAvailable(FichaGame ficha){ 
    this.available.remove(ficha);
  }
    
  public void DrawTab(){
     int[][] tabD = this.game;
     for(int y=0;y<this.dimension;y++){
      for(int x=0;x<this.dimension;x++){
            
            if(this.possibleBlack.indexOf(new FichaGame(y,x))!=-1){
              tabD[y][x] = 2;
            }
            
           
            System.out.print(" ["+tabD[y][x]+"] ");
      }
      System.out.println();
     }  
  }
  
  public void DrawTaw(){
     int[][] tabD = this.game;
     for(int y=0;y<this.dimension;y++){
      for(int x=0;x<this.dimension;x++){
            
            if(this.possibleWhite.indexOf(new FichaGame(y,x))!=-1){
              tabD[y][x] = 3;
            }
            
            System.out.print(" ["+tabD[y][x]+"] ");
            
      }
      System.out.println();
     }
    
  }

  public void pintar(){
    System.out.println("****************PINTANDO*********************");
   for(FichaGame f:this.black){
      System.out.println(f.toString());
      f.drawFichaGame();
      
   }
   for(FichaGame b:this.white){
     System.out.println(b.toString());
     b.drawFichaGame();
   }
   System.out.println("****************FIN PINTANDO*********************");
  }
  
  
  public void playsBlack(){
    int turn = -1;
    System.out.println("*********************");
    System.out.println("NUMERO DE NEGRAS"+this.white.size());
    for(FichaGame f: this.black){
     //System.out.println(this.black.size());
    //System.out.println("////////////////////");
    f.toString();
    left(f,turn);
    right(f,turn);
    up(f,turn);
    down(f,turn);
     diY(f,turn);
    diYMe(f,turn);
    }
    
    System.out.println("Negras Movimientos");
   for(FichaGame ff: this.possibleBlack){
      System.out.println("************");
      System.out.println(ff.toString());
      
      for(FichaGame cc: ff.ligadas){
          System.out.println(cc.toString());
      }
    }
    //DrawTab();
     System.out.println("FIN Negras Movimientos");
  }
  public void playsWhite(){
    int turn = 1;
    System.out.println("NUMERO DE BLANCAS"+this.white.size());
    for(FichaGame f: this.white){
      
    left(f,turn);
    right(f,turn);
    up(f,turn);
    down(f,turn);
    diY(f,turn);
    diYMe(f,turn);
    }
     System.out.println("White Movimientos");
   for(FichaGame ff: this.possibleWhite){
      System.out.println("************");
      System.out.println(ff.toString());
      
      for(FichaGame cc: ff.ligadas){
          System.out.println(cc.toString());
      }
    }
    
   //DrawTaw();
     System.out.println("FIN White Movimientos");
     
  }
  
  public Boolean pWhite(int Y,int X){
    if(-1==this.possibleWhite.indexOf(new FichaGame(0,Y,X,0)))
         return false;
      FichaGame ff = this.possibleWhite.get(this.possibleWhite.indexOf(new FichaGame(0,Y,X,0)));
      System.out.println("Posible blanca"+ff.toString());
      for(FichaGame cc: ff.ligadas){
          System.out.println("Ligada de ff"+cc.toString());
          if(cc.col==-1){
          System.out.println(this.black.size());
          this.black.remove(cc);
          cc.col=1;
           this.game[cc.getY()][cc.getX()]=1;
           this.black.add(cc);
            //ff.ligadas.remove(cc);
         // cc.drawFichaGame();
          }
          
      }
     ff.ligadas.clear();
     ff.col=1;
     this.white.add(ff);
     this.game[Y][X]=1;
     //ff.drawFichaGame();
     this.possibleWhite.clear();
     return true;
  }
  
  public Boolean pBlack(int Y,int X){
    System.out.println(this.possibleBlack.indexOf(new FichaGame(0,Y,X,0)));
      if(-1==this.possibleBlack.indexOf(new FichaGame(0,Y,X,0)))
         return false;
      FichaGame ff = this.possibleBlack.get(this.possibleBlack.indexOf(new FichaGame(0,Y,X,0)));
      System.out.println("Posible negra"+ff.toString());
      for(FichaGame cc: ff.ligadas){
          System.out.println("Ligada de ff"+cc.toString());
          if(cc.col==1){
          System.out.println(this.white.size());
         
          this.white.remove(cc);
          cc.col=-1;
          this.game[cc.getY()][cc.getX()]=-1;
           this.black.add(cc);
           
          //cc.drawFichaGame();
          }
         
      }
       ff.ligadas.clear();
     ff.col=-1;
     this.black.add(ff);
     this.game[Y][X]=-1;
     this.possibleBlack.clear();
     //ff.drawFichaGame();
     return true;
  }
  
  public void left(FichaGame ficha, int turn){
    
  this.ligadas.clear();
  System.out.println("*****************************************"); 
  System.out.println("TURNO:"+turn);
  System.out.println(ficha.toString()+"  "+this.game[ficha.getX()][ficha.getY()]);
  FichaGame p = null;
  for(int X=ficha.getX()-1;X>=0;X--){
    System.out.println(this.ligadas.size());
    System.out.println(this.game[ficha.getY()][X]);
         if(this.game[ficha.getY()][X]==(turn)){
           System.out.println("Caso turno igual");
           System.out.println("Y["+this.game[ficha.getY()]+"]["+X+"]X ="+this.game[ficha.getY()][X]);
           System.out.println("saliendo");
           return;
         } 
         if(this.game[ficha.getY()][X]==0){
           System.out.println("Caso encontramos 0");
           System.out.println("Y["+ficha.getY()+"]["+X+"]X ="+this.game[ficha.getY()][X]);
           if(this.ligadas.isEmpty()!=true){
             if(turn == 1){
             p =  new FichaGame(1,ficha.getY(),X,ficha.size);
             p.toString();
             //p. drawPosibleW();
             p.ligadas= new ArrayList<FichaGame>(this.ligadas);
             this.possibleWhite.add(p);
             
           }else{
              p = new FichaGame(0,ficha.getY(),X,ficha.size);
              System.out.println(p.toString());
              System.out.println("posible jugada");
              p.ligadas= new ArrayList<FichaGame>(this.ligadas);
              //p.drawPosibleB();
              this.possibleBlack.add(p);
           }               
           }
           return; 
         }
           if(turn == -1){
             System.out.println("ligando blanca");
             this.ligadas.add(new FichaGame(1,ficha.getY(),X,ficha.size));
             System.out.println("Y:="+ficha.getY()+",X:="+X);
           }else{
             System.out.println("ligando negra ");
             System.out.println("X:="+ficha.getY()+",X:="+X);
             this.ligadas.add(new FichaGame(-1,ficha.getY(),X,ficha.size));
           }
         }    
     }
  
  
  public void leftL(FichaGame ficha, int turn){
    
  this.ligadas1=0;
  System.out.println("*****************************************"); 
  System.out.println("TURNO:"+turn);
  System.out.println(ficha.toString()+"  "+this.game[ficha.getX()][ficha.getY()]);
  FichaGame p = null;
  for(int X=ficha.getX()-1;X>=0;X--){
    System.out.println(this.ligadas1);
    System.out.println(this.game[ficha.getY()][X]);
         if(this.game[ficha.getY()][X]==(turn)){
           System.out.println("Caso turno igual");
           System.out.println("Y["+this.game[ficha.getY()]+"]["+X+"]X ="+this.game[ficha.getY()][X]);
           System.out.println("saliendo");
           return;
         } 
         if(this.game[ficha.getY()][X]==0){
           System.out.println("Caso encontramos 0");
           System.out.println("Y["+ficha.getY()+"]["+X+"]X ="+this.game[ficha.getY()][X]);
           if(this.ligadas1==0){
             if(turn == 1){
             p =  new FichaGame(1,ficha.getY(),X,ficha.size);
             p.toString();
             p. drawPosibleW();
             p.ligadas= new ArrayList<FichaGame>(this.ligadas);
             this.possibleWhite.add(p);
             
           }else{
              p = new FichaGame(0,ficha.getY(),X,ficha.size);
              System.out.println(p.toString());
              System.out.println("posible jugada");
              p.ligadas= new ArrayList<FichaGame>(this.ligadas);
              p.drawPosibleB();
              this.possibleBlack.add(p);
           }               
           }
           return; 
         }
           if(turn == -1){
             System.out.println("ligando blanca");
             this.ligadas.add(new FichaGame(1,ficha.getY(),X,ficha.size));
             System.out.println("Y:="+ficha.getY()+",X:="+X);
           }else{
             System.out.println("ligando negra ");
             System.out.println("X:="+ficha.getY()+",X:="+X);
             this.ligadas.add(new FichaGame(-1,ficha.getY(),X,ficha.size));
           }
         }    
     }
  
  
  public void right(FichaGame ficha, int turn){
  this.ligadas.clear();
  System.out.println("*****************************************"); 
  System.out.println("TURNO:"+turn);
  System.out.println(ficha.toString()+"  "+this.game[ficha.getX()][ficha.getY()]);
  FichaGame p = null;
  for(int X=ficha.getX()+1;X<this.dimension;X++){
    
    System.out.println(this.game[ficha.getY()][X]);
         if(this.game[ficha.getY()][X]==(turn)){
           System.out.println("Caso turno igual");
           System.out.println("Y["+this.game[ficha.getY()]+"]["+X+"]X ="+this.game[ficha.getY()][X]);
           System.out.println("saliendo");
           return;
         } 
         if(this.game[ficha.getY()][X]==0){
           System.out.println("Caso encontramos 0");
           System.out.println("Y["+ficha.getY()+"]["+X+"]X ="+this.game[ficha.getY()][X]);
           if(this.ligadas.isEmpty()!=true){
             if(turn == 1){
              p =  new FichaGame(1,ficha.getY(),X,ficha.size);
             p.toString();
             //p. drawPosibleW();
                p.ligadas= new ArrayList<FichaGame>(this.ligadas);
             this.possibleWhite.add(p);
            
           }else{
              p = new FichaGame(0,ficha.getY(),X,ficha.size);
              System.out.println(p.toString());
              System.out.println("posible jugada");
                 p.ligadas= new ArrayList<FichaGame>(this.ligadas);
              //p.drawPosibleB();
              this.possibleBlack.add(p);
           
           }               
           }
           return; 
         }
           if(turn == -1){
             System.out.println("ligando blanca");
             this.ligadas.add(new FichaGame(1,ficha.getY(),X,ficha.size));
             System.out.println("Y:="+ficha.getY()+",X:="+X);
           }else{
             System.out.println("ligando negra ");
             System.out.println("X:="+ficha.getY()+",X:="+X);
             this.ligadas.add(new FichaGame(-1,ficha.getY(),X,ficha.size));
           }
         }
  }
  
  public void up(FichaGame ficha, int turn){
  this.ligadas.clear();
  System.out.println("*****************************************"); 
  System.out.println("TURNO:"+turn);
  System.out.println(ficha.toString()+"  "+this.game[ficha.getX()][ficha.getY()]);
  FichaGame p = null;
  for(int Y=ficha.getY()-1;Y>=0;Y--){
    
    System.out.println(this.game[ficha.getX()][Y]);
         if(this.game[ficha.getX()][Y]==(turn)){
           System.out.println("Caso turno igual");
           System.out.println("Y["+Y+"]["+this.game[ficha.getX()]+"]X ="+this.game[Y][ficha.getX()]);
           System.out.println("saliendo");
           return;
         } 
         if(this.game[Y][ficha.getX()]==0){
           System.out.println("Caso encontramos 0");
           System.out.println("Y["+Y+"]["+ficha.getX()+"]X ="+this.game[Y][ficha.getX()]);
           if(this.ligadas.isEmpty()!=true){
             if(turn == 1){
              p =  new FichaGame(1,Y,ficha.getX(),ficha.size);
             p.toString();
             //p. drawPosibleW();
             p.ligadas= new ArrayList<FichaGame>(this.ligadas);
             this.possibleWhite.add(p);
             
             
           }else{
              p = new FichaGame(0,Y,ficha.getX(),ficha.size);
              System.out.println(p.toString());
              System.out.println("posible jugada");
              p.ligadas= new ArrayList<FichaGame>(this.ligadas);
              //p.drawPosibleB();
              this.possibleBlack.add(p);
           }               
           }
           return; 
         }
           if(turn == -1){
             System.out.println("ligando blanca");
             this.ligadas.add(new FichaGame(1,Y,ficha.getX(),ficha.size));
             System.out.println("Y:="+Y+",X:="+ficha.getX());
           }else{
             System.out.println("ligando negra ");
             System.out.println("Y:="+Y+",X:="+ficha.getX());
             this.ligadas.add(new FichaGame(-1,Y,ficha.getX(),ficha.size));
           }
         }
  }
 
  public void down(FichaGame ficha, int turn){
      this.ligadas.clear();
  System.out.println("*****************************************"); 
  System.out.println("TURNO:"+turn);
  System.out.println(ficha.toString()+"  "+this.game[ficha.getX()][ficha.getY()]);
  FichaGame p = null;
  for(int Y=ficha.getY()+1;Y<this.dimension;Y++){
    
    System.out.println(this.game[ficha.getX()][Y]);
         if(this.game[ficha.getX()][Y]==(turn)){
           System.out.println("Caso turno igual");
           System.out.println("Y["+Y+"]["+this.game[ficha.getX()]+"]X ="+this.game[Y][ficha.getX()]);
           System.out.println("saliendo");
           return;
         } 
         if(this.game[Y][ficha.getX()]==0){
           System.out.println("Caso encontramos 0");
           System.out.println("Y["+Y+"]["+ficha.getX()+"]X ="+this.game[Y][ficha.getX()]);
           if(this.ligadas.isEmpty()!=true){
             if(turn == 1){
              p =  new FichaGame(1,Y,ficha.getX(),ficha.size);
             p.toString();
                p.ligadas= new ArrayList<FichaGame>(this.ligadas);
             //p. drawPosibleW();
             this.possibleWhite.add(p);
             
           }else{
              p = new FichaGame(0,Y,ficha.getX(),ficha.size);
              System.out.println(p.toString());
              System.out.println("posible jugada");
                 p.ligadas= new ArrayList<FichaGame>(this.ligadas);
              //p.drawPosibleB();
              this.possibleBlack.add(p);
           }               
           }
           return; 
         }
           if(turn == -1){
             System.out.println("ligando blanca");
             this.ligadas.add(new FichaGame(1,Y,ficha.getX(),ficha.size));
             System.out.println("Y:="+Y+",X:="+ficha.getX());
           }else{
             System.out.println("ligando negra ");
             System.out.println("Y:="+Y+",X:="+ficha.getX());
             this.ligadas.add(new FichaGame(-1,Y,ficha.getX(),ficha.size));
           }
         }
  }
 
  public void diY(FichaGame ficha, int turn){
      this.ligadas.clear();
  System.out.println("*****************************************"); 
  System.out.println("TURNO:"+turn);
  System.out.println(ficha.toString()+"  "+this.game[ficha.getX()][ficha.getY()]);
  FichaGame p = null;
  for(int Y=ficha.getY()+1, X=ficha.getX()+1;Y<this.dimension && X<this.dimension;Y++,X++){
    
    System.out.println(this.game[Y][X]);
         if(this.game[Y][X]==(turn)){
           System.out.println("Caso turno igual");
           System.out.println("Y["+Y+"]["+X+"]X ="+this.game[Y][X]);
           System.out.println("saliendo");
           return;
         } 
         if(this.game[Y][X]==0){
           System.out.println("Caso encontramos 0");
           System.out.println("Y["+Y+"]["+X+"]X ="+this.game[Y][X]);
           if(this.ligadas.isEmpty()!=true){
             if(turn == 1){
              p =  new FichaGame(1,Y,X,ficha.size);
             p.toString();
                p.ligadas= new ArrayList<FichaGame>(this.ligadas);
             //p. drawPosibleW();
             this.possibleWhite.add(p);
             
           }else{
              p = new FichaGame(0,Y,X,ficha.size);
              System.out.println(p.toString());
              System.out.println("posible jugada");
                 p.ligadas= new ArrayList<FichaGame>(this.ligadas);
              //p.drawPosibleB();
              this.possibleBlack.add(p);
           }               
           }
           return; 
         }
           if(turn == -1){
             System.out.println("ligando blanca");
             this.ligadas.add(new FichaGame(1,Y,X,ficha.size));
             System.out.println("Y:="+Y+",X:="+X);
           }else{
             System.out.println("ligando negra ");
             System.out.println("Y:="+Y+",X:="+X);
             this.ligadas.add(new FichaGame(-1,Y,X,ficha.size));
           }
         }
  }
 
 public void diYMe(FichaGame ficha, int turn){
      this.ligadas.clear();
  System.out.println("*****************************************"); 
  System.out.println("TURNO:"+turn);
  System.out.println(ficha.toString()+"  "+this.game[ficha.getX()][ficha.getY()]);
  FichaGame p = null;
  for(int Y=ficha.getY()-1, X=ficha.getX()-1;Y>0 && X>0;Y--,X--){
    
    System.out.println(this.game[Y][X]);
         if(this.game[Y][X]==(turn)){
           System.out.println("Caso turno igual");
           System.out.println("Y["+Y+"]["+X+"]X ="+this.game[Y][X]);
           System.out.println("saliendo");
           return;
         } 
         if(this.game[Y][X]==0){
           System.out.println("Caso encontramos 0");
           System.out.println("Y["+Y+"]["+X+"]X ="+this.game[Y][X]);
           if(this.ligadas.isEmpty()!=true){
             if(turn == 1){
              p =  new FichaGame(1,Y,X,ficha.size);
             p.toString();
                p.ligadas= new ArrayList<FichaGame>(this.ligadas);
             //p. drawPosibleW();
             this.possibleWhite.add(p);
             
           }else{
              p = new FichaGame(0,Y,X,ficha.size);
              System.out.println(p.toString());
              System.out.println("posible jugada");
                 p.ligadas= new ArrayList<FichaGame>(this.ligadas);
              //p.drawPosibleB();
              this.possibleBlack.add(p);
           }               
           }
           return; 
         }
           if(turn == -1){
             System.out.println("ligando blanca");
             this.ligadas.add(new FichaGame(1,Y,X,ficha.size));
             System.out.println("Y:="+Y+",X:="+X);
           }else{
             System.out.println("ligando negra ");
             System.out.println("Y:="+Y+",X:="+X);
             this.ligadas.add(new FichaGame(-1,Y,X,ficha.size));
           }
         }        
 }        
         
  /*public void diXMe(FichaGame ficha, int turn){
      this.ligadas.clear();
  System.out.println("*****************************************"); 
  System.out.println("TURNO:"+turn);
  System.out.println(ficha.toString()+"  "+this.game[ficha.getX()][ficha.getY()]);
  FichaGame p = null;
  for(int Y=ficha.getY()-1, X=ficha.getX()-1;Y>0 && X>0;Y--,X--){
    
    System.out.println(this.game[Y][X]);
         if(this.game[Y][X]==(turn)){
           System.out.println("Caso turno igual");
           System.out.println("Y["+Y+"]["+X+"]X ="+this.game[Y][X]);
           System.out.println("saliendo");
           return;
         } 
         if(this.game[Y][X]==0){
           System.out.println("Caso encontramos 0");
           System.out.println("Y["+Y+"]["+X+"]X ="+this.game[Y][X]);
           if(this.ligadas.isEmpty()!=true){
             if(turn == 1){
              p =  new FichaGame(1,Y,X,ficha.size);
             p.toString();
                p.ligadas= new ArrayList<FichaGame>(this.ligadas);
             p. drawPosibleW();
             this.possibleWhite.add(p);
             
           }else{
              p = new FichaGame(0,Y,X,ficha.size);
              System.out.println(p.toString());
              System.out.println("posible jugada");
                 p.ligadas= new ArrayList<FichaGame>(this.ligadas);
              p.drawPosibleB();
              this.possibleBlack.add(p);
           }               
           }
           return; 
         }
           if(turn == -1){
             System.out.println("ligando blanca");
             this.ligadas.add(new FichaGame(1,Y,X,ficha.size));
             System.out.println("Y:="+Y+",X:="+X);
           }else{
             System.out.println("ligando negra ");
             System.out.println("Y:="+Y+",X:="+X);
             this.ligadas.add(new FichaGame(-1,Y,X,ficha.size));
           }
         }        
 }
 */ 
  
  public void pintarP(){
      
  }
  
}
