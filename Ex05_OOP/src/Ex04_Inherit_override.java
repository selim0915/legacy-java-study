/*
 * 오버라이드
 * Today Point:[상속관계]에서의 오버라이드override (상속이 없으면 오버라이드는 없다) : 상속관계에서 메소드를 재정의 하는 방법 
 * -상속관계에서 자식클래스가 부모클래스의 메소드를 재정의
 * 
 * 재정의? 란?
 * 함수의 (파라미터와 리턴)형태는 변화없이 내용만 바뀌는것.. => 형태가 바뀌면 오버로딩..
 * 			: 틀의 변화가 아니라 내용의 변화{함수의 실행블록 내용이 바뀌는 것}
 * 
 * 재정의 하는방법?
 * 문법) 상속관계에서만!
 * 1. 부모함수의 이름과 동일해야 한다.
 * 2. 부모함수의 파라미터가 동일 해야 한다.
 * 3. 부모함수의 리턴 타입이 동일 해야 한다.
 * 4. 결국에는 {} 실행블록 안에 내용만 바뀌는 것.
 * 
 */

class Point2{
	int x=4;
	int y=5;
	String getPosition() {
		return "x:"+this.x+" y: "+this.y;
	}
}

//세개의 점이 필요하지만 두개는 Point2를 통해 가져와야지..!
class Point3D extends Point2{
	int z=6;

//	@Override
//	String getPosition() {
//		return super.getPosition(); //안에 내용 바꾸기
//	}
	//또 하나의 이름을 가진 함수를 만들고 싶지 않아..!
	//부모가 가지고 있는 함수를 쓸랭 => 오버라이드
	//재정의를 강제하는 방법 !! => override (어노테이션)
	//Annotation (추상화가 있다): 자바에서 자바코드만으로 전달 할 수 없는 부가적인 정보를 [컴파일러], [개발 툴]에게 알려주는 방법(기능)
	
	//@Override
	@Override
	String getPosition() {
		return "x:"+this.x+" y: "+this.y+" z: "+this.z;
	}
	
}

public class Ex04_Inherit_override {

	public static void main(String[] args) {
		Point3D point = new Point3D();
		point.x=3;
		point.y=6;
		point.z=9;
		System.out.println(point.getPosition());
	}

}
