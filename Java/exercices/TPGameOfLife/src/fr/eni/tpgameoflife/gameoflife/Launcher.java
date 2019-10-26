package fr.eni.tpgameoflife.gameoflife;

import java.util.concurrent.TimeUnit;

public class Launcher {

	public static void main(String[] args) {

		World world = new World(10, 40);
		System.out.println(world);
		
		// Simulation of the world while there are living cells:
		do {
			world.newGeneration();
			System.out.println(world);
			pause(1);
			clearScreen(world);
		} while (world.thereIsALivingCellInTheWorld());

	}

	//TMP Solution
	public static void clearScreen(World world) {
		// Get number of lines (fixed) printed by each print a the world int
		int nLinesToclear = world.getnLines() + 1;
		String blankLines = new String();
		for (int i = 0; i != nLinesToclear; i++) {
			blankLines += "\n";
		}
		System.out.println(blankLines);
	}

	public static void pause(int seconds) {
		// Pause the world to see
		try {
			TimeUnit.SECONDS.sleep(1);
		} catch (InterruptedException e) {

		}
	}

}
