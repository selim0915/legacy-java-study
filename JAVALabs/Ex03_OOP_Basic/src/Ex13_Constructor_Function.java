import kr.or.bit.Boat;
import kr.or.bit.Book;
import kr.or.bit.Movie;

/*
 * 초기화 != 디폴트
 * int[] arr = new int[5]
 * 초기화: 최초의 값 할당 ex: arr[0]=100;
 *    : member field의 초기화를 한다.
 *    1. 특수한 목적을 가지는 함수(초기화)
 *  2. 초기화(instance variable:member field)를 초기화
 *  
 *  -일반함수와 다른점
 *=> 함수에 이름이 고정 되어 있다. (클래스 이름과 똑같아야 한다.) 
 * 생성자 함수(함수란: 파라미터가 있는거) => constructor: 초기화함수
 * => 생성자함수는 return type(x), void(x)도 없다. : 생성자의 default는 void
 * 	why: 객체가 만들어 짐과 동시에 실행되는 문장 ( 생성시점과 연관이 있다.) 그래서 값을 리턴(넘길) 곳이 없어서 리턴값은 생략된다.
 * 
 * 목적: 생성되는 객체마다 다른 초기값을 얻고 싶을 때
 * 
 * 생성자 함수(하나의 이름으로 여러가지 기능을 만들수 있다. 얘도 함수라 오버로딩이 가능하다)
 * 생성자 오버로딩: param의 갯수와 타입
 * 시점: Car c = new Car("color"); //파라미터1개를 받을 수 있는 생성자가 있으면 된다.
 * 1. stack에 c라는 변수 생성 default: null
 * 2. new를 만나 heap에 Car타입의 객체 생성 >영역을 만든뒤 memberfield를 올린다. >생성자함수 호출(로딩된 멤버필드를 초기화 한다.)
 * 3. class 생성시 default생성자는 생략 가능. (내가 직접 설계하지 않아도 컴파일러가 알아서 생성 해 준다.)
 * 
 * tip: 생성자 함수가 오버로딩을 하지 않으면 쓸일이 줄어든다.
 */

class Car{
	String name;
	//내가 구현하지 않아도 컴파일러는 생성자가 있다고 가정한다.
	//Car() {}
	//위에 문장이 default로 읽혀진다.
}

class Car2{
	String name;
	Car2(){ //default constructor
		System.out.println("나는 디폴드 생성자 함수");
		System.out.println("brfore: "+name);
		name = "pony";
		System.out.println("after: "+name);
	}
}

class Car3{
	int number;
	//권장사항: 코드상에서  default생정자는 일반적으로 생략,
	Car3(){
		
	}
}

class Car4{
	int door;
	int wheel;
	
	Car4(){
		//default
		System.out.println("car4: default");
	}
	
	Car4(int num){
		//overLoading
		door = num;
		System.out.println("overloding door: "+door);
	}
	
	Car4(int num, int num2){
		//overLoging
		door = num;
		wheel = num2;
		System.out.println("overloding door: "+door+"/"+wheel);
	}
	
	//오버로딩 생성자 함수를 작성했다면, default생성자는 직접 작성하여야 한다.
	//그러면 new Car(); 이렇게 생성을 못한다.
	// 반드시 값이 들어가게 생성하게 된다. (강제적을 띄게 된다)
}

class Apt{
	String color;
	
	Apt(String color){
		this.color = color;
	}
}
//1.클래스 생성시 오버로딩 생성자가 하나라도 존재한다면, default 생성자는 자동 생성되지 않는다.(
//(컴파일러)가 자동으로 만들지 않는다.
//why: 설계도에 강제성를 부여하기 위함,(내가 한대로만 표현 할수 있게),
//     => 즉: 무조건 오버로딩 사용되게 하겠다.

class Apt2{
	String color;
	
	Apt2(){
		//강제성이 없다.
	}
	
	Apt2(String color){
		this.color = color;
	}
}

// 1. class생성 시 생성자 함수 구현하지 않으면... (default 생성자 자동생성) 
//     ex: class Tv {String name;}
// 2. class생성 시 오버로딩 생성자 함수를 하나라도 구현... 
//     ex: class Tv {String name; Tv(String n){name=nl} }
// 3. class 생성 시 default, 오버로딩 생성자 함수 둘다 구현... (별로 좋은 상태는 아님)
//       필요에 따라서 골라쓸 수 있다.
//     ex: class Tv {String name; Tv(){} Tv(String n){name=nl} }
public class Ex13_Constructor_Function {

	public static void main(String[] args) {
		Car c = new Car();
		Car2 c2 = new Car2();
		Car3 c3 = new Car3();
		Car4 c4 = new Car4(); //default호출해서 객체 생성
		Car4 c5 = new Car4(200); //param 1개 호출해서 객체 생성
		Car4 c6 = new Car4(200,40); //param 2개 호출해서 객체 생성
		
		Apt apt = new Apt("blue");
		Apt2 apt2 = new Apt2();
		
		Book b = new Book("어린왕자",1200);
		b.bookprint();
		System.out.println("이름:"+b.getName() +" ,가격"+ b.getPrice());
		
		Book b2 = new Book("심청전",800);
		b2.bookprint();
		System.out.println("이름:"+b2.getName() + " ,가격"+ b2.getPrice());
		
		
		Movie m = new Movie("겨울왕국", "애니", "엘사", "디즈니", "2018-09-15");
		m.movieInfo();
		
		
		Boat b3 = new Boat("멋진 배",2,200,180000,2);
		System.out.println(b3.getName());
		System.out.println(b3.getDoor());
		System.out.println(b3.getMaxp());
		System.out.println(b3.getPrice());
		System.out.println(b3.getTon());
		
		
		
		
		
	}
}
