package fr.eni.tp3jselabs2.demo;

public class Rectangle extends Shape {

	float length;
	float width;

	public Rectangle() {
		// TODO Auto-generated constructor stub
	}

	public Rectangle(String color, float length, float width) {
		super(color);
		
		if(length  < width ) {
			this.length = width;
			this.width = length;
		}
		else {
			this.length=length;
			this.width=width;
		}
		
	}

	public void angleDroit() {
		System.out.println("J'ai des angles droits!");
	}

	@Override
	public float getArea() {
		return length * width;
	}

	@Override
	public String toString() {
		return String.format("Rectangle de %s length=%4.2f width=%4.2f aire=%.2f", super.toString(), length, width,
				getArea());
	}

}
