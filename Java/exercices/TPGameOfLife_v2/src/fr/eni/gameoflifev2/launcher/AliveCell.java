package fr.eni.gameoflifev2.launcher;

public class AliveCell implements Cell {

	public AliveCell() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Cell newGeneration(int nbNeighbours) {

		// Under population
		if (nbNeighbours < 2) {
			return new DeadCell();
		}
		// Equilibrium
		else if (nbNeighbours == 2 || nbNeighbours == 3) {
			return this;
		}
		// Overpopulation
		else {
			return new DeadCell();
		}
	}

	@Override
	public String getAsString() {
		return String.format("%2s", "@");
	}

	@Override
	public boolean isAlive() {
		return true;
	}

	@Override
	public String toString() {
		return getAsString();
	}

}
