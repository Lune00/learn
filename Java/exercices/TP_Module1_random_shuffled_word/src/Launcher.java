import java.io.BufferedReader;

import java.io.FileReader;
import java.io.IOException;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.*;
import java.util.Scanner;

public class Launcher {

	// LEARN : fonctions de test

	// test copy char array
	public static void testCopyCharArray() {
		char[] temp = new char[14];
		char[] monArray = { 'a', 'b', 'c', 'd' };
		System.out.println(temp);
		temp = Arrays.copyOf(monArray, 3);
		System.out.println(temp);
		temp = monArray;
		System.out.println(temp);
	}

	public static void learn() {

		// Version avec contraintes d'indications
		char[] mot = { 'b', 'o', 'n', 'j', 'o', 'u', 'r' };
		printCharArray(mot);

	}

	// Comparaison de tableaux: Arrays.equals(array1,array2)
	public static void printCharArray(char[] table) {

		char[] monMot = { 'b', 'o', 'n', 'j', 'o', 'u', 'r' };
		if (Arrays.equals(table, monMot))
			System.out.println("Ok");
		System.out.println("Done");

	}

	// BEGIN - DEBUG Sylvain:
	//static int RANDOM = (int) (Math.random() * 2000);

	public static char[] tirerMotAleatoirement() throws FileNotFoundException {
		File file = new File("dictionnaire.txt");
		Scanner sc = new Scanner(file, "UTF8");
		char[] tab = new char[100];
		char[] temp = new char[100];

		int lineNumber = 1;

		Random rand = new Random();
		int n = rand.nextInt(2000);
		
		//System.out.println(RANDOM);

		while (sc.hasNextLine()) {
			
			temp = sc.nextLine().toUpperCase().toCharArray();
			
			if (lineNumber == n) {
				System.out.println("here");
				tab = temp;
				break;
			} 
			else {
				lineNumber++;
			}
		}
		sc.close();
		return tab;

	}
	
	public static void display(char[] table) {
		System.out.println(table);
	}

	// END - DEBUG Sylvain:
	
	
	//Test tirage aleatoire uniforme d'une ligne dans un fichier (not used)
	// Reservoir-sampling algorithm: select a uniformely distributed value from a
	// collection of unknown size
	public static void reservoirSampling() throws FileNotFoundException {

		File file = new File("dictionnaire.txt");
		Scanner scan = new Scanner(file, "UTF8");

		// Initialize a stream of pseudo random numbers
		Random rand = new Random();
		// nextTint(int n ) : give a pseudo_random number,
		// uniformaly distributed between 0 and n

		int n = 0;
		char[] result = new char[100];

		while (scan.hasNextLine()) {
			n++;
			char[] ligne = scan.nextLine().toUpperCase().toCharArray();
			if (rand.nextInt(n) == 0) {
				result = ligne;
			}
		}

		System.out.println(result);
	}



	
	//Fonction principale pour le TP
	public static void maximot() {

		System.out.println("Maximot 1");
		// Load Dictionnary:
		loadDictionnaryIntoList();

		String wordToFind;
		String wordToFindShuffled;

		// Pick-up word and shuffle
		wordToFind = giveRandomWordFromList();
		wordToFindShuffled = shuffleWordLetters(wordToFind);

		// TMP - Debug
		System.out.printf("Le mot a trouver est : %s\n", wordToFindShuffled);

		// Game Loop:
		String answer;
		Scanner s = new Scanner(System.in);
		int triesLeft = Launcher.maxTry;
		boolean answerNotFound = true;

		do {
			System.out.println("Taper votre réponse: (" + triesLeft + " essai(s))");
			answer = s.nextLine();
			triesLeft--;

			// String compare:
			if (answer.equals(wordToFind.toLowerCase()))
				answerNotFound = false;
			// answerNotFound ||
		} while (answerNotFound && triesLeft != 0);

		s.close();

		// Game Over
		if (answerNotFound) {
			System.out.printf("Vous avez perdu. Merci d'avoir joué. Le mot à trouver était %s\n", wordToFind);
		} else {
			System.out.printf("%s est la bonne réponse ! Merci d'avoir joué.", wordToFind);

		}

	}
	
	
	// Ma version (sans les indications)
	// Global. Liste qui stocke les mots contenus dans le fichier dictionnaire.txt
	public static List<String> mots = new ArrayList<String>();

	// Global. Nombre d'essais avant le Game Over
	static final int maxTry = 3;

	// Store all words from the file into a List
	public static void loadDictionnaryIntoList() {

		// Ouverture du fichier dictionnaire avec un Buffer :
		BufferedReader readDico;
		try {
			readDico = new BufferedReader(new FileReader("dico.txt"));
			String line = readDico.readLine();
			while (line != null) {
				mots.add(line);
				line = readDico.readLine();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		if (mots.size() == 0)
			mots.add("Vide");
	}

	// Reservoir sampling method : equiv to get a random line from a file
	public static void getRandomWordFromDictionnaryFile() {

		BufferedReader readDico;
		try {
			readDico = new BufferedReader(new FileReader("dico.txt"));
			String line = readDico.readLine();
			while (line != null) {
				mots.add(line);
				line = readDico.readLine();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public static String giveRandomWordFromList() {

		int randomIndex = (int) (Math.random() * mots.size());
		return (mots.get(randomIndex));
	}

	public static String shuffleWordLetters(String wordToShuffle) {

		char[] letters = wordToShuffle.toCharArray();

		for (int i = 0; i != letters.length; i++) {
			int randomPosition = (int) (Math.random() * wordToShuffle.length());
			char temp = letters[i];
			letters[i] = letters[randomPosition];
			letters[randomPosition] = temp;
		}
		// Remove Uppercase
		return new String(letters).toLowerCase();
	}

	// Not used
	public static boolean withinTheDictionnary(char[] wordPlayer, char[] wordToFind) {
		return Arrays.equals(wordPlayer, wordToFind);
	}



	public static void main(String[] args) {
		// Solution TP1 : maximot();

		char[] monmot = new char[100];

		try {
			monmot = tirerMotAleatoirement();
			// reservoirSampling();
		} catch (Exception e) {
			System.out.println("Fichier non trouvé");
		}

		display(monmot);
	}

}
