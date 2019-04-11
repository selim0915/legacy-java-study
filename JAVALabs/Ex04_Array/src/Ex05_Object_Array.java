import kr.or.bit.Emp;

//배열에서 가장 중요한 파트는 객체배열이다.
//실무에서 많이 쓰임
public class Ex05_Object_Array {

	public static void main(String[] args) {
		//신입사원 3명 등록
		//배열을 사용하지 않으면
		//Emp e = new Emp();
		//Emp e2 = new Emp();
		//Emp e3 = new Emp();
		
		//객체배열은 방을 만들고 값을 넣어주고,,
		Emp[] emplist = new Emp[3];
		emplist[0] = new Emp();
		emplist[0].setEmpno(1000);
		emplist[0].setEname("김유신");
		emplist[1] = new Emp(2000, "아무개");
		emplist[2] = new Emp(3000, "우세림");
		
		for(int i=0; i<emplist.length; i++) {
			emplist[i].empInfo();
		}
		
		// 3개의 Emp타입의 배열을 만들고
		// 각각의 방에 객체 주소값을 넣었다.
		//int[] arr = new ont[]{10,20,30};
		Emp[] emplist2 = new Emp[] {new Emp(1,"이씨"), new Emp(2,"박씨"), new Emp(3,"김씨")};
		for(int i=0; i<emplist2.length; i++) {
			emplist2[i].empInfo();
		}
		
		//int[] arr = {10,20,30}
		Emp[] emplist3 = {new Emp(111,"A"), new Emp(222,"B")};
		for(int i=0; i<emplist3.length; i++) {
			emplist3[i].empInfo();
		}
		
	}

}
