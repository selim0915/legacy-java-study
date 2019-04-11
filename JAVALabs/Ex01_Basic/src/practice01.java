
public class practice01 {
	public static void main(String[] args) {
		int score1 = ((int)(Math.random()*10)+1)*100;
		int score2 = ((int)(Math.random()*10)+1)*100;
		System.out.println(score1);
		System.out.println(score2);
		
		int score = score1+score2;
		String prize = "";
		
		switch (score) {
		case 1000:
			prize += "Tv, ";
		case 900:
			prize += "NoteBook, ";
		case 800:
			prize += "³ÃÀå°í, ";
		case 700:
			prize += "ÇÑ¿ì¼¼Æ®, ";
		case 600:
			prize += "ÈÞÁö";
			break;
		default:
			prize += "Ä©¼Ö";
		}
		System.out.println(prize);
		
		
	}
}
