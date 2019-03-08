import java.util.Scanner;

/*
 main 함수 scanner 사용 주민번호 입력 받고
 앞: 6자리 뒤:7자리
 
 입력값: 123456-1234567
 
 1. 자리수 체크(기능)함수 (14ok)
 2. 뒷번호 첫번쨰 자리값 1~4까지의 값만 허용 가능 함수
 3. 뒷번호 첫번째 자리값을 가지고 1,3 남자 2,4여자 출력 가능 함수
 
 3개의 함수를 static으로 선언 하세요,
 * 
 */
public class Ex07_String_Total_Quiz {

	static boolean juminCheck(String str) {
//		if(str.length()==14) {
//			return true;
//		} else {
//			System.out.println("14자리를 입력해주세요.");
//		}
//		return false;
		return str.length() == 14? true : false;
	}
	
	static boolean juminFirstWrite(String str) {
		
		int num=Integer.parseInt(str.substring(7, 8));
		//String num = str.substring(7, 11);
		
//		for(int i=0; i<=4; i++) {
//			if(num >=1 && num<=4) {
//				return true;
//			} else {
//				return false;
//			}
//		}
//		return false;
		
		boolean check =false;
		for(int i=0; i<=4; i++) {
			if(num >=1 && num<=4) {
				return true;
			}
		}
		return check;
	}
	
	static void juminDisplay(String ssn) {
		
		char cgen = ssn.replace("-", "").charAt(6); //6번째 인덱스를 char형식으로 변환
		
		switch(cgen) {
		case '1':
		case '3':
			System.out.println("남자");
			break;
		case '2':
		case '4':
			System.out.println("여자");
			break;
		default : 
			System.out.println("1~4의 숫자를 입력하세요.");
		}
	}
	
	public static void main(String[] args) {
		
		String ssn ="";
		do {
			Scanner sc = new Scanner(System.in);
			System.out.println("주민번호 입력");
			ssn = sc.nextLine();
			
			//String num=ssn.substring(7, 11);
			//System.out.println(num);
			if(juminCheck(ssn)) {
			juminDisplay(ssn);}
			
		} while(!juminCheck(ssn) || !juminFirstWrite(ssn));
	}

}
