package fr.eni.testneighbor2dgrid.launcher;

import java.util.Random;

public class Cell {

	int state;

	public Cell() {
		// TODO Auto-generated constructor stub

		Random rand = new Random();
		if (rand.nextBoolean()) {
			this.state = 0;
		} else {
			this.state = 1;
		}

	}
	
	
	@Override
	public String toString() {
		return String.format("%2s", state);
	}

}
