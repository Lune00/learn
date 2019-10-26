package fr.eni.demoHeritage.model;

public class House extends Building {

	public House() {
		//super();
		
	}
	
	
	public void doBuild() {
		System.out.println("My house at " + address + " is being built");
	}
	
	
}
