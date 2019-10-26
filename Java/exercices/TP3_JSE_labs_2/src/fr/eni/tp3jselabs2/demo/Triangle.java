package fr.eni.tp3jselabs2.demo;

public class Triangle extends Shape {
	
	float base;
	float height;
	
	public Triangle() {
		// TODO Auto-generated constructor stub
	}
	
	public Triangle(String color, float base, float height) {
		super(color);
		this.base = base;
		this.height = height;
	}
	
	@Override
	public float getArea() {
		return base * height * 0.5f;
	}
	@Override
	public String toString() {
		return String.format("Triangle de %s base=%.2f height=%.2f surface=%.2f",super.toString(), base, height, getArea() );
	}

}
