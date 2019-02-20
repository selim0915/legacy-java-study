import java.util.Random;
import java.util.Scanner;

public class test_0208 {

	public static void main(String[] args) {

		//1부터 20까지의  정수 중에서 2 또는 3의 배수가 아닌 수의 총합을 구하는 프로그램을 작성하세요
		int sum=0;
		for(int i=1; i<=20; i++) {
			if(i %2 !=0) {
				if(i%3 !=0) {
					sum += i;
				}
			}
		}
		System.out.println("1~20에서 2의배수도, 3의배수도 아닌 총합: "+sum);
		
		int sum2 = 0;
		for (int i = 1; i <= 20; i++) {
			if (i % 2 == 0 || i % 3 == 0)
				continue;
			sum2 += i;
		}
		System.out.println("sum2: "+ sum2);
		
		
		
		//두개의 주사위를 던졌을 때 눈의 합이 6이 되는 모든 경우의 수를 출력하는 프로그램을 작성하세요
		for(int i=1; i<=6; i++) {
			for(int j=1; j<=6; j++) {
				if ((i+j)==6)
				System.out.printf("(%d, %d)\n",i,j);
			}
		}
		
		//가위 , 바위 ,보 게임 또 제어문을 통해서 작성하세요 (IF)
		//컴퓨터가 자동으로 나온 가위 , 바위 , 보 에 대해서 사용자가 값을 입력 해서 처리 하세요
		//( 예를 들면 : 가위=> 1   , 바위 => 2  , 보 => 3)
		Scanner sc = new Scanner(System.in);
		System.out.print("가위=> 1   , 바위 => 2  , 보 => 3 중 하나의 숫자를 입력하세요\n user: ");
		int user = Integer.parseInt(sc.nextLine());
		
		Random r =new Random();
		int computer = r.nextInt(3)+1;
		System.out.println("computer: " + computer);
		
		if (computer==user) {
			System.out.println("비겼습니다.");
		} else if (computer==1 && user==2 || computer==2 && user==3 || computer==3 && user==1) {
			System.out.println("user가 이겼습니다.");
		} else if (computer==1 && user==3 || computer==2 && user==1 ||computer==3 && user==2 ) {
			System.out.println("computer가 이겼습니다.");
		} else {
			System.out.println("가위=> 1   , 바위 => 2  , 보 => 3 을 입력하지 않았습니다.");
		}
		
		for(int i=1; i<=100; i++) {
			for(int j=i; j<=100; j++) {
				System.out.println(j+"\t");
			}
			System.out.println();
		}
		
		
	}

}
