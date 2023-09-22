package prj3_1;

public class Split {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String a = "ICN - 인천 - 대한민국 - 대한민국";
		String[] b = splitList(a);
		/*
		for(int i=0; i<b.length;i++) {
			System.out.println(b[i]);
		}*/
		System.out.println(b[0]);
		String input = "Schedule [fcode=AC0101, dep=인천, arrival=부산, sday=2023-09-22, eday=2023-09-22, stime=09:00, etime=10:00, airnum=A001, ariname=B777, econum=30, bsnnum=4]";
		
		int startIndex = input.indexOf("fcode=");
		
	    startIndex += "fcode=".length();
	    int endIndex = input.indexOf(",", startIndex);
	    String fcode = input.substring(startIndex, endIndex).trim();
		
		System.out.println(findFcode(input));
		

	}
	
	public static String[] splitList(String a) {
		return a.split(" - ");
	}
	public static String findFcode(String input) {
		int startIndex = input.indexOf("fcode=");
		startIndex += "fcode=".length();
	    int endIndex = input.indexOf(",", startIndex);
	    String fcode = input.substring(startIndex, endIndex).trim();
		return fcode;
	}
   }
