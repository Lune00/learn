package fr.eni.tpgameoflife.gameoflife;

//Coordinates: not a good name. Store x,y position and nbr of alive neighbors at this position

public class Coordinates {
	
	protected int x;
	protected int y;
	protected int nbNeighbors;
	
	public Coordinates(int x, int y) {
		// TODO Auto-generated constructor stub
		this.x = x ;
		this.y = y ;
		nbNeighbors = 0 ;
	}
	
	public int getX() {
		return x;
	}
	
	public int getY() {
		return y;
	}
	
	public void addNeighbor() {
		nbNeighbors++;
	}
	public int getNbNeighbors() {
		return nbNeighbors;
	}
	
	public void resetNumberOfNeighbors() {
		nbNeighbors = 0 ;
	}

}
