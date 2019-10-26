package fr.eni.gameoflifev2.launcher;



public class DeadCell implements Cell {

	public DeadCell() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public Cell newGeneration(int nbNeighbours) {
		// System.out.println(nbNeighbors);

		if (nbNeighbours == 3) {
			return new AliveCell();
		} else {
			return this;
		}

	}

	@Override
	public String getAsString() {
		return String.format("%2s", ".");
	}

	@Override
	public boolean isAlive() {
		return false;
	}

	@Override
	public String toString() {
		return getAsString();
	}

}
