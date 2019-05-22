
public class Ex10_Statement {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		/*
		 * 제어문
		 * 조건문(분기문): if(if, else if, if), switch(), case break..
		 * 반복문:for(반복횟수), while(조건), do while() 강제실행
		 * break(블록탈출), continue(아래구문 skip) 
		 * 
		 */
		
		int count = 0; //local variable은 초기화 필수
		if (count<1) {
			System.out.println("True입니다");
		}
		
		if(count<1)System.out.println("true생략");
		
		char data ='A'; 
		switch(data) { //조건값으로 올수있는거: [숫자], [char], [String]
			case 'A': System.out.println("문자비교");
				break;
			default : System.out.println("default");
		}
		
		//반복문
		int sum =0;
		for(int i=0; i<=10; i++) {
			//System.out.println("i: "+i);
			sum += i;
		}
		System.out.println("1부터 10까지의 합 sum: "+sum);
		
		//for문을 이용하여 1~10까지 홀수의 합
		int sum2=0;
		for(int i=1; i<=10; i+=2) {
			sum2 += i;
		}
		System.out.println("1부터 10까지의 홀수 합 sum: "+sum2);
		
		//for문을 이용하여 1~100까지 짝수의 합
		int sum3=0;
		for(int i=1; i<=100; i++) {
			if(i % 2==0) {
				sum3 += i;
			}
		}
		System.out.println("1부터 10까지의 홀수 합 sum: "+sum3);
		
		//구구단
		//for문(중첩) >>행열
		for(int i=2; i<=9; i++) {
			for(int j=1; j<=9; j++) {
				System.out.printf("[%d]*[%d]=[%d]\t",i,j,i*j);
				//System.out.println(i + "*" + j + "=" + (i*j));
			}
			System.out.println();
		}
		System.out.println();
		
		// *(break(탈출), continue(스킵))
		for(int i=2; i<=9; i++) {
			for(int j=1; j<=9; j++) {
				if(i==j) {
					//continue; //아래구문을 넘어가라
					break;// 멈춰라
				}
				System.out.printf("[%d]*[%d]=[%d]\t",i,j,i*j);
				//System.out.println(i + "*" + j + "=" + (i*j));
			}
			System.out.println();
		}
		System.out.println();
		
		
		for(int i=2; i<=9; i++) {
			for(int j=1; j<i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		
//		for(int i=100; i>=0; i--) { //시작값을 큰값으로 할수도 있다.
//			System.out.println("i: "+i);
//			
//		}
		
		//피보나치
		System.out.println("피보나치");
		int a=0, b=1, c=0;
		for(int i=0; i<10; i++) {
			a=b;
			b=c;
			c=a+b;
			System.out.println(""+c);
		}
		
		
	}

}
