package fr.eni.OOPdemo.model;


public class Boat {
	
	
	private int size;
	private String name;
	private Captain myCaptain;
	
	//I can have an attribute which is an instance of the class itself (cf pointer in C++)
	//public Boat friendBoat;

	public Boat(){
		size = 1 ;
		name = "Vingilot";
	}
	public void goForward() {
		System.out.println("Avance");
	}
	
	public void sink() {
		System.out.println("Coule");
	}
	
	public void print() {
		System.out.println("Je suis le bateau "+name);
	}
	
	public String getName() { return name; }
	public void setName(String name) { this.name = name; }
	
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public Captain getMyCaptain() {
		return myCaptain;
	}
	public void setMyCaptain(Captain myCaptain) {
		this.myCaptain = myCaptain;
	}

}
