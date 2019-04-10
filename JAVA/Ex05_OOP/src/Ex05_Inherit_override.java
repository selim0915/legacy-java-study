import java.util.Arrays;

import kr.or.bit.Emp;

class Test{
	void print() {
		System.out.println("부모함수 _Test");
	}
}

class Test2 extends Test{

	@Override
	void print() {
		System.out.println("자식함수_test2_개발자 마음대로");
	}
	
	void print(String s) {
		System.out.println("오버로딩!!"+s);
	}
	
}
public class Ex05_Inherit_override {

	public static void main(String[] args) {
		Test2 test = new Test2();
		test.print(); //재정의
		test.print("오버로디디딩");
		
		System.out.println(test); //default로 toString 가지고 있다.
		System.out.println(test.toString());
		
		//Emp 클래스에서 Object 가지는 toString() 재정의
		Emp e = new Emp(9999,"아무개");
		String str = e.toString();
		System.out.println(str);
		
		
		//이 녀석도 object의 toString이 재정의 해서 가지고 있엇구나!
		int[] arr = {11,12,13,14,15};
		String result = Arrays.toString(arr);
		System.out.println(result);
	}

}
