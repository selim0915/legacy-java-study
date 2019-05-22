
// 추상클래스와 인터페이스의 공통점
//interface Irepairable{}; //관용적 이르미 I~ , ~able* (~할수있는)

/*
 * 추상클래스와 인터페이스에 공통점
 * 1. 스스로 객체생성이 불가능 하다. (new 연산자를 사용못한다.)
 * 2. 상속, 구현을 통해서만 생성이 가능하다.(메모리에 올라갈 수 있다.)
 * 3. 재정의를 통한 강제구현이 목적이다.
 * 
 * 
 * 추상클래스와 인터페이스에 다른점
 * 1. 인터페이스는 유일하게 다중상속이 가능하다.
 * 		Ex) interface Ia , interface Ib
 * 			class Child implement Ia,Ib
 * 2. 추상클래스는 단일 상속이 원칙이다.
 * 3. 추상클래스는 (완성 된 코드, +미완성된 코드)
 * 4. 인터페이스는 상수를 제외한 나머지는 미완성코드이다 (100%구현해야하는 미완성 코드이다)
 * 
 * *인터페이스간에는 (다중)상속이 가능하다. (인터페이스와 인터페이스 끼리)
 * interface Ia extends Ib, Ic, Id
 * *하나의 클래스는 여러개의 인터페이스를 구현 가능하다.
 * class Child implements Ia, Ib, Ic
 * 
 * *****************************
 * 
 * 개발자 입장
 * 1. 인터페이스를 [다형성]입장에서 접근한다. (인터페이스는 부모타입이다)
 * 2. 서로 연관성이 없는 클래스에 대해서 하나로 묶는 기능 (부모가 동일하다)
 * 3. 인터페이스는 (able): 날수있는, 수리 할수 있는 <= 이런 측면에서 바라본다.
 * 4. 객체간의 연결고리 역할을 한다. (객체간의 소통)
 */

interface Irepairable {};

class Unit2 {
	int hitpoint; // 에너지
	final int MAX_HP;

	Unit2(int hp) {
		this.MAX_HP = hp;
	}
}

//지상 유닛
class GrondUnit extends Unit2 {
	GrondUnit(int hp) {
		super(hp);
	}
}

//공중 유닛
class AirUnit extends Unit2 {
	AirUnit(int hp) {
		super(hp);
	}
}


class Tank2 extends GrondUnit implements Irepairable {
	Tank2() {
		super(100);
		this.hitpoint = this.MAX_HP;
	}

	@Override
	public String toString() {
		return "Tank2";
	}
}

class Marine2 extends GrondUnit {
	Marine2() {
		super(50);
		this.hitpoint = this.MAX_HP;
	}

	@Override
	public String toString() {
		return "Marine2";
	}
}

class CommandCenter implements Irepairable {
	@Override
	public String toString() {
		return "CommandCenter";
	}
}

class Scv extends GrondUnit implements Irepairable {
	Scv() {
		super(60);
		this.hitpoint = this.MAX_HP;
	}

	@Override
	public String toString() {
		return "Scv";
	}

	// Scv 특수화, 구체화, 실체화
	// 수리할 수 있다.(repair)

//	void repair(Tank2 tank) {
//		if (tank.hitpoint != tank.MAX_HP) {
//			tank.hitpoint += 5;
//		}
//	}
//
//	void repair(Scv scv) {
//		if (scv.hitpoint != scv.MAX_HP) {
//			scv.hitpoint += 5;
//		}
//	}

	// scv는 unit에 개수만큼 repair를 가지고 있어야 한다.
	// unit 추가시 repair 함수 추가
	// 고민은 하나의 함수로 다른 모든 유닛을 수리 할 수 없을까?

	// 제시1: void repair(GroundUnit unit) ... Marine 은 repair대상이 아님.
	// 제시2: void repair(Irepairable repairunit)
	// ... (부모타입, 자식타입 CommandCenter, Scv, )

	// 고민: 참조변수가 접근할 수 있는 자원이 없다.

	void repair(Irepairable repairunit) {
		// 1. Tank2, Scv, CommandCenter

		// 부모타입 변수 = 자식타입 주소
		// Tv t = new t();
		// Product product = (Product)t; //casting 생략

		// Tv t2 = (Tv)product; //다운캐스팅 //명시적 캐스팅

		/*
		 * 인터페이스는 최 상위이다. 
		 * Irepairable
		 *  | 
		 *  object
		 *   | 
		 *   Unit2
		 *    | 
		 *    GroundUnit
		 *     | 
		 *     Tank2
		 */
		
		System.out.println(repairunit instanceof Unit2);
		//repairunit instanceof Unit2
		if (repairunit instanceof Unit2) {
			// downcasting
			Unit2 unit = (Unit2) repairunit;

			// unit.hitpoint
			// unit.MAX_HP
			if (unit.hitpoint != unit.MAX_HP) {
				unit.hitpoint = unit.MAX_HP;
			}
		} else {
			// CommandCenter 객체의 주소
			// void repair(Irepairable repairunit)
			System.out.println("unit 아니예요. 다른 repair입니다.");
			//필요한 코드
		}
	}
}

public class Ex03_Interface {

	public static void main(String[] args) {
		Tank2 tank = new Tank2();
		Marine2 marine = new Marine2();
		Scv scv = new  Scv();
		
		//전투
		tank.hitpoint -=20;
		System.out.println("탱크전투: "+tank.hitpoint);
		System.out.println("파손당햇어 수리해줘");
		
		scv.repair(tank);
		System.out.println("수리완료 "+tank.hitpoint);
		
		//scv.repair(marine);
		
		CommandCenter center = new CommandCenter();
		scv.repair(center);
		
	}

}
