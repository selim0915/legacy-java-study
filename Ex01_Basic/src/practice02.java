
public class practice02 {

	public static void main(String[] args) {
		int score = 0;
		String prize = "";
		
	    for (int i = 0; i<5; i++) {
	        score += (int)((Math.random()*10) + 1);	
	    }
	    
	    if (score > 20) {
	    	prize += "°æÇ°";
	    } else {
	    	prize += "Ä©¼Ö";
	    }
	    
	    System.out.println("Score: " + score);
	    System.out.println("Prize: " + prize);
	    System.out.println("Random: " + (int)(Math.random()*100));
	}
}
