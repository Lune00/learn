package fr.eni.referencesdemoproject.launcher;


public class Launcher {

	public static void main(String[] args) {

		int maVariable = 10;
		// Type primitif: passage d'argument par copie
		changeMyInt(maVariable);
		System.out.println(maVariable);

		//Objet : passage d'arguments par réference
		//myCat contient l'adresse en mémoire (pile) d'une instance Chat(tas)
		Cat myCat = new Cat();
		System.out.println(myCat.name);
		changeCatName(myCat);
		System.out.println(myCat.name);

		//Override: 
		System.out.println(myCat);
	}

	public static void changeCatName(Cat cat) {
		cat.name = "Le chat";
	}
	
	public static void changeMyInt(int i) {
		i = 0;
	}	
	
	//Class chat
		static public class Cat {

			String name;

			
			public Cat() {
				// TODO Auto-generated constructor stub
				name = "Minou";
			}
			
			@Override
			public String toString() {
				return "Miaou " + this.name;
			}
			
		}

}

