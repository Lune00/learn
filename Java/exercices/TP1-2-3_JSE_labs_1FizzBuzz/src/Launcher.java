
import java.util.*;

//Exercices, source: PDF JSE_labs_1.pdf
public class Launcher {

	public static void FizzBuzz() {

		// FizzBuzz Challenge:

		int insertBreakPoints = 9;
		for (int i = 1; i != 101; i++) {

			if (i % 3 == 0 && i % 5 == 0) {
				System.out.print("FizzBuzz ");
			} else if (i % 3 == 0) {
				System.out.print("Fizz ");
			} else if (i % 5 == 0) {
				System.out.print("Buzz ");
			} else {
				System.out.print(i + " ");
			}

			if (i == insertBreakPoints) {
				System.out.print("\n");
				insertBreakPoints += 10;
			}

		}

	}

	// Draw a square with empty square insde
	public static void Square(int n) {

		for (int ligne = 0; ligne != n; ligne++) {

			for (int colonne = 0; colonne != n; colonne++) {

				System.out.print('*');

			}

			System.out.print('\n');
		}

	}

	// Draw a square with empty square inside
	public static void emptySquare(int n) {
		for (int ligne = 0; ligne != n; ligne++) {
			for (int colonne = 0; colonne != n; colonne++) {
				if (ligne == 0 || ligne == n - 1 || colonne == 0 || colonne == n - 1) {
					System.out.print('*');
				} else {
					System.out.print(' ');
				}
			}
			System.out.print('\n');
		}
	}

	// Draw a triangle of base n
	public static void triangle(int n) {
		for (int i = 1; i != n + 1; i++) {
			for (int j = 0; j != i; j++) {
				System.out.print("*");
			}
			System.out.print("\n");
		}
	}

	public static void multiplicationTable() {

		final int valMax = 50;

		System.out.println("Pick up an integer between 0 and " + valMax);
		// Ask for a positive integer (max 20 )

		Scanner s = new Scanner(System.in);
		boolean valueInRange = false;
		boolean error = false;
		
		//multiplicationTable of val:
		int val = 1;
		
		//Ask for a positive integer. Type checked
		do {
			
			String StringInt  = s.nextLine();
			try {
				//parseInt throw error immediatly if wrong type
				val = Integer.parseInt(StringInt);
				//System.out.println("Good type.");
				error = false;
				valueInRange = val > 0 && val <= valMax;
				
			} catch (Exception e) {
				System.out.println("Wrong type. Enter an integer.");
				error = true;
			}

			if( !valueInRange ) System.out.println("Value not accepted. Enter a new value");
		} while (!valueInRange || error);

		// Draw multiplication table for this integer
		
		String line = String.format("%5s","*");
		for(int i = 1 ; i != val + 1 ; i++) {
			line += String.format("%5d",i);
		}
		System.out.print(line);
		System.out.print("\n");
		for(int i = 0 ; i != line.length(); i++) {
			System.out.print("-");
		}
		System.out.print("\n");
		for(int row = 1 ; row != val + 1 ; row++) {
			
			line = String.format("%5d|", row);
			for (int col = 1 ; col != val + 1 ; col++ ) {
				int resultat = row * col ;
				line += String.format("%5d", resultat);
			}
			System.out.print(line);
			System.out.print("\n");
		}
		
		

	}
	
	//Fonctionnement du scanner ok. NextLine parse input jusqu'au prochain retour chario "\n".
	//Si le buffer du Scanner contient toujours des caracteres, ou que un \n il le retourne
	//et vide le buffer jusqu'au prochain retour chariot. Voila pourquoi le code dessous
	//ne demande pas une autre input
	public static void testScanner() {
		    Scanner sc = new Scanner(System.in);
		    System.out.println("Saisissez un entier : ");
		    int i = sc.nextInt();
		    System.out.println("Saisissez une chaîne : ");
		    String str = sc.nextLine();      
		    System.out.println(str+ " FIN ! ");
	}

	public static void main(String[] args) {

		// emptySquare(15);
		// triangle(3);
		// triangle(12);
		multiplicationTable();
		//testScanner();

	}
}
