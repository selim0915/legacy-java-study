//연산자, 제어문

public class Ex07_Operation {

	public static void main(String[] args) {
		int sum = 0;
		// 대입연산자 (+=, -=, *=, /=) 습관적으로 사용할 것.
		sum += 1; // sum = sum+1;
		sum -= 1; // sum = sum-1;
		System.out.println("sum: " + sum);

		// 간단한 학점계산기
		// a+, b+, f
		// 90점 이상 a, 95점 이상 a+

		int score = 90;
		String grade = ""; // 문자열 초기화
		System.out.println("당신의 점수는: " + score);

		if (score >= 90) {
			// System.out.println("score1: "+"a");
			grade = "a";
			if (score >= 95) {
				grade += "+";
			} else {
				grade += "-";
			}
		} else if (score >= 80) {
			// System.out.println("score2: "+"b");
			grade = "b";
			if (score >= 85) {
				grade += "+";
			} else {
				grade += "-";
			}
		} else if (score >= 70) {
			// System.out.println("score3: "+"c");
			grade = "c";
			if (score >= 75) {
				grade += "+";
			} else {
				grade += "-";
			}
		} else {
			// System.out.println("score4: "+"f");
			grade = "f";
		}
		System.out.println("당신의 학점은: " + grade);

		// 함수안에서 sysout > ctrl + space
		// System.out.println();

		// 자동정렬
		// ctrl + shift + f
		
		//switch
		int data = 100;
		switch (data) {
		case 100: System.out.println("100입니다"); 
			break;
		case 200: System.out.println("200입니다"); 
			break;
		case 300: System.out.println("300입니다"); 
			break;
		default: System.out.println("default");
		}
		
		switch(data) {
		case 100: System.out.println("100입니다 ^^");
		case 90: System.out.println("90입니다 ^^");
		case 80: System.out.println("80입니다 ^^");
		default: System.out.println("default");
		}
		
		
		int month =2;
		String res = "";
		
		switch(month) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12: res="31";
			break; 
		case 4:
		case 6:
		case 9:
		case 11: res="30";
			break;
		case 2:res="29";
			break;
		default: res ="월이 아닙니다.";
		}
		System.out.println(month+"월은 "+ res +"일까지 입니다.");
		
		/*
		 *  참조문서 (https://docs.oracle.com/javase/8/docs/api/index.html)
		 * package (폴더: 잘 정리된 폴더) 
		 * package에는 interface, class가 들어 있다. //수학계열
		 * java.lang.Math(Math클래스) //언제만들어졌나, 부모가 누구인가, 자원은 무엇을 가지고 있는가 
  		 * random()
		 * pseudorandom double greater than or equal to 0.0 and less than 1.0. 
		 * 난수 발생이 double로 만들어 진다. (0.0<= vlaue <1.0)=> 0.99999(소수이하 15자리?) 
		 * *원칙적으로 클래스는 new로사용한다. 그런데 class가 static자원을 가지고 있다면 new없이도 사용가능하다.
		 * Java.lang.Math m = new java.lang.Math()
		 * m.random()
		 * 
		 * java.lang.Math (앞에 부분을 생략하는 이유?)
		 * java.lang은 java파일에 default로 선언되어있다.
		 */	
		
		System.out.println("Math.random(): " + Math.random());
		System.out.println("Math.random()*10: " + Math.random()*10);
		//소수점 *10 이동
		System.out.println("(int)Math.random()*10: " + (int)(Math.random()*10));
		//0~9정수
		System.out.println("((int)(Math.random()*10)+1)): " + ((int)(Math.random()*10)+1));
		//1~10정수
		
		int jumsu = ((int)(Math.random()*10)+1)*100;
		System.out.println(jumsu);
		System.out.println();
		
		/*
		 * Q
		 * 만드려고 하는 시스템은 백화점 경품 추첨 시스템
		 * 겸품 추첨기 1000점은
		 * 경품 Tv, NoteBook, 냉장고, 한우세트, 휴지
		 * 겸품 추첨기 900점은
		 * 경품 NoteBook, 냉장고, 한우세트, 휴지
		 * 겸품 추첨기 800점은
		 * 경품 냉장고, 한우세트, 휴지
		 * 겸품 추첨기 700점은
		 * 경품 한우세트, 휴지
		 * 겸품 추첨기 600점은
		 * 경품 휴지
		 * 그 외는 100~500까지는 칫솔
		 * 
		 * 사용자가 랜덤하게 100~1000까지 점수가 나온다.
		 */
		int num = ((int)(Math.random()*10)+1)*100;
		String present ="";
		
		switch(num) {
		case 1000: present +="TV "; 
		case 900: present +="NoteBook ";
		case 800: present +="냉장고 ";
		case 700: present +="한우세트 ";
		case 600: present +="휴지 ";
			break;
		default: present="칫솔 ";
		}
		System.out.println("당첨번호는: "+num +" 입니다.");
		System.out.println("당첨된 상품은: "+present+"입니다.");
		
		
	}

}
