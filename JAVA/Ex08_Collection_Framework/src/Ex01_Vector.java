import java.util.Vector;

/*
 Collection FrameWork
 : 다수의 데이터를 다루는 [표준화]된 [인터페이스]를 [구현]하는 클래스 집합
 
  				Collection
  					|
  List(상속)		Set(상속)			Map(인터페이스)
  |				|				|
  Vector	 	HashSet			[HashMap]------		
  [ArrayList] 	TreeSet
 
 
 List interface 
 : 순서가 있고, 중복이 허용  >> 내부적으로 배열로 데이터 관리 Array[0][1][2]...
 
 1. vector(구버전) => 동기화(멀티쓰레드) => Lock보장(default) => 데이터보호 중점
 2. ArrayList(신버전) => 동기화(멀티쓰레드가) => Lock이 보장되지 않음 => 필요에 따라 사용 할 수 있게 만듬 (유연) => 성능강조
 ex) 동기화
 한강 고수부지 화장실 하나 (100명이 동시에 가면 안돼!) >> lock 안전하게
 한강 고수부지 비빔밥 축제 (100인분 동시에 참여!) >> 성능이 좋다.
 
 Array(배열) : 정적배열(크기가 고정 되어 있다.)
 int[] arr = new int[10]; //방을 10개 만든 것
 int[] arr = {10, 20, 30}; //방을 3개 만든 것
 
 Array(고정배열)
 1. 배열의 크기가 고정 : Car[] cars ={new Car(), new Car()}; //방두개
 2. 배열의 접근:  index(첨자) : cars[0], cars[0].color
 3. 초기 설정한 크기 변경 불가
 
 
 List 인터페이스를 구현 하고있는 클래스들 : Vector, ArrayList : 동적배열
 1. 배열의 크기를 동적으로 확장,축소 할 수 있다. => 배열의 재 할당(직접 코딩하지 않고)
 2. 순서를 유지(index), 중복값 허용
 3. 데이터 저장 공간(Array 사용)
 4. List 인터페이스를 구현한 클래스(new를 통해 객체 생성 사용)
 5. 구현클래스(ArrayList)가 가지는 데이터 타입: 방의 타입 : Object[] arr = new Object[]
 		장점: 모든 타입의 부모 타입(int, Car, String)모든 자료를 다 삽입할 수 있다.
 		단점: 꺼내서 다시 넣을 땐, Object를 다운 캐스팅해야한다.
 			단점을 극복 하는 방법 : 제너릭(타입 강제)
 
 */
public class Ex01_Vector {

	public static void main(String[] args) {
		Vector v = new Vector();
		System.out.println("초기 default 용량: " + v.capacity()); //capacity()방의 크기
		
		v.add("AA"); //[0]
		v.add("BB"); //[1]
		v.add("AA"); //[2]
		v.add(100); //[3]
		System.out.println(v); //주소값이 안나오고..  [AA, BB, AA, 100]
		System.out.println(v.toString()); //Vector가 toString를 재정의해서 생략해도 사용 할 수 있게 하였다.
		
		
		Vector vv = new Vector();
		System.out.println("연습: " +vv.capacity());
		vv.add("AA");
		vv.add("BB");
		System.out.println(vv);
		
		
		//Array >> length() >> Car[index]
		for(int i=0; i<v.size(); i++) { //size() 값이 채워져 있는 만큼만 돌것이다...
			//System.out.println(v); //4번 돔
			System.out.println(v.get(i)); //get(i) : 방을 찾아 출력하는 방법
		}
		
		for(int i=0; i<vv.size(); i++) {
			System.out.println("연습: " +vv.get(i));
		}
		
		for(Object obj : vv) {
			System.out.println("연습: " +obj);
		}
		
		for(Object obj : v) { //타입을 Object로 잡아둔다.
			System.out.println(obj);
		} //단점: Object 가장 큰 타입을 가져와서 add(), get()으로 넣고 꺼내는것..?
		
		
		Vector<String> v2 = new Vector<String>(); //String 타입에 vector타입이 만들어 지는것.
		v2.add("Hello");
		v2.add("world");
		for(String str : v2) {
			System.out.println(str);
		}
		
		Vector<String> vv2 = new Vector<String>();
		vv2.add("1");
		vv2.add("22");
		for(String str : vv2) {
			System.out.println("연2222습: " +vv2);
		}
		
		System.out.println(v2.toString()); //[Hello, world] //출력
		System.out.println(v2.get(1)); //world //특정출력
		System.out.println("size: "+ v2.size()); //size: 2 //값 크기
		System.out.println("Capaity: "+v2.capacity());//Capaity: 10 //배열크기
		
		
		System.out.println("연습: " +vv2.capacity());
		
		
		Vector v3 = new Vector();
		System.out.println(v3.capacity()); //10
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		v3.add("A");
		System.out.println("v3 size: " + v3.size());
		System.out.println("v3.capacity: " + v3.capacity()); //20 2배수로 만든다.
//		for(int i=0; i <v.length; i++) {
//			System.out.println(v[i]);
//		} //이거 안됨
		
		
		
		
		
		
		
		
		
		
		
	}

}
