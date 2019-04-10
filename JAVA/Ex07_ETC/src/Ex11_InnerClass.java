

//Inner Class 
//클래스안에 클래스가 있다.

//Inner Class개념
//AWT, SWING, ANDROID(event) 처리 : 버튼클릭, 마우스오버 ...

class OuterClass{
	public int pdata=10;
	public int data=20;
	
	//Innerclass 사용이유:
	//1. 자원에 접근을 편하게 하기 위해서
	//2. member field가 선언되는 곳에 
	//3. 장점: ***outer클래스가 가지고 있는 모든 자원에 접근이 용이하다.
	
	class InnerClass{
		void msg() {
			System.out.println("outerclass data : "+data);
			System.out.println("outerclass data : "+ pdata);
		}
	}
}

public class Ex11_InnerClass {

	public static void main(String[] args) {
		OuterClass outobj = new OuterClass();
		System.out.println(outobj); //OuterClass@15db9742
		
		System.out.println("outobj.pdata: " +outobj.pdata);
		
		OuterClass.InnerClass innerobj = outobj.new InnerClass();
		//아웃.이너 객체이름 = 아웃변수.이너 객체생성
		innerobj.msg();
		
		//1. 아웃터객체만들기
		//2. 아웃객체.new 이너클래스
		
		
		
				
	}

}
