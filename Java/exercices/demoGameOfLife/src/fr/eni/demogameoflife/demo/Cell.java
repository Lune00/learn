package fr.eni.demogameoflife.demo;

import java.util.HashMap;


public class Cell {
	
	
	private boolean isAlive;
	
	//Store character to print on console attached to its internal state (dead or alive)
	static HashMap<Boolean, String> states ;
	
	static {
		states = new HashMap<Boolean, String>();
		states.put(true, "@");
		states.put(false, ".");
	}
	
	public Cell() {
		isAlive = false;
	}
	
	public void setAlive(boolean isAlive) {
		this.isAlive = isAlive;
	}
	
	
	@Override
	public String toString() {
		return String.format("%1s", states.get(isAlive));
	}

}
