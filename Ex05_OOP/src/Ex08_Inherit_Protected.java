import kr.or.bit.Pclass;

//접근자(제앚) : default, private, public 상속관계에서 Protected까지..
//상속관계에만 존재
//양면성: default, public(상속관계에서) 두가지로 존재한다.

//상속관계에서 Protected
//상속이 들어가지 않는 코드에선 의미없다 (아래와 같다)
//지금 말하는 상속이란.. 상속받은 클래스 안..!

//과연 이 상속안에서만 되는접근자는 왜 만들었을까???????
//why? class Car{Protected void turn() }
//=> 나를 상속하는 당신이 자원을 재정의 했으면 좋겠는데... 안해도 되고..(의도)
class Child2 extends Pclass{
	void method(){
		this.p = 1000; //상속 관계에서 protected는 public이되고..
		 System.out.println(this.p);
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		// TODO Auto-generated method stub
		return super.clone();
	}
	
}

public class Ex08_Inherit_Protected {

	public static void main(String[] args) {
		Pclass pc = new Pclass();
		System.out.println("public: "+pc.j);
		
		//다른 폴더 에서는 public만 노출이 되더라..
		//default, peotected 안보임..
		
		Child2 ch = new Child2();
		ch.method();
	}

}
