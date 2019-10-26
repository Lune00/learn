package fr.eni.enischool.helloworld;
import java.util.Scanner;
import java.io.FileWriter;
import java.io.IOException;
import java.io.*;

public class launcher {
	
	//Print, tableaux, Scanner ... 
	public static void basics() {

		
		System.out.println("Hello World !");
		//Fonction printf:
		System.out.printf("Hello %s!","Paul");
		//Concatenation chaine de characteres:
		System.out.println("AA" + "BB");
		System.out.println("Hello World !");
		
		//Types primitifs : int, bool, char, float, double, short, byte 
		
		//Constante: une variable locale ne peut etre public ou static
		 final float MA_CONSTANTE=20.0f;
		System.out.printf("La TVA vaut %f",MA_CONSTANTE);

		//Declaration de tableaux
		//Methode 1
		float[] monTableauA = new float[5];
		//Methode 2
		float[] monTableauB = {1 , 2, 3 };
		System.out.println(monTableauA[0]);
		System.out.println(monTableauB[0]);
		System.out.println("Taille de mon tableau: " + monTableauA.length);
		
		//Parcourir le tableau avec une boucle FOR. Langage fortement typé (pas de conversion implicite)
		for(int i=0; i != monTableauA.length ; i++) {
			//On cast i en float (comme en C++)
			monTableauA[i] = (float)i * 0.1f ;
			System.out.println(i + " "+monTableauA[i]);	
		}
		
		//Scanner : gerer input dans le 
		Scanner s = new Scanner(System.in);
		System.out.println("Quel est votre nom?");
		String nom = s.nextLine();
		s.close();
		System.out.printf("Votre nom est : %s",nom);
		
		
	}
	
	
	//Lecture/Ecriture fichier, standard input/output. import java.io.*
	public static void inputOutput() {
		double[] valeurs = { 18.2, 22.4, 18.213, 1203.12};
		try(FileWriter f = new FileWriter("./output.txt")){
			for(int i = 0 ; i != valeurs.length ; i++) {
				f.write( String.format("%.4f%n",valeurs[i]) );
			}
		}
		catch(IOException e) {
			System.err.println("Ecriture impossible");
		}
		
	}

	public static void main(String[] args) {
		inputOutput();
		

	}
	

}
