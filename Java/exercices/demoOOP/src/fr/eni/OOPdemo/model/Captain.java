package fr.eni.OOPdemo.model;


public class Captain {
	
	private String name;
	private int age;
	private Boat myBoat;
	
	public Captain() {
		// TODO Auto-generated constructor stub
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Boat getMyBoat() {
		return myBoat;
	}

	public void setMyBoat(Boat myBoat) {
		this.myBoat = myBoat;
	}

	public Captain(String nom) {
		name = nom ;
		age = 55 ;
	}
	
	public void print() {
		
		System.out.println("Bonsoir, je suis "+name+", capitaine du " + myBoat.getName() + '!');
	}
	
}
