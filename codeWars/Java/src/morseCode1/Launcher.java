package morseCode1;

import org.junit.Test;
import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.assertThat;

public class Launcher {
	
    @Test
    public void testExampleFromDescription() {
      assertThat(MorseCodeDecoder.decode(".... . -.--   .--- ..- -.. ."), is("HEY JUDE"));
    }
    
    
    
    public static void main(String[] args) {
		System.out.println("test");
		
		System.out.println(MorseCodeDecoder.decode(" b o n j o u r   l e s   a m i s        "));
		
	}
}