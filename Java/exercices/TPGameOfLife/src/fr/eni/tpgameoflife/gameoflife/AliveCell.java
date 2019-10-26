package fr.eni.tpgameoflife.gameoflife;

public class AliveCell extends Coordinates implements Cell {
	
	
	public AliveCell(int x, int y) {
		// TODO Auto-generated constructor stub
		super(x,y);
	}
	
	@Override
	public String getAsString() {
		return "@";
	}
	
	@Override
	public String toString() {
		return "@";
	}
	
	@Override
	public boolean isAlive() {
		// TODO Auto-generated method stub
		return true;
	}
	
	@Override
	public Cell newGeneration() {
		
		//Under population
		if( nbNeighbors < 2) {
			return new DeadCell(this.x,this.y);
		}
		//Equilibrium
		else if ( nbNeighbors == 2 || nbNeighbors == 3) {
			return this;
		}
		//Overpopulation
		else {
			return new DeadCell(this.x,this.y);
		}
	}
	
	@Override
	public void incrementNbOfNeighbors() {
		nbNeighbors++;
	}
	
	@Override
	public void resetNbOfNeighbors() {
		nbNeighbors=0;	
	}
	
	

}
