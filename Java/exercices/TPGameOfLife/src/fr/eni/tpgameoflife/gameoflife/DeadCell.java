package fr.eni.tpgameoflife.gameoflife;

public class DeadCell extends Coordinates implements Cell {
	
	
	public DeadCell(int x, int y) {
		super(x,y);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String getAsString() {
		return ".";
	}
	
	@Override
	public String toString() {
		return ".";
	}
	
	@Override
	public boolean isAlive() {
		// TODO Auto-generated method stub
		return false;
	}
	
	@Override
	public Cell newGeneration() {
		
		//System.out.println(nbNeighbors);
		
		if( nbNeighbors == 3) {
			return new AliveCell(this.x, this.y);	
		}
		else {
			return this;
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
