import java.util.Scanner;

/*
 * 간단한 사칙 연산기
 * 입력값 3개 받기 (nextLine())으로 받기 (숫자2, 기호(opr))
 * 목적: Integer.parseInt(), equals() 활용
 * 
 * 출력화면
 * 입력값:100
 * 입력값: +(기호)
 * 입력값: 100
 * 연산결과: 200
 * 
 * hint 
 * 1. if(){} else if(){}
 * 2. if(opr.equals("+")){}
 * 
 * String str = "+"
 * if(str.equals("+"){}
 */
public class Ex09_Operation_Quiz {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.println("첫번째 숫자를 입력하세요");
		int num1 = Integer.parseInt(sc.nextLine());
		System.out.println("기호를 입력하세요");
		String opr = sc.nextLine();
		System.out.println("두번째 숫자를 입력하세요");
		int num2 = Integer.parseInt(sc.nextLine());
		
		int result  =0;
		if(opr.equals("+")) {
			result = num1+num2;
		} else if (opr.equals("-")) {
			result = num1-num2;
		} else if (opr.equals("*")) {
			result = num1*num2;
		} else if (opr.equals("/")) {
			result = num1/num2;
		} else {
			System.out.println("다른 기호 입니다.");
			return;
		}
		
		System.out.printf("입력값: %d \n "
				+ "기호: %s \n "
				+ "입력값:%d \n"
				+ " 연산결과: %d\n",num1, opr, num2, result);
	}
}
