

//Thread : 프로세스에서 하나의 최소 실행단위(method)

//Thread 생성방법
//?여러개의 스텍은 어떻게 만드나요?
//1. Thread 클래스를 상속해서 만든다. -> class Test extends Thread()
//반드시  Thread클래스를 상속할 경우 run()함수 재정의 >>run이 다른 stack의 메인함수역할
//2. implements Runnable 구현 => class Test implement Runnable
// 반드시 run(추상함수)를 재정의 해야한다.

//why? 왜 굳이 2가지 방법이 있을까??? 

// +>>>>>
// extends Thread는 다중상속이 안되서, 
//이미 상속하고있는 클래스들은 Thread 를 추가할 수 없어서..
// 다른 자원을 상속하는 클래스가 Thread를 만들기 위한 방법이다.





//Thread는 추상클래스가 아니다 (일반클래스)이다
//Thread독자적으로 객체 생성도 가능하다  Thread t = new Thread();
class Thread_1 extends Thread{ //Thread 별도의 스텍에서 운영이 가능하다
	 
	@Override
	 public void run() { //별도의 stack을 만들면 제일먼저 run()이 올라간다. 
		//run이 별도의 스레드들의 메인이라고 생각.
		//메인함수의 역할을 한다.
		
		for(int i =0; i<1000; i++) {
			System.out.println("Thread_1 :" + i + this.getName());
		}
		System.out.println("Thread_1 run END ...");
	 }
}

//interface
class Thread_2 implements Runnable{ //Thread를 상속하지 않으면 Thread가 아니다
//지금은 일반 클래스이다 (인터페이스를 상속한)
	@Override
	public void run() {
		for(int i =0; i<1000; i++) {
			System.out.println("Thread_2 :" + i );
		}
		System.out.println("Thread_2 run END ...");
	 }
}

public class Ex02_Multi_Thread {

	public static void main(String[] args) {
		System.out.println("main Start");
		
		//1. Thread_1 객체생성
		Thread_1 th = new Thread_1();
		th.start(); //start() : 스텍을 하나 더 만들어 주는 애, stack를 만드는 로직이 담겨있다, run()을 자동으로 실행해준다.
		//start()는 메인함수에 올라가서 처리된다. 
		//stack 메모리를 만들고 stack에 run()까지 올려놓고

		for(int i=0; i<1000; i++) {
			System.out.println("main: "+i);
		}
		System.out.println("main END ...");
		
		
		
		
		
		//2. 인터페이스
		Thread_2 th2 = new Thread_2(); //개체만들고
		Thread thread = new Thread(th2); //쓰레드안에 집어 넣어서
		thread.start(); //쓰레드 실행
	}
}
