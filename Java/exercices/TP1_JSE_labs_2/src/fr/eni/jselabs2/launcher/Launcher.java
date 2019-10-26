package fr.eni.jselabs2.launcher;

import fr.eni.jselabs2.model.*;


//Labs 2 - TP1 (formateur): OOP author and book

public class Launcher {
	
	
	public static void main(String[] args) {
		System.out.println("Labs 2 - TP1 : Object Oriented Programming\nTP1 : Author and Book");
		System.out.println("(source: Support Formateur\\TP\\JSELabs2)\n");
		
		
		Author author = new Author("BlackSmith","blacksmith@gmail.com",'f');
		System.out.println(author);
		
		Book book1 = new Book("The thing",author, 20.0, 100);
		System.out.println(book1);
		
		Book book2 = new Book("The Lord of the rings", new Author("Tolkien","tolkien@gmail.com",'m'), 10.0, 300);
		System.out.println(book2);
		System.out.println(book2.getAuthor());
		
	}

}
