package fr.eni.tp3jselabs2.launcher;

import fr.eni.tp3jselabs2.demo.Rectangle;
import fr.eni.tp3jselabs2.demo.Shape;
import fr.eni.tp3jselabs2.demo.Triangle;

public class Launcher {
	
	public static void main(String[] args) {
		System.out.println("Labs 2 - TP3 : Polymorphism Example");
		System.out.println("(source: Support Formateur\\TP\\JSELabs2)\n");
		
		
		Shape rectangle = new Rectangle("Blue",122,2020);
		System.out.println(rectangle);
		Shape triangle = new Triangle("White",20,30);
		System.out.println(triangle);
		
		//Cast
		if( rectangle instanceof Rectangle) {
			((Rectangle) rectangle).angleDroit();
		}
		
		
		
		
	}

}
