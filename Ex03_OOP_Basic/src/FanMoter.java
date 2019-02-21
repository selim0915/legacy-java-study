import kr.or.bit.Fan;

public class FanMoter {

	public static void main(String[] args) {
		
		Fan f = new Fan();
		
		f.setBrand("삼성");
		f.setColor("레드");
		f.setModelname("슈퍼선풍기");
		f.setPrice(30000);
		
		System.out.println("브랜드: "+ f.getBrand());
		System.out.println("색상: "+ f.getColor());
		System.out.println("모델명: "+ f.getModelname());
		System.out.println("가격: "+ f.getPrice());
		
		System.out.println();
		
		f.poweron();
		System.out.println("전원상태: "+ f.power);
		f.poweroff();
		System.out.println("전원상태: "+ f.power);
		
		System.out.println();
		
		f.levelMethod(1);
		f.levelMethod(2);
		f.levelMethod(3);
		f.levelMethod(4);
	}

}
