package fr.eni.testneighbor2dgrid.launcher;

public class Launcher {
	
	
	public static void main(String[] args) {
		System.out.println("Neighbor 2D");
		
		Grid grid = new Grid(10,10);
		
		grid.print();
		
		
		for(int x = 0; x != 10 ; x++) {
			for(int y = 0; y!= 10 ; y++) {
				System.out.printf("(%d,%d) has %d neihgbors\n",x,y, (grid.getNeighborsMethod2(x, y)).size());
			}
		}
		
		
	}

}
