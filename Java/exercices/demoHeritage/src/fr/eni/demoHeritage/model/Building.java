package fr.eni.demoHeritage.model;

public class Building {

	// Attributs:
	
	//protected: private a l'exterieur de la classe, publique dans les classes filles
	protected int surface;
	protected String address;

	// Constructeurs : du plus petit (par defaut) au plus grand
	public Building() {
		System.out.println("Bulding default Constructor");
		// TODO Auto-generated constructor stub
		address = "Unknown address";
	}

	public Building(String address) {
		this.address = address;
	}

	public Building(String address, int surface) {
		this.address = address;
		this.surface = surface;
	}

	// Methodes
	public void doBuild() {
		System.out.println("My building at " + address + " is being built");

	}

	public void doRenovate() {
		System.out.println("Reconditioning " + surface + "m2");
	}

	public String getAddress() {
		return address;
	}

	public int getSurface() {
		return surface;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return String.format("Building of %d m2, at the address %s", surface, address);
	}

}
