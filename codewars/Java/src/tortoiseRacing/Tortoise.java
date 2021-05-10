package tortoiseRacing;

public class Tortoise {

	public static int[] race(int v1, int v2, int g) {
		
		if(v2 - v1 <= 0 || g < 0) {
			return null;
		}
		
		float dv = (v2 - v1) ; 
		
		//time in seconde
		int t = (int)( (g / dv) * 3600.f ) ;

		int s = t % 60 ;
		t = t / 60 ;
		int m = t % 60 ;
		int h = t / 60 ;
		
		return new int[] { h , m , s };
	}

}
