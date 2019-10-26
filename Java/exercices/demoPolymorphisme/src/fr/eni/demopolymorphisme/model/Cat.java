package fr.eni.demopolymorphisme.model;

public class Cat extends CatLike {
	
	//Securise override : dit au compilateur qu'on redéfinit la methode eat de la classe base CatLike
	@Override	
	public void eat() {
		System.out.println("Cat is eating");
	}
	
	public void miaou() {
		System.out.println("Miaou!");
	}

}
