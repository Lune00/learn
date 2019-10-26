package fr.eni.demoHeritage.launcher;

import fr.eni.demoHeritage.model.Building;
import fr.eni.demoHeritage.model.Factory;
import fr.eni.demoHeritage.model.House;

public class Launcher {

	public static void main(String[] args) {
		System.out.println("Heritage");
		
		
		Building myBuilding1 = new Building();
		Building myBuilding2 = new Building("221b Baker Street London");
		Building myBuilding3 = new Building("5th Avenue New York",100);
		
		//Appelle le constructeur par défaut de Building()
		House myHouse1 = new House();
		System.out.println(myHouse1);
		
		myBuilding3.doBuild();
		//doBuild method is overriden in House Class
		myHouse1.doBuild();
		
		Factory myFactory = new Factory();
		myFactory.setAddress(myBuilding2.getAddress());
		myFactory.produce();
		System.out.println(myFactory);
		
		
		
	}
}
