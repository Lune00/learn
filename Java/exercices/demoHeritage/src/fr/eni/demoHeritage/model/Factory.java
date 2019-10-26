package fr.eni.demoHeritage.model;

public class Factory extends Building {

	
	public void produce() {
		System.out.println("Factory at address " + address + " is producing.");
	}
	
	
	@Override
	public String toString() {
		return String.format("Factory of %d m2, at the address %s", surface, address);
	}
	
	//On override le setSurface de Factory car elle ne peut etre inferieure a 100
	public void setSurface(int surface) {
		
		if( surface < 100) {
			System.out.println("Surface of the factory can not be lower than 100m2 !");
		}
		else {
			super.surface = surface ;
		}
		
	}
	
	
}
