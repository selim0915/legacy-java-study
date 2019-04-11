import java.util.Scanner;

public class Ex11_Statement {

	public static void main(String[] args) {
		
		//while
		//while(true) {
		//	System.out.println("True");
		//}
		
		int i=10;
		while(i>=10) {
			System.out.println(i);
			//반드시 내부에서 증가감을 처리해야한다.
			i--;
		}
		
		int sum=0;
		int j=1;
		while(j<=100) {
			sum+=j;
			j++;
		}
		System.out.println("1부터 100까지의 sum: " + sum);
		
		//while 구구단
		i=1; 
		while(i<=9) {
			j=2;
			while(j<=9) {
				System.out.println(i+"*"+j+"="+(i*j));
				j++;
			}
			System.out.println();
			i++;
		}
		
		//do while(강제적 실행) -무조건 한번 실행, 그 이후 조건 판단
		//do {실행문} while(조건식)
		
		//>>메뉴구성
		//>>1, 인사
		//>>2,급여
//		Scanner sc = new Scanner(System.in);
//		int inputdata =0;
//		do {
//			System.out.println("숫자입력: 0~10까지");
//			inputdata = Integer.parseInt(sc.nextLine());
//		} while(inputdata>10); //while true 이면 계속 반복(조건식이 참일 때까지 계속 반복) , 참이 아니면 do 다시 돌아감.
//		System.out.printf("당신이 입력한 숫자는 %d 입니다.", inputdata);
		
		int a=1;
		do {
			System.out.println(a);
			a++;
		}while(a<=10);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		int b=1;
		do {
			System.out.println(b);
			b++;
		}while(b<=10);
	}

}
