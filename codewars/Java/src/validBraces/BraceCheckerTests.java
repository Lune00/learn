package validBraces;

public class BraceCheckerTests {

	private static BraceChecker checker = new BraceChecker();

	// @Test
	// public void testValid() {
	// assertEquals(true, checker.isValid("()"));
	// }
	//
	// @Test
	// public void testInvalid() {
	// assertEquals(false, checker.isValid("[(])"));
	// }

	// @Test
	// public void testInvalid2() {
	// assertEquals(false, checker.isValid(")[({}"));
	// }

	// @Test
	// public void testValid2() {
	// assertEquals(true, checker.isValid("(){}[]"));
	// }
	//
	public static void main(String[] args) {

		// ({})[({})]

		// if (checker.isValidRecursif("({})[({})][][{}][[[]]")) {
		// System.out.println("true");
		// } else {
		// System.out.println("false");
		// }

		
		//Pas clair comment ca marche pour moi...
		String str = "abcdef";
		if(!str.equals(str = str.replace("abe", ""))) {
			System.out.println("replacement");
		}
		else {
			System.out.println("no replacement");
		}
		System.out.println(str);

	}

}