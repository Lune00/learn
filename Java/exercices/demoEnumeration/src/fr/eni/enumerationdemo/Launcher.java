package fr.eni.enumerationdemo;

import java.util.Scanner;

//importer ma declaration de l'enum Saison
import fr.eni.enumerationdemo.global.saison.Saison;

public class Launcher {
	
	public static void main(String[] args) {
		
		// Ma variable de type Saison
		Saison maSaison = Saison.PRINTEMPS;
		
		
		//Switch enum
		switch(maSaison) {
		
		case PRINTEMPS:
			System.out.println("C'est le printemps");
			break;
		case HIVER:
			System.out.println("C'est l'hiver");
			break;
		default:
			System.out.println("C'est quoi?");
			break;
		}
		
		//For each enum
		for(Saison s: Saison.values()) {
			System.out.println(s);
		}
		
	}
	
	
	
	

}
