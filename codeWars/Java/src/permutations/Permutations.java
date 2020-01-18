package permutations;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

class Permutations {

	public static List<String> singlePermutations(String s) {
		Set<String> permutationsSet = new HashSet<String>();

		permutation(s, 0, permutationsSet);

		List<String> permutationsList = new ArrayList<String>();
		for (String str : permutationsSet) {
			permutationsList.add(str);
		}

		return permutationsList;
	}

	// String s : substring to permute, a:starting index b:ending index
	public static void permutation(String s, int startingIndex, Set<String> anagrames) {

		// If a == b, swaping the string return the same string => base case
		if (startingIndex == s.length() - 1) {
			anagrames.add(s);
			return;
		}
		for (int i = startingIndex; i != s.length(); i++) {
			String anagramme = swap(s, startingIndex, i);
			permutation(anagramme, startingIndex + 1, anagrames);
		}

	}

	// Swap characters of string s at index a and b
	public static String swap(String s, int a, int b) {
		char temp;
		char[] charArray = s.toCharArray();
		temp = charArray[a];
		charArray[a] = charArray[b];
		charArray[b] = temp;
		return String.valueOf(charArray);
	}

}