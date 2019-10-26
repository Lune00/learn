package fr.eni.demoInterface.model;


//Abstract class do not have to implement abstract methods from Interfaces it implements
public abstract class CatLike implements Animal {
	
	//Method shared by all CatLike
	@Override
	public void beBorn() {
		// TODO Auto-generated method stub
		System.out.println("Born like a CatLike");
		
	}

}
