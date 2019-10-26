package fr.eni.tp4jselabs2.model;

public class MovableRectangle implements Movable {

	MovablePoint topLeft;
	MovablePoint bottomRight;
	
	
	public MovableRectangle(int x1, int y1, int x2, int y2, int xSpeed, int ySpeed ) {
		topLeft = new MovablePoint(x1, y1, xSpeed, ySpeed);
		bottomRight = new MovablePoint(x2, y2, xSpeed, ySpeed);
	}
	
	@Override
	public void moveDown() {
		// TODO Auto-generated method stub
		topLeft.y += topLeft.ySpeed;
		bottomRight.y += bottomRight.ySpeed;
		
	}
	
	@Override
	public void moveLeft() {
		// TODO Auto-generated method stub
		topLeft.x -= topLeft.xSpeed;
		bottomRight.x -= bottomRight.xSpeed;
		
	}
	
	@Override
	public void moveRight() {
		// TODO Auto-generated method stub
		topLeft.x += topLeft.xSpeed;
		bottomRight.x += bottomRight.xSpeed;
		
	}
	
	@Override
	public void moveUp() {
		// TODO Auto-generated method stub
		topLeft.y -= topLeft.ySpeed;
		bottomRight.y -= bottomRight.ySpeed;
		
	}
	
	@Override
	public String toString() {
		return String.format("top left corner{x:%d y:%d} bottom right corner {x:%d y:%d}",
				topLeft.x,topLeft.y,bottomRight.x, bottomRight.y);
	}
	
}
