package supermarketQueue;

import java.util.ArrayList;
import java.util.List;

public class Solution {

	public static int solveSuperMarketQueue(int[] customers, int n) {
	
		if(customers.length == 0) {
			return 0;
		}
		
		//Array des caisses
		int till[] = new int[n];
		//Queue: customers non a une caisse
		List<Integer> queue = new ArrayList<>();
		System.out.println("init done");
		
		//On repartir les customers
		for(int i = 0 ; i != customers.length - 1 ; i++) {
			
			//On charge les caisses
			if( i + 1 < n) {
				System.out.println(i);
				till[i] = customers[i];
			}
			//On charge la queue
			else {
				queue.add(customers[i]);
			}
			
		}
		
		//Si il n'y a plus de queue, on fait la somme des caisses
		if(queue.isEmpty()) {
			return sum(customers);
		}
		else {
			//TODO
			return 0;
		}
		
	}
	
	
	private static int sum(int[] a) {
		int sum = 0;
		for(int i = 0 ; i != a.length - 1 ; i++) {
			sum += a[i];
		}
		return sum;
	}

}