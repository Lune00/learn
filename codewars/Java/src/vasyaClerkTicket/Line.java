package vasyaClerkTicket;

import java.util.ArrayList;
import java.util.List;

public class Line {

	private static final Integer TICKET_COST = 25;

	public static String Tickets(int[] peopleInLine) {
		 List<Integer> Vasya = new ArrayList<>();

		for (int people : peopleInLine) {

			int change = people - TICKET_COST;

			switch (change) {

			//Change billet de 25 : 0
			case 0:
				Vasya.add(25);
				break;

			//Change billet de 50 : 1x25
			case 25:
				if (Vasya.contains(25)) {
					Vasya.remove(Vasya.indexOf(25));
					Vasya.add(50);
				}
				else {
					return "NO";
				}
				break;
				
			//Change billet de 100 : 3x25 ou 50+25
			case 75:
				if(hasAtLeastOne25AndOne50(Vasya)) {
					//Retire 1 billet de 25 et un billet de 50, gagne un billet de 100
					Vasya.remove(Vasya.indexOf(25));
					Vasya.remove(Vasya.indexOf(50));
					Vasya.add(100);
					
				}
				else if(hasAtLeastThree25(Vasya)) {
					//Retire 3 billets de 25, gagne un billet de 100
					for(int i = 0 ; i != 3 ; i++) {
						Vasya.remove(Vasya.indexOf(25));
					}
					Vasya.add(100);
				}
				else {
					return "NO";
				}
				break;

			default:
				break;

			}
		}
		
		return "YES";
	}
	
	
	private static boolean hasAtLeastThree25(List<Integer> Vasya) {
		int numberOf25 = 0 ;
		for(int i = 0 ; i != Vasya.size(); i++) {
			if(25 == Vasya.get(i)) {
				numberOf25 += 1;
			}
		}
		return numberOf25 >=3 ;
	}
	
	
	private static boolean hasAtLeastOne25AndOne50(List<Integer> Vasya) {
		int numberOf25 = 0 ;
		int numberOf50 = 0 ;
		for(int i = 0 ; i != Vasya.size(); i++) {
			if(25 == Vasya.get(i)) {
				numberOf25 += 1;
			}
			else if(50 == Vasya.get(i)) {
				numberOf50 += 1;
			}
		}
		return numberOf25 >=1 && numberOf50 >= 1 ;
	}
	
}