package findOddInt;

import java.util.HashMap;
import java.util.Map;

public class FindOdd {
	
	
	public static int findIt(int[] a) {

		// Key : value of a[] - Value : occurence
		HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();

		for (int i = 0; i != a.length; i++) {
			
			if (map.isEmpty()) {
				map.put(new Integer(a[i]), 1);
			} 
			
			else if ( map.get(a[i]) == null ) {
				map.put( new Integer( a[i]), 1);
				
			} else {
				map.put( new Integer( a[i] ) , map.get(a[i]) + 1);
			}
		}

		// Iterate map to find odd occurence and return the key
		for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
			if (entry.getValue() % 2 == 1) {
				return entry.getKey();
			}
		}

		return 0;
	}
}
