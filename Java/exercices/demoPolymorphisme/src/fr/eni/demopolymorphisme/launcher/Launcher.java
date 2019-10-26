package fr.eni.demopolymorphisme.launcher;

import fr.eni.demopolymorphisme.model.Cat;
import fr.eni.demopolymorphisme.model.CatLike;
import fr.eni.demopolymorphisme.model.Tiger;

public class Launcher {

	public static void main(String[] args) {

		System.out.println("Polymorphisme");

		CatLike catLike1 = new CatLike();
		CatLike catLike2 = new Cat();
		CatLike catLike3 = new Tiger();

		CatLike[] catLikeArray = new CatLike[3];
		catLikeArray[0] = catLike1;
		catLikeArray[1] = catLike2;
		catLikeArray[2] = catLike3;

		// For each
		for (CatLike c : catLikeArray) {
			// Si c'est un chat, je veux qu'il fasse Miaou avant de manger
			// Il va falloir faire un cast

			//Secure le cast:
			if (c instanceof Cat) {
				System.out.println("C'est un chat");
				//((Cat) c).miaou();
				//Cast : 
				Cat cat =(Cat) c ;
				cat.miaou();
			}

			c.eat();
		}

	}
}
