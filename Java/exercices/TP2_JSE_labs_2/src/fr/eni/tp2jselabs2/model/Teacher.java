package fr.eni.tp2jselabs2.model;

public class Teacher extends Person {

	
	
	private String subject;
	private double salary;
	
	public Teacher() {
		// TODO Auto-generated constructor stub
	}
	
	public Teacher(String name, int age, String gender, String subject, double salary) {
		super(name, age, gender);
		this.subject = subject;
		this.salary = salary;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}
	
	
	@Override
	public String toString() {
		
		return String.format("%s Subject : %s Salary: %.2f", super.toString(), subject, salary);
	}
	
	
	
	
}
