/*
 * 오류 발생.
 * 오류의 종류
 * 1. 에러(error): 네트워크 장애, 메모리, 하드웨어 (개발자 처리 불가능)
 * 2. 예외(Exception): 로직제어 ... (0으로 나눈다.)  >> 개발자의 코드 처리 문제를 해결 할 수 있다.
 * 2-1 예외가 발생되면 어떻게 되나요?
 * 		- 프로그램이 종료됩니다.
 * 2-2 목적:
 * 		- 잘못된 코드를 수정하는 것이 아니라 .. 문제 발생 시 비정상적인 종료를 못하게 막는 것
 * 
 * 
 *try{
 * 		//실행코드
 *} catch(Exception e) {
 *		문제가발생 했으니 문제에 대한 원인을 
 *		1.  출력
 *		2. 로그에 기록남기기
 *		3. 관리자에게 이메일 보내기
 *} finally {
 *		예외가 발생하던, 발생하지 않았던 무조건 실행해야 하는 부분
 *		의무적으로 실행 되어야 하는 구문
 *		ex) DB연결 작업 >> 연결 종료
 *}
 * 
 * 
 * 개발자는 실행 시 발생 할수 잇는 예외에 대해서 처리 해야한다. (runtime 예외는 처리..)
 */
public class Ex01_Exception {

	public static void main(String[] args) {
//		System.out.println("main Start!");
//			System.out.println("Main Logic ~~ 처리");
//				System.out.println(0/0);  //비정상 종료
//			System.out.println("Main Logic ~~ 처리2");
//		System.out.println("main End.");

		System.out.println("main Start!");
		System.out.println("Main Logic ~~ 처리");
		try {
			System.out.println(0 / 0);
		} catch(Exception e) { //e라는 변수가 주소값을 받는다.
			
			//1. System.out.println(0 / 0);
			//2. ArithmeticException arithmetic = new ArithmeticException(); 
			//		ArithmeticException:연산예외 객체  //0으로 나눴을 때 만나는 객체 //Exception은 모든 예외의 부모클래스이다.
			//		에러의 주소값을 담는다.
			//3. arithmetic.set();
			//4. java.lang.ArithmeticException
			
			
			//System.out.println("예외 메세지 출력: "+ e.getMessage());
			e.printStackTrace(); //어느부분에서 에러가 발생했는지.. 위치까지 출력해준다..
			// java.lang.ArithmeticException :  / by zero
		} 
		System.out.println("Main Logic ~~ 처리2");
		System.out.println("main End.");
		
	}

}
