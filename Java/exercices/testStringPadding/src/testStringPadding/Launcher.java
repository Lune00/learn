package testStringPadding;

public class Launcher {
	
	
	public static void main(String[] args) {
		
		String string = "ABC";
		
		System.out.println(string+" "+string.length());
		String copy = String.format("%5s", string);
		System.out.println(copy+" "+copy.length());
		
	
		//Works only on even nbr of characters
		int sizeIwant=5;
		String out = String.format("%"+sizeIwant+"s%s%"+sizeIwant+"s", "",string,"");
		float mid = (out.length()/2);
		float start = mid - sizeIwant/2;
		float end = start + sizeIwant ;
		
		System.out.println(out.length()+" "+mid+" "+start+" "+end);
		
		System.out.println(out);
		//source : https://stackoverflow.com/questions/8154366/how-to-center-a-string-using-string-format
		String stringCentered = out.substring((int)start, (int)end);
		stringCentered +='|';
		
		System.out.println(stringCentered);
		
		
		
		
	}

}
