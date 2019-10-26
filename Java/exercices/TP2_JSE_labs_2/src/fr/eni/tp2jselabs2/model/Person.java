package fr.eni.tp2jselabs2.model;

public class Person {

	protected String name; // name of the person
	protected int age; // person’s age
	protected String gender; // “M” for male, “F” for female

	public Person() {
		// TODO Auto-generated constructor stub
	}
	
	public Person(String name, int age, String gender) {
		// affect each parameter to the corresponding attribute
		this.name = name;
		this.age = age;
		this.gender = gender;
	}
	
	public int getAge() {
		return age;
	}
	public String getGender() {
		return gender;
	}
	public String getName() {
		return name;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setName(String name) {
		this.name = name;
	}
	

	@Override
	public String toString() {
		return String.format("Name: %s Age: %d Gender: %s",name,age,gender);
	}

}
