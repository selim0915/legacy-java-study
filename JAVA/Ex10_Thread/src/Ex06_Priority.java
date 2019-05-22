

//스레드,
//**우선순위 : cpu점유율을 높이는 방법
//모든 thread는 상수값 5를 가진다. (default:5)
//max: 10 ~ min:1(상대적)

class Pth extends Thread{ //쓰레드를 상속받아 run메서드를 오버라이딩 하였다.
	@Override
	public void run() {
		for(int i=0; i<1000; i++) {
			System.out.println("~~~~~~~");
		}
	}
}

class Pth2 extends Thread{
	@Override
	public void run() {
		for(int i=0; i<1000; i++) {
			System.out.println("||||||||");
		}
	}
}

class Pth3 extends Thread{
	@Override
	public void run() {
		for(int i=0; i<1000; i++) {
			System.out.println("★★★★★★★");
		}
	}
}

public class Ex06_Priority {

	public static void main(String[] args) {
		Pth ph = new Pth();
		Pth2 ph2 = new Pth2();
		Pth3 ph3 = new Pth3();
		
		System.out.println(ph.getPriority()); //Priority : 우선순위를 몇 가지고 있니?
		System.out.println(ph2.getPriority());
		System.out.println(ph3.getPriority());
		//getPriority(): 현재 우선순위를 확인 할 수 있다.
		
		ph.setPriority(10); //우선순위 정해줌 : 10매우 중요
		ph2.setPriority(1);
		ph3.setPriority(1);
		//setPriority(): 우선순위를 정할 수 있다.
		
		ph.start();
		ph2.start();
		ph3.start();
		//쓰레드객체.start(): 쓰레드 스택실행
		
		System.out.println("Main END..");
		
	}

}
