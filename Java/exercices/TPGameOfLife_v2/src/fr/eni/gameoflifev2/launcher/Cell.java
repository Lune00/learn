package fr.eni.gameoflifev2.launcher;

public interface Cell {
	
	Cell newGeneration(int nbNeighbours);
	String getAsString();
	boolean isAlive();

}
