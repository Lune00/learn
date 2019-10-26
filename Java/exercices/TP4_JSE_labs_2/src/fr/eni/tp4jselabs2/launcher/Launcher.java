package fr.eni.tp4jselabs2.launcher;

import fr.eni.tp4jselabs2.model.Movable;
import fr.eni.tp4jselabs2.model.MovableCircle;
import fr.eni.tp4jselabs2.model.MovablePoint;
import fr.eni.tp4jselabs2.model.MovableRectangle;

public class Launcher {
	
	public static void main(String[] args) {
		System.out.println("Labs 2 - TP4 : Interface");
		System.out.println("(source: Support Formateur\\TP\\JSELabs2)\n");
		
		
		Movable m1 = new MovablePoint(5,6,10,4);
		System.out.println(m1);
		m1.moveLeft();
		System.out.println(m1);
		
		Movable m2 = new MovableCircle(2,1,2,4,20);
		System.out.println(m2);
		m2.moveUp();
		System.out.println(m2);
		
		Movable m3 = new MovableRectangle(10, 10, 20, 20, 10, 10);
		System.out.println(m3);
		m3.moveUp();
		System.out.println(m3);
		
		
	}

}
