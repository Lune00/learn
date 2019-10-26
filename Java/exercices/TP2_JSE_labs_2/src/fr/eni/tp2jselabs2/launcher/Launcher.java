package fr.eni.tp2jselabs2.launcher;

import fr.eni.tp2jselabs2.model.CollegeStudent;
import fr.eni.tp2jselabs2.model.Person;
import fr.eni.tp2jselabs2.model.Student;
import fr.eni.tp2jselabs2.model.Teacher;

public class Launcher {
	public static void main(String[] args) {
		System.out.println("Labs 2 - TP2 : Inheritance");
		System.out.println("(source: Support Formateur\\TP\\JSELabs2)\n");
		
		
		Person person = new Person("Smith",54,"M");
		System.out.println(person);
		
		Teacher teacher = new Teacher("Jean-Michel Burger",32,"M","Physics",3000);
		System.out.println(teacher);
		
		Student student = new Student("Frost",14,"F","FRST00",12.4);
		System.out.println(student);
		
		CollegeStudent collegeStudent = new CollegeStudent("Young",16,"F","YNG00",12.4,"Physics",1);
		System.out.println(collegeStudent);
		
	}
}
