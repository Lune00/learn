package fr.eni.tp3jselabs2.demo;

public abstract class Shape {
	
	protected String color;
	
	public Shape() {
		// TODO Auto-generated constructor stub
	}
	
	public Shape(String color){
		this.color = color ;
	}
	
	public abstract float getArea();
	
	@Override
	public String toString() {
		return String.format("couleur %s", color);
	}

}
