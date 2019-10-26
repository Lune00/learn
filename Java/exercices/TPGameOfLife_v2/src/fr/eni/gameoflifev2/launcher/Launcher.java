package fr.eni.gameoflifev2.launcher;


import java.util.concurrent.TimeUnit;

public class Launcher {

	public static void main(String[] args) {

		System.out.println("Game Of Life v.2");
		//RandomInit
		//World world = new World(10, 50);
		//System.out.println(world);
		
		World world = new World("./ressources/jslife/guns/edgeshoot-p450.lif");

		// Game LOOP:
		/*
		do {
			world.newGeneration();
			System.out.println(world);
			pause(1);
			clearScreen(world);
		} while (world.thereIsALivingCellInTheWorld());

		*/
	}

	public static void clearScreen(World world) {
		int nLinesToclear = world.getNx() + 1;
		String blankLines = new String();
		for (int i = 0; i != nLinesToclear; i++) {
			blankLines += "\n";
		}
		System.out.println(blankLines);
	}

	public static void pause(int seconds) {
		try {
			TimeUnit.SECONDS.sleep(1);
		} catch (InterruptedException e) {
		}
	}

}
