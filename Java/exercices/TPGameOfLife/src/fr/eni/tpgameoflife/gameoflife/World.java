package fr.eni.tpgameoflife.gameoflife;



import java.util.Random;

public class World {

	private int nLines;
	private int nCols;

	private Cell[] grid;

	private int generationNumber = 0;
	private int cellsAlive = 0;
	private int cellsDead = 0;
	private int cellsDeadTotal = 0;
	private int cellsBirthTotal = 0;

	public World(int nLines, int nCols) {

		if (nLines > 0) {
			this.nLines = nLines;
		} else {
			this.nLines = 10;
		}

		if (nCols > 0) {
			this.nCols = nCols;
		} else {
			this.nCols = 10;
		}

		// N'instancie pas les Cell, juste la taille
		grid = new Cell[this.nLines * this.nCols];
		// Instanciation des Cells: aléatoire
		Random rand = new Random();

		for (int i = 0; i != nLines; i++) {
			for (int j = 0; j != nCols; j++) {

				if (rand.nextBoolean()) {
					grid[i * nCols + j] = new AliveCell(i, j);
				} else {
					grid[i * nCols + j] = new DeadCell(i, j);
				}
			}
		}

		cellStatistics();

	}

	public int getnLines() {
		return nLines;
	}

	public void cellStatistics() {

		cellsBirthTotal += cellsAlive;
		cellsDeadTotal += cellsDead;

		cellsAlive = 0;

		for (int i = 0; i != grid.length; i++) {
			if (grid[i] instanceof AliveCell) {
				cellsAlive++;
			}
		}

		cellsDead = grid.length - cellsAlive;
	}

	public boolean thereIsALivingCellInTheWorld() {
		return cellsAlive != 0;
	}

	public void resetNumberOfNeighborsToZero() {

		// Reset number of neighbors:
		for (int i = 0; i != grid.length; i++) {
			grid[i].resetNbOfNeighbors();
		}

	}

	// Complexity N^2 (not optimal) but avoid making a copy (update in place)
	public void updateNumberOfNeighborsOfEachCell() {

		resetNumberOfNeighborsToZero();

		// Run through all pairs of cells
		for (int i = 0; i != grid.length; i++) {
			for (int j = i + 1; j != grid.length; j++) {

				if (areNeighbors(grid[i], grid[j])) {
					// Different cases depending on each cell status of the pair
					if (grid[i] instanceof AliveCell && grid[j] instanceof AliveCell) {
						grid[i].incrementNbOfNeighbors();
						grid[j].incrementNbOfNeighbors();
					} else if (grid[i] instanceof AliveCell && grid[j] instanceof DeadCell) {
						grid[j].incrementNbOfNeighbors();
					} else if (grid[i] instanceof DeadCell && grid[j] instanceof AliveCell) {
						grid[i].incrementNbOfNeighbors();
					}
				}
				
			}
		}
	}

	// Return true if two AliveCell are neighbors ( their distance <=2) public
	boolean areNeighbors(Cell a, Cell b) {
		int dx_2 = (a.getX() - b.getX()) * (a.getX() - b.getX());
		int dy_2 = (a.getY() - b.getY()) * (a.getY() - b.getY());
		int d = dx_2 + dy_2;
		return (d <= 2);
	}

	public void applyRulesForEachCell() {
		for (int i = 0; i != grid.length; i++) {
			// System.out.println(grid[i].getNbNeighbors());
			grid[i] = grid[i].newGeneration();
		}
	}

	// Update state of the world (next step) : Update IN PLACE, no copy of the world
	// Each integration step has 3 stages:
	// 1) reset number of neighbors of each cell to 0
	// 2) compute number of neighbors
	// 3) applyRules for each cell according to number of neighbors
	public void newGeneration() {
		updateNumberOfNeighborsOfEachCell();
		applyRulesForEachCell();
		cellStatistics();
		generationNumber++;
	}

	public Cell getCell(final int x, final int y) {
		return grid[x * nCols + y];
	}

	@Override
	public String toString() {
		String worldString = String.format("Generation number : %03d\n", generationNumber);
		worldString += String.format("Alive:%03d Dead:%03d Total Births:%d Total Deaths:%d\n\n", cellsAlive, cellsDead,
				cellsBirthTotal, cellsDeadTotal);
		for (int x = 0; x != nLines; x++) {
			for (int y = 0; y != nCols; y++) {
				worldString += getCell(x, y).toString();
			}
			worldString += new String("\n");
		}
		return worldString;
	}

}