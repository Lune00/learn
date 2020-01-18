package vasyaClerkTicket;

public class Line2 {

	public static String Tickets(int[] peopleInLine) {

		int k25 = 0;
		int k50 = 0;

		for (int cash : peopleInLine) {

			if (cash == 25) {
				k25 += 1;
			} else if (cash == 50 && k25 > 0) {
				k25 -= 1;
				k50 += 1;
			} else if (cash == 100 && k50 > 0 && k25 > 0) {
				k25 -= 1;
				k50 -= 1;
			} else if (cash == 100 && k25 > 2) {
				k25 -= 3;
			} else {
				return "NO";
			}
		}
		return "YES";
	}
}
