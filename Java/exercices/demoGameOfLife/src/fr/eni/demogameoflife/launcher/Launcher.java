package fr.eni.demogameoflife.launcher;


import fr.eni.demogameoflife.demo.GridWorld;

public class Launcher {

	public static void main(String[] args) {

		System.out.println("Game of Life");
		GridWorld gridWorld = new GridWorld(5,5);
		gridWorld.printToStandardOutput();
	}

}
