package middleCharacter;

public class Launcher {

	public static void main(String[] args) {

		String str = "testsa";
		System.out.println(getMiddle(str));

	}

	public static String getMiddle(String word) {
		// Code goes here!

		if (word.length() % 2 != 0) {
			return word.substring(word.length() / 2, word.length() / 2 +1 );
		} else {

			return word.substring(word.length() / 2 - 1, word.length() /2 + 1);
		}

	}

}
