package fr.eni.tp2jselabs2.model;

public class CollegeStudent extends Student {

	String major;
	int year;

	public CollegeStudent() {
		// TODO Auto-generated constructor stub
	}
	public CollegeStudent(String name, int age, String gender, String studentId, double gradePointAverage,
			String major, int year) {
		
		super( name,  age,  gender,  studentId,  gradePointAverage);
		this.major = major;
		this.year = year;
		
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}

	
	@Override
	public String toString() {
		return String.format("%s Major: %s Year: %d",super.toString(),major,year);
	}
	
	
}
