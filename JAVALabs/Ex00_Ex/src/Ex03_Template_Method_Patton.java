

abstract class AbstGameConnectHelper{
	//상속 받으면 하위 클래스가 재정의 할 수 있게..
	protected abstract String doSecurity(String string);
	protected abstract boolean authentication(String id, String password);
	protected abstract int authorization(String userName);
	protected abstract String connection(String info);
	
	public String requestConnection(String encodingInfo) {
		//보안작업 - 암호화 된 문자열을 복호화한다.
		String decodeInfo = doSecurity(encodingInfo);
		//반환 된 것을 가지고 아이디, 암호를 할당한다.
		String id = "aaa";
		String password ="bbb";
		
		if(!authentication(id, password)) {
			throw new Error("아이디 암호 불일치");
		}
		
		String userName ="userName";
		int i =authorization(userName);
		switch (i) {
		case 0:
			System.out.println("게임매니저");
			break;
		case 1:
			System.out.println("유료회원");
			break;
		case 2:
			System.out.println("무료회원");
			break;
		case 3:
			System.out.println("권한없음");
			break;
		default: //기타상황
			break;
		}
		return connection(decodeInfo);
	}
}


public class Ex03_Template_Method_Patton {

	public static void main(String[] args) {
		//템플릿 메서드
		//여러알고리즘을 작업하는 과정에서 ,
		//확인해보니 여러가지로 나눠진 스텝을 선언하고
		//하위 클래스에서 정의를 하는 것
		//통일된 추상클래스를 하나 만들고..
		//변경되는 알고리즘들은 각각 수정해주는 방법
		
		//팩토리 메서드
		//모든 패턴의 기본적인 목표: 기능과 구현의 분리
		//기능을 나열한다음 create메소드에 실행해준다.
		//분리의 장점을 이해한다.
		
		
		
		
	}

}
