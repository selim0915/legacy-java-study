import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;

/*
HashMap 사용한 로그한 시스템

		//회원 로그인 데이터 HashMap 으로 관리
		HashMap loginmap = new HashMap();
		loginmap.put("kim", "kim1004");
		loginmap.put("scott", "tiger");
		loginmap.put("lee", "kim1004");
		
		//시스템에 로그인 하는 시나리오
		//ID(0) , PWD(0)  >> 회원  (환영)
		//ID(0) , PWD(x)  >> 실패  (비번다시 입력)
		
		//ID(x) , PWD(x)  >> 실패  (다시 입력해)
		//ID(x) , PWD(0)
		
		//Scanner 사용해서  ID, PWD 입력받으세요
		//loginmap 통해서 검증 로직 처리
		//ID 또는  PWD 틀리면 다시 입력 요청
		//ID , PWD 다 맞으면 회원님 방문 환영합니다 ^^ (출력 프로그램 종료)
	    //ID 는 대소문자 구분없이 처리 합니다. (입력값 대소문자 구분x)
*/
public class Ex13_HashMap_Quiz {

	public static void main(String[] args) {
		HashMap loginmap = new HashMap();
		loginmap.put("kim", "kim1004");
		loginmap.put("scott", "tiger");
		loginmap.put("lee", "kim1004");

		while (loginmap != null) {
			Scanner sc = new Scanner(System.in);
			System.out.println("id를 입력하세요: ");
			String id = sc.nextLine();
			String id2 = id.toLowerCase();
			System.out.println("pw를 입력하세요: ");
			String pw = sc.nextLine();

			
			//my
			if (loginmap.containsKey(id2) && loginmap.get(id2).equals(pw)) {
				// ID(0) , PWD(0) >> 회원 (환영)
				System.out.println("회원님 방문 환영합니다 ^^");
				break;
			} else if (loginmap.containsKey(id2) && !loginmap.get(id2).equals(pw)) {
				// ID(0) , PWD(x) >> 실패 (비번다시 입력)
				System.out.println("비밀번호가 틀렸습니다. 다시 로그인 해주세요.");
			} else if (!loginmap.containsKey(id2) && !loginmap.get(id2).equals(pw)) {
				// ID(x) , PWD(x) >> 실패 (다시 입력해)
				System.out.println("둘다 틀렸습니다. 다시 로그인 해주세요.");
			} else if (!loginmap.containsKey(id2) && loginmap.get(id2).equals(pw)) {
				// ID(x) , PWD(0)
				System.out.println("아이디가 틀렸습니다. 다시 로그인 해주세요.");
			} else {
				System.out.println("로그인 에러");
			}
			
			
			//teacher
			if (!loginmap.containsKey(id2)) {
				System.out.println("id가 없어요 재입력.");
			} else {
				if(loginmap.get(id).equals(pw)) {
					System.out.println("회원님 환영합니다.");
					break;
				} else {
					System.out.println("로그인 오류");
				}
			}
			

		}
		
		
		
	}

}