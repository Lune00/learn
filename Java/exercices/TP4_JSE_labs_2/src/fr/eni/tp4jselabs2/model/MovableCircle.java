package fr.eni.tp4jselabs2.model;

public class MovableCircle implements Movable {
	
	
	private MovablePoint center;
	private int radius;
	
	public MovableCircle(int x, int y, int xSpeed, int ySpeed,int radius) {
		center = new MovablePoint(x, y,xSpeed, ySpeed);
		this.radius = radius;
	}
	
	@Override
	public void moveDown() {
		// TODO Auto-generated method stub
		center.y += center.ySpeed;
		
	}
	
	@Override
	public void moveLeft() {
		// TODO Auto-generated method stub
		center.x -= center.xSpeed;
	}
	
	@Override
	public void moveRight() {
		// TODO Auto-generated method stub
		center.x += center.xSpeed;
	}
	
	@Override
	public void moveUp() {
		// TODO Auto-generated method stub
		center.y -= center.ySpeed;
	}
	
	@Override
	public String toString() {
		return String.format("radius:%d x:%d y:%d xSpeed:%d ySpeed:%d",radius, center.x, center.y, center.xSpeed, center.ySpeed );
	}

}
