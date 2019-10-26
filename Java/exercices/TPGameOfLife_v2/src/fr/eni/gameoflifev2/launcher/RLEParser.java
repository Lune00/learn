package fr.eni.gameoflifev2.launcher;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

public class RLEParser {

	String buffer;

	private int nx;
	private int ny;

	Cell[] grid;

	public RLEParser(String fileName) {
		buffer = new String();
		try {
			String line = null;
			FileReader file = new FileReader(fileName);
			BufferedReader bufferedReader = new BufferedReader(file);
			while ((line = bufferedReader.readLine()) != null) {
				process(line);
			}
			bufferedReader.close();

			// Process buffer to build grid Lines
			cleanBuffer();
			buildGridLinesFromBuffer();

		} catch (FileNotFoundException ex) {
			System.err.println("File " + fileName + " not found!");
		} catch (IOException ex) {
			System.out.println("Error reading file '" + fileName + "'");
		}
	}

	public void process(String line) {

		if (line.isEmpty() || line == null) {
			return;
		}

		// Skip comments
		else if (line.charAt(0) == '#') {
			return;
		}

		else {

			// Read grid dimension:
			if (line.contains("x =") && line.contains("y =")) {
				initializeGridDimensionsAndGrid(line);
			}
			// Build grid
			// Manage lines to build initial state of cells
			else {
				addToBuffer(line);
			}

		}

	}

	public void initializeGridDimensionsAndGrid(String line) {

		String xString = line.substring(0, line.indexOf(','));
		String yString = line.substring(line.indexOf(',') + 2, line.lastIndexOf(','));

		xString = xString.replaceAll("\\s+", "");
		yString = yString.replaceAll("\\s+", "");

		String xValue = xString.substring(xString.indexOf('=') + 1);
		String yValue = yString.substring(yString.indexOf('=') + 1);

		nx = Integer.parseInt(xValue);
		ny = Integer.parseInt(yValue);

		if (nx > 0 && ny > 0) {
			grid = new Cell[nx * ny];
		} else {
			System.err.println("Dimensions (number of lines / number of colums) not correct!");
		}
	}

	public void addToBuffer(String line) {
		buffer += line;
	}

	public boolean indexExistInString(String string, int index) {

		return (string != null && index >= 0 && index < string.length());
	}

	//Remove all characters after the !, as indicated by the RSE format
	public void cleanBuffer() {
		// Remove all characters beyond '!'
		buffer = buffer.substring(0, buffer.indexOf('!'));
	}

	// Convert line each sequence from file ending with $ as a line
	// Process each line -> build corresponding line of the grid
	public void buildGridLinesFromBuffer() {

		buffer="bbbooo$67boo$82bboo$bobo";
		
		String rseLine;
		do {
			// Il reste au moins 2 lignes de grillee
			if (indexExistInString(buffer, buffer.indexOf('$'))) {
				rseLine = buffer.substring(0, buffer.indexOf('$'));
				buffer = buffer.substring(buffer.indexOf('$') + 1);
			}
			// Derniere ligne, flush buffer
			else {
				rseLine = buffer.substring(0, buffer.length());
				buffer = new String();
			}
			// Build a real grid line from gridLine
			translateRSELineIntoGridLine(rseLine);
			System.out.println("call");
		} while (buffer.length() != 0);
	}

	
	//TODO
	
	public void translateRSELineIntoGridLine(String rseLine) {
		
		System.out.println(rseLine);
		
		//do while rseLine.length!=0
		
		int indexNextDeadCell = rseLine.indexOf('b');
		int indexNextAliveCell = rseLine.indexOf('o');
		
		String nextCell;
		
		//Which cell is next? 
		if( indexNextAliveCell < indexNextAliveCell) {
			nextCell = rseLine.substring(0,indexNextAliveCell);
			
			
		}
		else {
			nextCell = rseLine.substring(0,indexNextDeadCell);
		}
		
		System.err.println(nextCell);
		

	}

}
