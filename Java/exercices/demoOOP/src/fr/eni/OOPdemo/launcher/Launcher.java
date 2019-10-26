package fr.eni.OOPdemo.launcher;

import fr.eni.OOPdemo.model.*;

//Aggregation, encapsulation , JavaBean

public class Launcher {

	public static void main(String[] args) {

		//Je cree un bateau
		Boat boat = new Boat();
		// Je peux acceder aux attributs (public par defaut)
		boat.setName("Vingilot");
		// Size est private il n'est pas accessible en dehors de la classe
		// myBoat.size= 100;
		//boat.friendBoat = new Boat();

		//Je cree un capitaine
		Captain myCaptain = new Captain("Earendil");
		
		//References croisees
		myCaptain.setMyBoat(boat);
		boat.setMyCaptain(myCaptain);

		//Je cree un port
		Harbor harbor = new Harbor();
		//harbor.boat et boat ont la meme reference
		harbor.setBoat(boat) ;
		harbor.getBoat().getMyCaptain().print();
	

	}

}
