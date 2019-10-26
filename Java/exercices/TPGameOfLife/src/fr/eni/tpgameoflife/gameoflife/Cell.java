package fr.eni.tpgameoflife.gameoflife;

public interface Cell {

	Cell newGeneration();
	String getAsString();
	boolean isAlive();
	
	void incrementNbOfNeighbors();
	void resetNbOfNeighbors();
	
	//Implementees dans Coordinates
	//Peuvent etre implémentées dans une classe qu'herite la classe qui implemente l'interface 
	//(meme si c'est tordu). Mais je souhaiterai plutot faire de Cell une classe abstraite qu'une interface..
	int getX();
	int getY();
	int getNbNeighbors();
	
}
