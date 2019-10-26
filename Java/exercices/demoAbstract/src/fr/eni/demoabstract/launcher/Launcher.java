package fr.eni.demoabstract.launcher;

import java.util.Random;

import fr.eni.demoabstract.model.Cat;
import fr.eni.demoabstract.model.CatLike;
import fr.eni.demoabstract.model.Tiger;

public class Launcher {
	
	public static void main(String[] args) {
		
		System.out.println("Abstract Classes");
		
		
		CatLike tiger = new Tiger();
		tiger.eat();
		
		
		CatLike[] randomCatLikes = randomCatLike();
		for(CatLike c: randomCatLikes) {
			c.eat();
		}
	}
	
	static CatLike[] randomCatLike() {
		CatLike[] catlikes = new CatLike[10];
		for(int i = 0 ; i < catlikes.length ; i++) {	
			Random random = new Random();
			if(random.nextBoolean()) {
				catlikes[i] = new Cat();
			}
			else {
				catlikes[i] = new Tiger();
			}
		}
		return catlikes;
	}

}
