import kr.or.bit.Airplane;

/*
 * 요구사항
 * 
 * 우리회사는 비행기를 주문, 제작, 판매하는 회사입니다.
 * 우리회사는 비행기를 생산하는 설계도를 작성하려고 합니다.
 * 
 * 사장님의 요구사항
 * 1. 비행기를 생산하면 비행기의 이름과 번호를 부여해야 합니다. (ex "대한항공", 112)
 * 2. 비행기가 생산되면 비행기의 이름과 번호가 맞게 부여됬는지 확인 하는 기능이 필요합니다. (정보출력)
 * 3. 비행기가 출고 될 때마다 비행기에 누적대수를 확인 할수 있습니다.
 * 
 */
public class Ex06_Static_Airplane {

	public static void main(String[] args) {
		
//		Airplane a = new Airplane();
//		a.airPrint("대한",1);
//		//a.airCount();
//		
//		Airplane a2 = new Airplane();
//		a2.airPrint("아시아",2);
//		//a2.airCount();
//		
//		Airplane a3 = new Airplane();
//		a3.airPrint("제주",3);
//		//a3.airCount();
		
		Airplane air = new Airplane("대한", 707);
		air.airplaneInfo();
		air.airplaneCount();
		
	}

}
