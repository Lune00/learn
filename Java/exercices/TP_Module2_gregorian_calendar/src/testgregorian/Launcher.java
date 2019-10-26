package testgregorian;

import java.text.DateFormatSymbols;
import java.util.Arrays;
import java.util.GregorianCalendar;
import java.util.Locale;

public class Launcher {

	//TMP solution: Global Variables
	static GregorianCalendar myCal = new GregorianCalendar();
	static Locale myLocale = new Locale.Builder().setLanguage("fr").setRegion("FR").build();

	
	// TMP solution: get name of days from DateFormatSymbols instance (allows to use Localisation of the user).
	// Return an array Of days names
	public static String[] getDayNames() {
		
		// Returns an 8 element array with empty first element, index from 1-7 with 'sun.' first. Need some work
		String[] dayNames = DateFormatSymbols.getInstance(myLocale).getShortWeekdays();
		
		// Rearrange indexes
		for (int i = 1; i != dayNames.length; i++) {
			dayNames[i - 1] = dayNames[i];
		}
		// Remove last empty element to get 7 element array
		dayNames = Arrays.copyOf(dayNames, 7);

		// Re-order: 'lun.' to 'dim.'
		for (int i = 0; i != dayNames.length; i++) {
			String temp = dayNames[dayNames.length - 1 - i];
			dayNames[dayNames.length - 1 - i] = dayNames[0];
			dayNames[0] = temp;
		}
		return dayNames;
	}

	public static int getColumnOfFirstDayNameInMonth(String NameOfCurrentMonth, String[] dayNames) {
		// Find index of the starting day of the month in dayNames array // Simulate Hash Map
		for (int i = 0; i < dayNames.length; i++) {
			if (dayNames[i] == NameOfCurrentMonth)
				return i;
		}
		return -1;
	}
	
	//Return a string 'stringToCenter' centered on a 'finalLength' string's length
	public static String getCenteredString(String stringToCenter, final int finalLength) {
		
		if( stringToCenter.length() > finalLength)
			return stringToCenter;
		
		//Add finalLength to each side of the content to justify
		String centeredString = String.format("%"+finalLength+"s%s%"+finalLength+"s",new String(),stringToCenter,new String());
		//Find mid, start and end of the substring 
		float mid = (centeredString.length()/2);
		//Put a cursor on the left (half finalLength from the middle)
		float start = mid - finalLength/2;
		//Put a cursor on right (half finalLength from the middle)
		float end = start + finalLength ;
		//Total nbr of characters between start and end is exactly equal to finalLength with centered content
		return centeredString.substring((int)start, (int)end);
	}

	// Display the current month of the current year in the standard output
	// The calendar is displayed as a grid where each columns are each day of the week,
	// and each row is a week of the month
	public static void displayCalendarOnGrid(final int year, final int month) {

		//Set cal to current(year,month)
		myCal.set(year, month, 1);

		String NameOfCurrentMonth = myCal.getDisplayName(GregorianCalendar.MONTH, GregorianCalendar.LONG_FORMAT,
				myLocale);
		String NameOfFirstDayOfMonth = myCal.getDisplayName(GregorianCalendar.DAY_OF_WEEK,
				GregorianCalendar.SHORT_FORMAT, myLocale);
		int numberOfDaysInMonth = myCal.getActualMaximum(GregorianCalendar.DAY_OF_MONTH); // 28
		
		// Store day names <=> headers of the grid view of calendar
		String[] colsDayNames = getDayNames();

		//Return index from the array of the first day of the month (between 0 and 6)
		//Give the starting col in the grid view
		int startingCol = getColumnOfFirstDayNameInMonth(NameOfFirstDayOfMonth,colsDayNames);
				
		// PRINT TO STANDARD OUTPUT CAL:
		
		String columnHeaders = new String(); 
		for (int dayName = 0; dayName != colsDayNames.length; dayName++) {
			columnHeaders += String.format("%4s ", colsDayNames[dayName]);
		}
		
		//TODO: print titleHead with the same number of characters than columnHeaders.
		String titleHead = String.format("* %s %4d *", NameOfCurrentMonth, year);
		titleHead = getCenteredString(titleHead, columnHeaders.length());
	

		System.out.println(titleHead);
		System.out.println(columnHeaders);

		//cursor : used to draw each entry of the calendar
		int cursor = 0 ;
		//dayPrint: used to store the number of each day of the month
		int dayPrint = 1;
		
		do {
			//Carriage return
			if( cursor % 7 == 0 && cursor != 0) {
				System.out.print("\n");
			}
			//If cursor >= startingCool, i.e the first day of the month -> print day number under cursor
			if( cursor >= startingCol ) {
				String dayNumber = String.format("%02d ", dayPrint);
				System.out.printf("%4s ", dayNumber);
				dayPrint++;
				cursor++;
			}
			//Otherwise print empty entry under cursor
			else {
				System.out.printf("%4s ", new String());
				cursor++;
			}
		}while(dayPrint <= numberOfDaysInMonth );
	}

	
	public static void main(String[] args) {
		System.out.println("TP2: Gregorian Calendar");
		displayCalendarOnGrid(2019, 3);
	}

}
