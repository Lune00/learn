package fr.eni.tp2jselabs2.model;

public class Student extends Person {

	protected String studentId; // Student Id Number
	protected double gradePointAverage; // grade point average

	public Student() {
		// TODO Auto-generated constructor stub
	}
	
	public Student(String name, int age, String gender, String studentId, double gradePointAverage) {
		super(name,age,gender);
		this.studentId = studentId;
		this.gradePointAverage = gradePointAverage;
		// use the super class’ constructor
		// initialize what’s new to Student
	}

	public String getStudentId() {
		return studentId;
	}

	public void setStudentId(String studentId) {
		this.studentId = studentId;
	}

	public double getGradePointAverage() {
		return gradePointAverage;
	}

	public void setGradePointAverage(double gradePointAverage) {
		this.gradePointAverage = gradePointAverage;
	}
	
	@Override
	public String toString() {
		return String.format("%s StudentId: %s GradePointAverage: %.2f",super.toString(),studentId, gradePointAverage);
	}
	

}
