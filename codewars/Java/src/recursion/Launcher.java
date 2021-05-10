package recursion;

import java.util.Arrays;

public class Launcher {

	public static void main(String[] args) {

		int a[] = new int[] { 6, 3, 4, 1, 6, 12, 24, 0, 100, 32, -1, -5, 1000, 27, -1000, 2, 3 };
		int max = a[0];
		int min = a[0];
		int n = 0;

		// HelloWorld2(5);
		// System.out.println(findMax(max, a));
		// System.out.println(findMin(min, a));

		//a = myBubbleSort(a, 0, 0);
		//a = bubbleSort(a, a.length);
		a = insertionSort(a);
		for (int el : a) {
			System.out.printf(el + " ");
		}

	}

	public static void HelloWorld(int n) {
		if (n == 0)
			return;
		System.out.println("Hello World!");
		HelloWorld(n - 1);
	}

	public static void HelloWorld2(int n) {
		if (n % 2 == 0)
			return;
		System.out.println("Hello World!");
		HelloWorld2(n - 1);
	}

	public static int findMax(int max, int[] a) {

		// Base case
		if (a.length == 0) {
			return max;
		}

		max = max > a[0] ? max : a[0];

		a = Arrays.copyOfRange(a, 1, a.length);

		return findMax(max, a);
	}

	public static int findMin(int min, int[] a) {

		// Base case
		if (a.length == 0) {
			return min;
		}

		min = min > a[0] ? a[0] : min;
		a = Arrays.copyOfRange(a, 1, a.length);
		return findMin(min, a);
	}

	// Ma propre version du bubbleSort
	public static int[] myBubbleSort(int[] a, int n, int m) {

		// Nombre maximum de recursion a effectuer pour trier (n * (n -1 ))
		if (n == (a.length - 1) * a.length) {
			return a;
		}

		// Curseur qui balaye l'array
		if (m == a.length - 1) {
			m = 0;
		}

		// Swap ascendant
		if (a[m] > a[m + 1]) {
			int s = a[m + 1];
			a[m + 1] = a[m];
			a[m] = s;
		}

		// Number of iterations
		n += 1;
		// Number of elements in the array
		m += 1;

		return myBubbleSort(a, n, m);
	}

	// Bubble sort officielle : array , array length
	// Le plus grand est mis au bout a la fin du premier passage, on peut travailler
	// que sur l'array moins le dernier element
	public static int[] bubbleSort(int[] a, int n) {

		// Base case
		if (n == 1) {
			return a;
		}

		for(int i = 0 ; i != n - 1; i++) {
			if (a[i] > a[i + 1]) {
				int s = a[i + 1];
				a[i + 1] = a[i];
				a[i] = s;
			}
			
		}

		return bubbleSort(a, n - 1);
	}
	
	
	
	//Insertion sort: avec header et appel de la fonction recursive
	public static int[] insertionSort(int []a) {
		//Header:
		int n = a.length;
		if(a.length == 0)
			return a;
		
		return insertionSortRecursion(a, n);
	}
	
	
	public static int[] insertionSortRecursion(int[] a, int n) {
		
		//Base case:
		if(n <= 1 ) {
			return a;
		}
		
		//Recursive body
		for(int i = 0 ; i != n-1; i++) {
			
			if(a[n - 1] < a[i]) {
				//le dernier prend la place de i et on decale tout de 1
				for(int j = i ; j != n - 1 ;j++) {
					int swap = a[j];
					a[j] = a[n - 1];
					a[n - 1] = swap;
				}
				
			}
		}
		
		return insertionSortRecursion(a, n - 1);
	}
	
	
	
	
	

}
