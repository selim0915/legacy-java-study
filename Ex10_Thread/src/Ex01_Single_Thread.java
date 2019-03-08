


//쓰레드: 하나의 함수
//지금까지 작업한 파일들은 싱글프로세스 + 싱글쓰레드(main stack)를 사용한거다.
//JVM 사용시 call stack [1개]만 제공받아 사용한 것
// 함수 10개를 가지고 있어도 현재 실행되는 함수는 1개

//한번에 하나의 함수만 실행
//함수를 순차적으로 실행


public class Ex01_Single_Thread {

	public static void main(String[] args) {
		System.out.println("나 main 일꾼이야");
		worker();
		worker2();
		System.out.println("나 main 종료");
	}
	
	static void worker(){
		//일꾼함수
		System.out.println("나는 1번 일꾼이야");
	}
	
	static void worker2(){
		//일꾼함수
		System.out.println("나는 2번 일꾼이야");
	}

}
