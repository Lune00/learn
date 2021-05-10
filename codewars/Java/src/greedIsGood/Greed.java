package greedIsGood;

public class Greed {

	public static int greedy(int[] dice) {
		
		int score = 0 ;
		int bonusFactorTriplet = 1;
		
		//Iterate over each die (1 up to 6)
		for(int die = 1 ; die <= 6 ; die++) {
			
			if( die == 1)
				bonusFactorTriplet = 10;
			else
				bonusFactorTriplet = 1;
			
			//Number of dice for each die in the result set
			int nbDice = 0 ;
			
			//iterate over
			for(int j = 0 ; j != dice.length ; j++ ) {
				if( dice[j] == die ) {
					nbDice += 1;
				}
			}

			//Score : if a triplet
			score += ( nbDice / 3 ) * die * bonusFactorTriplet * 100;
			
			//Score: if remaining dice (not in a triplet) 1 or 5, add to score
			if( die == 1 || die == 5) {
				
				score += (nbDice % 3) * 10 * bonusFactorTriplet * die  ;
			}
			
			System.out.println("die="+die+" nbDice="+nbDice+" score="+score);
		}
		
		return score;
	}
}