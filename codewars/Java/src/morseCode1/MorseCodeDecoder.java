package morseCode1;

public class MorseCodeDecoder {
	
	private static final String WORDS_PATTERN = "   ";
	private static final String CHARACTERS_PATTERN = " "; 

	
	public static String decode(String morseCode) {
		
		StringBuilder sb = new StringBuilder();
		String[] morseWords = splitMorseWords(morseCode);
		
		for(String word : morseWords) {
			
			String[] morseCharacters = splitMorseCharacters(word);
			
			for(String character : morseCharacters) {
				//Translate from MorseCode to English (dictionary)
				
				String wordDecoded = translate(character);
				System.out.println("==>"+wordDecoded);
				sb.append(wordDecoded);
			}		
			sb.append(" ");
		}
		
		return sb.toString().trim();
	}
	
	public static String translate(String character) {
		return "traduction";
	}
	
	
	public static String[] splitMorseWords(String morseCode) {
		return morseCode.trim().split(WORDS_PATTERN);
		
	}
	
	public static String[] splitMorseCharacters(String morseCode) {
		return morseCode.split(CHARACTERS_PATTERN);
	}

}
