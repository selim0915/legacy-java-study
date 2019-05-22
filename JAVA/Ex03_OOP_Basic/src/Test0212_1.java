
class card{
	public int cnum;
	public String cshape;
	public static int h=10;
	public static int w=10;
	public static int ccount;
	
	public void cInfo() {
		System.out.println("카드 번호는: "+cnum+" ,모양은: "+cshape
				+ " ,높이: "+h+" ,넓이: "+w);
		ccount++;
		System.out.println("누적 수: "+ccount);
	}
}

public class Test0212_1 {

	public static void main(String[] args) {
		
		card c = new card();
		c.cnum = 1;
		c.cshape = "별";
		c.cInfo();
		
		card c2 = new card();
		c2.cnum = 2;
		c2.cshape = "별";
		c2.cInfo();
		
		card.h =200;
		card.w =400;
		
		card c3 = new card();
		c3.cnum = 3;
		c3.cshape = "별";
		c3.cInfo();
		
		card c4 = new card();
		c4.cnum = 4;
		c4.cshape = "별";
		c4.cInfo();
		
	}

}
