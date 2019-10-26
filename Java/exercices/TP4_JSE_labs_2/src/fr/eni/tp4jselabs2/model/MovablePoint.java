package fr.eni.tp4jselabs2.model;

public class MovablePoint implements Movable {
	
	protected int x;
	protected int y;
	protected int xSpeed;
	protected int ySpeed;
	
	public MovablePoint(int x, int y, int xSpeed, int ySpeed) {
		// TODO Auto-generated constructor stub
		this.x = x ;
		this.y = y;
		this.xSpeed = xSpeed;
		this.ySpeed = ySpeed;
	}
	
	@Override
	public void moveDown() {
		y += ySpeed;
	}
	
	@Override
	public void moveLeft() {
		x -= xSpeed;
	}
	
	@Override
	public void moveRight() {
		// TODO Auto-generated method stub
		x += xSpeed;
		
	}
	@Override
	public void moveUp() {
		// TODO Auto-generated method stub*
		y -= ySpeed;
		
	}
	
	@Override
	public String toString() {
		return String.format("x:%d y:%d xSpeed:%d ySpeed:%d", x, y, xSpeed, ySpeed );
	}

}
