import kr.or.bit.test0211;

public class test20211 {

	public static void main(String[] args) {
		
		
		//클래스명 변수 = new 클래스명();
		
		test0211 t = new test0211();
		
		System.out.println(t.ball);
		
		t.ballstart();
		
		System.out.println(t.ball);
		
		
		String answer = (1+1==2)? "정답"+"!!" : "땡";
		System.out.println(answer);
		
		
		//삼항 연산자
		// 1. 두 수를 임의로 만들어서 두 수중 더 큰수를 출력하라.
		int a = 10;
		int b = 11;
		int result = (a>b)? a:b;
		System.out.println("두 수중 큰 숫자 result: "+result);
		
		// 2. 0 이 2와 같다는 식이 맞는지 틀리는지 출력하는 삼항연산자식을 만들어라
		String result2 = (0==2)? "맞다" : "틀리다";
		System.out.println("0==2는 result2: "+result2);
		
		
		//한정자
		t.age=40;
		t.setName("woo");
		System.out.println("나이:"+t.age+" ,이름:"+t.getName());
		
		
		//기능함수
		t.add();
		t.add2();
		t.add3(2, 3);
		t.add4(2, 3);
		
	}

}
