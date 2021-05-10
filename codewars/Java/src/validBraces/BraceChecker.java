package validBraces;

//import java.util.HashMap;
import java.util.Stack;

public class BraceChecker {

	// public HashMap<Character, Character> getDictionnary() {
	// HashMap<Character, Character> map = new HashMap<>();
	// map.put('{', '}');
	// map.put('(', ')');
	// map.put('[', ']');
	// return map;
	// }
	// HashMap<Character, Character> map = getDictionnary();

	public boolean isValid(String braces) {

		boolean atLeastOneReplacement = false;

		// Tant qu'il y a des remplacements
		do {
			atLeastOneReplacement = false;

			// Si replace renvoie la meme string que celle d'origine pas de replace
			// Si replace ne renvoie pas la meme string que celle d'origine replace
			if (!braces.equals(braces = braces.replace("()", ""))) {
				atLeastOneReplacement = true;
			}
			if (!braces.equals(braces = braces.replace("{}", ""))) {
				atLeastOneReplacement = true;
			}
			if (!braces.equals(braces = braces.replace("[]", ""))) {
				atLeastOneReplacement = true;
			}
		} while (atLeastOneReplacement);

		// Si plus de remplacement possible et que la chaine n'est pas vide elle est
		// invalide, si vide elle est valide
		return braces.length() == 0;
	}

	public boolean isValidRecursif(String braces) {
		return isValidRecursion(braces, braces.length());
	}

	public boolean isValidRecursion(String braces, int n) {

		braces = braces.replace("()", "");
		braces = braces.replace("{}", "");
		braces = braces.replace("[]", "");

		// System.out.println(braces.length()+" n="+n);

		// Base cases:
		// String is empty => true
		if (n == 0) {
			return true;
		}
		// String has not been modified between two calls =>
		if (n == braces.length()) {
			return false;
		}

		n = braces.length();

		return isValidRecursion(braces, n);
	}

	// Solution de Frozar:

	public String openDelimiter = "([{";
	public String closeDelimiter = ")]}";

	public boolean doesClose(String openDelimiter, String closeDelimiter) {
		return ((openDelimiter.equals("(") && closeDelimiter.equals(")"))
				|| (openDelimiter.equals("[") && closeDelimiter.equals("]"))
				|| (openDelimiter.equals("{") && closeDelimiter.equals("}")));
	}

	public boolean isValidFrozar(String braces) {
		System.out.println("braces: " + braces);
		Stack<String> stackOfDelimiter = new Stack<>();

		boolean result = true;
		for (int i = 0; i < braces.length(); ++i) {
			String currentDelimiter = braces.substring(i, i + 1);
			// out.println(currentDelimiter);

			// As an open delimiter can be after another open delimiter or a close
			// delimiter,
			// just put it in the stack
			if (openDelimiter.contains(currentDelimiter)) {
				stackOfDelimiter.push(currentDelimiter);
			}
			// When dealing with the closing delimiter, stuff happens
			else {
				// A close delimiter cannot be the first character to deal with,
				// so result = false and EXIT
				if (stackOfDelimiter.empty()) {
					result = false;
					break;
				}
				// Retrieve the previous character from the stack and compare it to the current
				// closing delimiter.
				// If they don't match, result = false and EXIT
				else {
					String expectedOpenDelimiter = stackOfDelimiter.pop();
					if (!(doesClose(expectedOpenDelimiter, currentDelimiter))) {
						result = false;
						break;
					}
				}
			}
		}

		// If the stack is not empty at the end of the parsing of the input string,
		// so some delimiter are not closed properly, result = false end EXIT
		if (!(stackOfDelimiter.empty())) {
			result = false;
		}
		System.out.println("result: " + result);
		return result;
	}

	// Frozar recursif
	
//	 public boolean isValid(String braces) {
//		    out.println("braces: " + braces);
//		    return isValidRecursif(braces.substring(1), braces.substring(0, 1));
//		  }

	public boolean isValidRecursif(String braces, String acc) {
		if (braces.isEmpty()) {
			return acc.isEmpty();
		} else {
			String currentDelimiter = braces.substring(0, 1);

			// As an open delimiter can be after another open delimiter or a close
			// delimiter,
			// just put it in the stack
			if (openDelimiter.contains(currentDelimiter)) {
				return isValidRecursif(braces.substring(1), acc + currentDelimiter);
			}
			// When dealing with the closing delimiter, stuff happens
			else {
				// A close delimiter cannot be the first character to deal with,
				// so result = false and EXIT
				if (acc.isEmpty()) {
					return false;
				}
				// Retrieve the previous character from the stack and compare it to the current
				// closing delimiter.
				// If they don't match, result = false and EXIT
				else {
					int lastButOneIndex = acc.length() - 1;
					String expectedOpenDelimiter = acc.substring(lastButOneIndex);
					if (doesClose(expectedOpenDelimiter, currentDelimiter)) {
						return isValidRecursif(braces.substring(1), acc.substring(0, lastButOneIndex));
					} else {
						return false;
					}
				}
			}
		}
	}

}
