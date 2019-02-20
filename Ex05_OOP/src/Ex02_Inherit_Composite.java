/*
 * 현실세계에도.. 설계도 가 여러장이다..  
 * 각각 설계도에는 연관성을 가지고 있다..!
 * 
 * -여러개의 설계도 작성 시..
 * 각각의 설계도는 관련이 있어야 한다. 관련성 기준은?
 * 기준점:
 * 1. 상속관계 (is ~a) 무엇은 무엇이다. 라고 풀리면 상속이다. (부모가 뒤쪽) ex:원은 도형이다ooo
 * 2. 포함관계(has ~a) 무엇은 무엇을 가지고 있다. 라고 풀리면 포함이다. 상속아님xx ex:원은 도형을 가지고 있다.xxx
 * class A{
 *  B b;
 * }
 * 
 * ------------------
 * 
 * 원 틀래스, 도형 클래스
 * >>상속 관계입니다. (판정나면 원 extends 도형)
 * 원은 점이다.(is a)
 * 점의 정의(x,y)를 가지고 있는것.
 * 원은 점을 가지고 있다.(has a)
 * class원{
 *           점 변수명;
 * }
 * 
 * 경찰, 총
 * 경찰은 총 이다(is a)xxx
 * 경찰은 총을 가지고 있다(has a)oo
 * class 경찰{  } , class 총 { } 
 * class 경찰{
 * 	총 gun;
 * }
 * 
 * -------------------
 * 
 * 예를 들면
 * 원, 사각형, 삼각형을 만들고 싶다.
 * 
 * 원: 한 점, 반지름을 연결한거, 그리다, 생상
 * 삼각형: 세개의 점, 그리다, 생상
 * 사각형: 네개의 점, 그리다, 생상
 * 점 정의: x축과 y축을 가진 것.
 * 
 * 원은 도형이다.
 * 삼각형은 도형이다
 * 가각형은 도형이다.
 * 도형 정의: 일반화 된 도형을 구체적으로 해보자 >> 분모: 색상, 그리다.
 * 
 * 원:(구체화, 특수화 된 자원) : 구체화된 자원은 특수한 점을 찾는다 >>  점과 반지름을 가진 구체적인 특징이있는 자원,,
 * 
 * 점 정의(x,y)
 * 원은 점이다.(x)
 * 삼각형은 점이다.(x)
 * 원은 점을 가지고 있다.(o)
 * 삼각형은 점을 가지고 있다.(O)
 * 사각형은 점을 가지고 있다.(O) >>포함관계
 * 
 * 
 * 일반화, 추상화된 자원은: 공통분모를 찾는다:  shape(색상, 그리다)
 * 							: point(x, y)
 * class Shape{
 * 
 *}
 *class Point{
 *
 *}
 *구체화 특수화(circle, triangle) 만들어 보자!
 */

// 추상화, 일반화
class Shape{
	String color="gold";
	void draw() {
		System.out.println("도형을 그리다.");
	}
}

class Point{
	int x;
	int y;
	
	Point(){
		//생성자
		//this.x =1;
		//this.y =2;
		this(1, 2);
	}
	
	Point(int x, int y){
		//생성자 오버로딩
		this.x =x;
		this.y =y;
	}
}

//원을 만드세요.
//원의 정의(한점, 반지름을 가지고 있다.)
//원은 도형이다(is a) extands
//원은 점을 가지고 있다. (has a) 참조변수
//원의 특수성과 구체성: 반지름

class Circle extends Shape{
	Point center; //member filed (부품) has ~a
	int r; //member filed (특수성, 구체화)
	
	public Circle() {
		this.center = new Point(5, 8);
		this.r =10;
	}
	
	public Circle(Point center, int r) {
		this.center =center;
		this.r =r;
	}
}

//문제1)
//삼각형 클래스를 만드세요.
//정의 삼각형은 3개의 점, 색상, 그리다 기능을 가지고 있다.
//shape, point활용 작업
//3개의 점(x,y) (x,y) (x,y)
//default 삼각형을 그릴수 있고, 3개의 좌표값을 받을 수도 있다.

class triangle extends Shape {
	Point x; //참조타입(초기화)
	Point y;
	Point z;
	
	public triangle() {
//		this.x = new Point(10,20);
//		this.y = new Point(30,40);
//		this.z = new Point(50,60);
		this(new Point(10,20), new Point(30,40), new Point(50,60));
	}
	
	public triangle(Point x, Point y, Point z) {
		this.x = x; //한 점의 주소값(Point)
		this.y = y;
		this.z = z;
	}
	
	public void trianglePoint() {
		System.out.printf("x: (%d, %d)\n",x.x,x.y);
		System.out.printf("y: (%d, %d)\n",y.x,y.y);
		System.out.printf("z: (%d, %d)\n",z.x,z.y);
	}
}

class triangle2 extends Shape {
	Point[] pointarray; //참조타입(초기화)
	
	public triangle2() {
		//Point[] parray = new Point[] {new Point(1,2)...}
		this(new Point[] {new Point(1,2),new Point(3,4),new Point(5,6)});//주소값 할당에 값 대입
	}
	
	public triangle2(Point[] pointarray) {
		this.pointarray = pointarray;
	}
	
	public void triangle2Point() {
		for(Point point : pointarray) {
			System.out.println("좌표:" +point.x +"/"+point.y);
		}
	}
}

public class Ex02_Inherit_Composite {

	public static void main(String[] args) {
		
		Circle c =new Circle();
		c.draw();
		System.out.println(c.color);
		System.out.println(c.r);
		System.out.println(c.center.x);
		System.out.println(c.center.y);
		
		Point point = new Point(10,15);
		Circle c2 = new Circle(point,20);
		System.out.println(c2.color);
		System.out.println(c2.r);
		System.out.println(c2.center.x);
		System.out.println(c2.center.y);
		
		triangle t = new triangle();
		t.draw();
		System.out.println(t.color);
		t.trianglePoint();
		triangle t2 = new triangle(new Point(1,2), new Point(3,4), new Point(5,6));
		t2.trianglePoint();
		
		triangle2 t3 = new triangle2();
		t3.triangle2Point();
		
		//Point[] point2 = new Point[3];
		Point[] point2 = {new Point(9,9),new Point(8,8),new Point(7,7)};
		triangle2 t4 = new triangle2(point2);
		t4.triangle2Point();
	}

}




