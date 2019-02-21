package kr.or.bit;
/*
 * 접근자(한정자, 수정자) = modifier
 * public : 공유(폴더,패키지 상관없이 모든 자원을 공유하겠다) 
 * private: 개인(캡슐화, 은닉화: 클내스 내부에서 공유, 참조변수(객체) 사용불가 한 자원) 
 * 
 * *객체지향 특징: 캡슐화, 은닉화*
 * 1.	클래스 내부에서 private int age;
 * 1.1 	private: 직접할당을 막고 간접할당을 통해서 자원 보호
 * 1.2 	설계자의 의도 = 원하는 값만 처리할 수 있게 하겠다. age변수에 1~200 정수만 허용되게 하겠다. => 별도의 함수표현 가능
 * 1.3 	캡슐화 된 자원의 간접할당을 처리하는 특수한 함수(setter, getter)
 * 		private member field 에 read, write를 할수 있는 함수
 * 1.4 	private int age;
 * 		-setter
 * 		-getter
 * 		//필요에 따라서 setter, getter 하나씩만 구현할 수 있다.
 */
public class Car {
	private int window;
	private int speed;

	public int getWindow() { //read
		return window;
	}

	public void setWindow(int window) { //write
		this.window = window;
	}

	public int getSpeed() {
		return speed;
	}

	public void setSpeed(int speed) {
		//간접할당
		if(speed <0) {
			this.speed = speed;
		} else {
			this.speed = speed;
		}
	}
	
	//스피드를 올리는 기능
	public void speedUp() {
		speed +=10;
	}
	
	public void speedDown() {
		if(speed >0) {
			speed-=5;
		} else {
			speed=0;
		}
	}
	
}
