
public class Ex06_Operation {

	public static void main(String[] args) {
		int result = 100/100;
		System.out.println(result);
		
		result = 13/2;
		System.out.println(result);
		
		result = 13%2;
		System.out.println(result);
		
		//증가감 연산자(++, --) 1씩증가 or 1씩 감소
		//변수1개 전치, 후치 동일
		int i =10;
		++i; //전치증가
		System.out.println(i);
		i++;
		System.out.println(i);
		
		// *전치와 후치가 연산자와 결합하면 본 특성이 나타난다.
		int i2 = 5;
		int j2 =4;
		int result2 = i2 + ++j2;
		System.out.println(result2);
		
		result2 = i2 + j2++; //i2=5, j2=4
		System.out.println(result2);
		System.out.println(j2);
		
		/*
		 * POINT
		 * 자바의 연산 규칙
		 * 정수의 모든 연산은 int로 변환 후 처리
		 * 컴파일러는 byte+byte 를 int+int로 판단
		 */
		
		byte b =100; //-128~127
		byte c =1;
		byte d = (byte)(b+c);
		// 1. byte d = (byte)(b+c); 더미값 발생
		// 2. int d = b+c; 큰 범위에 옮겨담았다. 좋은상태
		System.out.println("d: "+d);
		
		/*
		 * byte+short => int+int
		 * char+char => int+int
		 * int보다 작은 차입은 int형 으로 변환된다.
		 * 
		 * byte+short => int+int 결과 int
		 * char+int => int+int 결과 int
		 * int +long => long+long 결과 long
		 * 
		 * 정수와 실수계산
		 * float +int => float + float 결과 float
		 * long + float => float + float 결과 float
		 * float + double => double+double 결과 double 
		 */
		
		float num2 = 10.45F;
		int num3 = 20;
	    float result5= num2 + num3 ;
		System.out.println((int)result5);
		
		//char는 정수타입 //char는 연산시 정수로 표현된다.
		char c2 = '!';
		char c3 = '!';
		System.out.println(c2); //!
		System.out.println(c2+c3); //66
		char result6 = (char) (c2+c3);
		System.out.println(result6);
		
		//제어문
		//구구단, 별찍기
		int sum = 0;
		for(int j=1; j<=100; j++) {
			//System.out.println(j);
			sum += j;
		}
		System.out.println("sum: "+sum);
		
		int sum2 = 0;
		for(int j=0; j<=100; j+=2) {
			//System.out.println(j);
			sum2 += j;
		}
		System.out.println("sum2: "+sum2);
		
		// ==연산자 값(value)를 비교하는 연산자
		//javascript (===)
		if(10==10.0f) {
			System.out.println("true");
		} else {
			System.out.println("false");
		}
		// 값만 비교하기 때문에 ==로하면 true가 나온다
		
		//!부정연산자
		if('A'!= 65) {
			System.out.println("false: 같은값 아니다");
		} else {
			System.out.println("true: 같은 값이다");
		}
		
		//*암기하자
		//제어문처럼 쓰는 연산자(삼항연산자)
		int p = 10;
		int k = -10;
		int result8 = (p==k) ? p:k;
		// 조건식이 true면 앞에 값
		// 조건식이 false면 뒤에 값을 리턴한다.
		System.out.println("result8: "+result8);
		
		if(p==k) {
			result8 =p;
		} else {
			result8 =k;
		}
		System.out.println("result8: "+result8);

		//연산자 (|[or]  &[and])
		/*
		 *  진리표
		 * 0: false
		 * 1: true
		 * or: 둘중 하나만 참이여도 참
		 * and: 둘다 참이여야 참
		 * 		  or	and
		 * 0  0   0		 0
		 * 0  1   1		 0
		 * 1  0   1		 0
		 * 1  1   1	 	 1
		 * 
		 * sql(oracle)
		 * select * from emp where job='sales' and sal >2000; 
		 * select * from emp where job='sales' or sal >2000; 
		 */
		int x=3;
		int y=5;
		System.out.println("x|y: "+ (x|y));
		System.out.println("x&y: "+ (x&y));
		// 십진수 3을 2진수 값으로 변환
		// 128	64	32	8	4	2	1
		// 0	0	0	0	0	1	1  //3
		// 0	0	0	0	1	0	1  //5
		// 0	0	0	0	1	1	1  //or계산 //7
		// 0	0	0	0	0	0	1  /and계산 //1
		
		/*
		 * *논리 연산자
		 * ||(or), &&(and)
		 *  리턴타입 boolean형
		 *  
		 */
		if(10>0 && -1>1 && 100>2 && 1 > -1) {
			System.out.println("true-&&");
		} else {
			System.out.println("false-&&");
		}
		if(10>0 || -1>1 || 100>2 || 1 > -1) {
			System.out.println("true-||");
		} else {
			System.out.println("false-||");
		}
	}
}













