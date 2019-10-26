package fr.eni.testneighbor2dgrid.launcher;

import java.util.ArrayList;
import java.util.Arrays;

public class Grid {

	int nx;
	int ny;

	Cell[] board;

	public Grid(int nx, int ny) {
		// TODO Auto-generated constructor stub
		this.nx = nx;
		this.ny = ny;
		board = new Cell[nx * ny];

		for (int i = 0; i != nx * ny; i++) {
			board[i] = new Cell();
		}

	}
	
	public void print() {
		int cursor = 1;
		for (int i = 0; i != nx * ny; i++) {
			System.out.print(board[i]);
			
			if( cursor % ny == 0) {
				System.out.print("\n");
			}
			cursor++;
		}	
	}
	

	public Cell getElement(int x, int y) {
		return board[x * ny + y];
	}

	
	//Brute Force method. Difficult to extend to a new type of neighborhood
	public ArrayList<Cell> getNeighborsMethod1(int x, int y) {
		ArrayList<Cell> localNeighbors = new ArrayList<Cell>();
		// Safe element 
		if (x > 0 && y > 0 && x < nx - 1 && y < ny - 1) {
			System.out.printf("(%d,%d) is a safe element\n", x, y);
			for (int ix = -1; ix <= 1; ix++) {
				for (int iy = -1; iy <= 1; iy++) {
					localNeighbors.add(getElement(x + ix, y + iy));
				}
			}
		}
		// Corner
		else if (x + y == 0 || x + y == nx - 1 || x + y == ny - 1 || x + y == (nx - 1) + (ny - 1)) {
			System.out.printf("(%d,%d) is a corner element\n", x, y);
			//Do stuff, know which corner
		}
		// Border element
		else {
			System.out.printf("(%d,%d) is a border element and not a corner\n", x, y);
			//Do stuff, know which border

		}
		return localNeighbors;
	}
	
	
	//Another method : allow great modularity if we want to change what we consider a neighbor
	//src: https://codereview.stackexchange.com/questions/68627/getting-the-neighbors-of-a-point-in-a-2d-grid
	//We define a static array of neighbors with relative coordinates to the considered point
	//For this, i use a pair of int representing x and y coordinates ( nothing to implement in the object
	//which is used to fill the grid, each element do not have 'to know' where it is. The grid take care of this for it
	
	//8 neighbors on a grid square. Relative coordinates
	private static final PairInt[] NEIGHBOR_SET = new PairInt[] {
		new PairInt(-1,-1),
		new PairInt(-1,0),
		new PairInt(-1,1),
		
		new PairInt(0,1),
		new PairInt(1,1),
		
		new PairInt(1,0),	
		new PairInt(1,-1),
		new PairInt(0,-1),
		
	};
	
	public boolean isOnGrid(int x, int y) {
		return x >= 0 && x < nx && y >= 0 && y < ny ;
	}
	
	
	public ArrayList<Cell>getNeighborsMethod2(int x, int y){
		ArrayList<Cell> localNeighbors = new ArrayList<Cell>();
		for(PairInt neighbor: NEIGHBOR_SET) {
			//Absolute coordinates
			int xNeighbor = x + neighbor.getX();
			int yNeighbor = y + neighbor.getY();
			
			if( isOnGrid(xNeighbor , yNeighbor ) ) {
				localNeighbors.add( getElement(xNeighbor, yNeighbor));
			}
		}
		return localNeighbors;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
