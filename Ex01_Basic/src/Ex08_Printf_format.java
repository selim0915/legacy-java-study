import java.util.Scanner;

public class Ex08_Printf_format {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		//java.lang package 아래 있는 자원 (import)선언 구문 없이 사용가능
		//default로 open되어 있어서:)
		
		//C# : Console.WriteLine()
		//C# : Console.ReadLine()
		//java : System.out.println()
		
		System.out.println("A");
		System.out.print("B");
		System.out.print("C");
		System.out.println("D");
		System.out.println("E");
		
		int num=100;
		System.out.println(num);
		System.out.println("num: "+num);
		
		//형식(format)
		System.out.printf("num값은 %d 입니다.\n",num);
		
		/*
		 *  %d (10진수 형식의 정수)
		 *  %f (실수)
		 *  %s (문자열)
		 *  %c (문자)
		 *  특수문자 : \t 탭, \n 줄바꿈
		 */
		System.out.printf("num값은 [%d] 입니다. 그리고 [%d]도 있어요.", num, 1000);
		
		float f =3.14f;
		System.out.println(f);
		System.out.printf("f변수의 값은 : %1.5f 입니다.\n", f);
		
		System.out.printf("문자열 값은 %s로 출력하고 %d 다음 숫자 출력\n","안녕세림",101);
		
		//cmd(console)에서 사용자가 입력한 값을 read 해오기
		//java.util.Scanner sc = new java.util.Scanner(System.in);
		//위 코드처럼 클래스를 사용하려면 폴더를 열어놓아야한다. 
		//java.lang만 자동 오픈되어있다.
		// 그외에는 사용시 상단에 import를 해 놓아야한다.
		Scanner sc = new Scanner(System.in);
		System.out.print("문자값을 입력하세요");
		String value = sc.nextLine(); //사용자 값을 read
		System.out.println("입력값: "+ value);
		
		//System.out.print("숫자값을 입력하세요");
		//int number = sc.nextInt();
		//System.out.println("입력값: "+ number);
		
		//타입별로 읽는 함수가 따로 존재한다.
		//하지만 일단 nextLine만 쓰는걸루
		//권장사항: 문자로 read하고 필요시 숫자로 변환한다.
		//sc.hasNextBoolean()
		//sc.hasNextByte(radix)
		//sc.hasNextFloat()
		
		//*문자를 숫자로 바꾸는 방법
		// Integer.parseInt(s)
		// 문자를 실수로
		// Float.parseFloat(s)
		// Double.parseDouble(s)
		
		System.out.print("숫자를 입력하세요");
		int number =Integer.parseInt(sc.nextLine());
		System.out.println("숫자값: "+ number);
		
		// *숫자를 문자로 변환
		String data = String.valueOf(1000);
		System.out.println(data);
	}

}




