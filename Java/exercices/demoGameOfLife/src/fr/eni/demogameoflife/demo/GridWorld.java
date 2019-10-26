package fr.eni.demogameoflife.demo;

public class GridWorld {
	
	
	private int nLines;
	private int nCols;
	private Cell[] grid;
	
	
	public GridWorld(int nLines, int nCols) {
		
		if(nLines > 0) {
			this.nLines = nLines;
		}
		else {
			this.nLines = 10 ;
		}
		
		if(nCols > 0) {
			this.nCols = nCols;
		}
		else {
			this.nCols = 10 ;
		}
		
		//N'instancie pas les Cell, juste la taille
		grid = new Cell[ this.nLines * this.nCols ];
		//Instanciation des Cells:
		for(int i = 0 ; i !=grid.length; i++) {
			grid[i] = new Cell();
		}
	}
	
	
	public Cell getCell(int i,int j) {
		return grid[ i * nCols + j];
	}
	
	
	public void printToStandardOutput() {
		System.out.println(nLines+" "+nCols);
		for(int i = 0 ; i != nLines ; i++) {
			for(int j = 0 ; j != nCols ; j++) {
				System.out.print(getCell(i,j).toString());
			}
			System.out.print("\n");
		}
	}
	

}
