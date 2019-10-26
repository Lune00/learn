package fr.eni.gameoflifev2.launcher;

import java.util.ArrayList;
import java.util.Random;

public class World {

	private int nx;
	private int ny;

	private int generationNumber;
	private int cellsAlive = 0;
	private int cellsDead = 0;
	private int cellsDeadTotal = 0;
	private int cellsBirthTotal = 0;

	Cell[] grid;
	
	RLEParser rleParser;

	public World(final int nx, final int ny) {

		if (nx > 0 && ny > 0) {
			this.nx = nx;
			this.ny = ny;
		} else {
			this.nx = 10;
			this.ny = 10;
		}

		grid = new Cell[this.nx * this.ny];

		Random rand = new Random();

		for (int i = 0; i != nx * ny; i++) {
			if (rand.nextBoolean()) {
				grid[i] = new AliveCell();
			} else {
				grid[i] = new DeadCell();
			}
		}
	}

	// Constructor with a configuration file in a Run Length Encoded (RLE) format (see
	// documentation)
	// Load interesting patterns for game of life
	public World(String fileName) {

		rleParser = new RLEParser(fileName);	
		//RLE return an array and dimensions
	}

	public int getNx() {
		return nx;
	}

	public boolean isOnGrid(int x, int y) {
		return x >= 0 && x < nx && y >= 0 && y < ny;
	}

	public Cell getCell(int x, int y) {
		return grid[x * ny + y];
	}

	// 8 neighbors on a grid square. Relative coordinates
	private static final PairInt[] NEIGHBOR_SET = new PairInt[] { new PairInt(-1, -1), new PairInt(-1, 0),
			new PairInt(-1, 1), new PairInt(0, 1), new PairInt(1, 1), new PairInt(1, 0), new PairInt(1, -1),
			new PairInt(0, -1), };

	public ArrayList<Cell> getNeighboors(int x, int y) {
		ArrayList<Cell> localNeighbors = new ArrayList<Cell>();
		for (PairInt neighbor : NEIGHBOR_SET) {
			// Absolute coordinates
			int xNeighbor = x + neighbor.getX();
			int yNeighbor = y + neighbor.getY();

			if (isOnGrid(xNeighbor, yNeighbor)) {
				localNeighbors.add(getCell(xNeighbor, yNeighbor));
			}
		}
		return localNeighbors;
	}

	@Override
	public String toString() {
		String worldString = new String();
		worldString += String.format("Generation number: %03d\n", generationNumber);
		worldString += String.format("Alive:%03d Dead:%03d Total Births:%d Total Deaths:%d\n\n", cellsAlive, cellsDead,
				cellsBirthTotal, cellsDeadTotal);
		int cursor = 1;
		for (int i = 0; i != nx * ny; i++) {
			worldString += String.format("%s", grid[i].toString());
			if (cursor % ny == 0) {
				worldString += "\n";
			}
			cursor++;
		}
		return worldString;
	}

	public int getNumberOfAliveNeighboringCells(ArrayList<Cell> neighboors) {
		// Keep only AliveCell neighboors:
		int nbrAlive = 0;
		for (int i = 0; i != neighboors.size(); i++) {
			if (neighboors.get(i).isAlive()) {
				nbrAlive++;
			}
		}
		return nbrAlive;
	}

	public void newGeneration() {

		Cell[] updatedGrid = new Cell[this.nx * this.ny];
		for (int x = 0; x != nx; x++) {
			for (int y = 0; y != ny; y++) {
				ArrayList<Cell> localNeighboors = getNeighboors(x, y);
				updatedGrid[x * ny + y] = getCell(x, y)
						.newGeneration(getNumberOfAliveNeighboringCells(localNeighboors));
			}
		}
		grid = updatedGrid;
		worldStatistics();
		generationNumber++;
	}

	public void worldStatistics() {

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

}
