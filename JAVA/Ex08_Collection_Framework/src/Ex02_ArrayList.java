import java.util.List;
import java.util.Vector;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;

public class Ex02_ArrayList {

	public static void main(String[] args) {
		ArrayList arraylist = new ArrayList();
		arraylist.add(100);
		arraylist.add(200);
		arraylist.add(300);
		
		ArrayList arr = new ArrayList();
		arr.add("a");
		arr.add(1);
		arr.add(22);
		System.out.println("연습: " +arr);
		
		System.out.println(arraylist.toString()); //[100, 200, 300]
		//arrayList 클래스도 toString()를 재정의 했다.
		
		for(int i=0; i<arraylist.size(); i++) {
			System.out.println(arraylist.get(i));
		}
		
		for(int i=0; i<arr.size(); i++) {
			System.out.println("연습: " +arr.get(i));
		}
		
		System.out.println("현재:[0] "+ arraylist.get(0));
		System.out.println("연습: " +arr.get(0));
		//add 데이터 추가하는 함수 (기본적인 추가 순차적으로)
		
		//비순차적으로 데이터를 추가하거나 삭제하는 방법
		//추가
		arraylist.add(0,1111); //0번째 방에 1111추가
		System.out.println("add: " + arraylist.toString()); //0번쨰 방에 만들고 원래 값들은 밀려남
		//데이터 삽입 add defualt(맨뒤 순차)
		//데이터 삽입 add 중간에 추가 삭제.. 할수 있다.
		//ArrayList 중간에 데이터를 추가하거나, 삭제하는 작업은 성능에 좋지않다.
		//순차적인 데이터 추가, 삭제는 좋음..!
		
		
		arr.add("1234");
		arr.add("가나나");
		arr.add(123455);
		System.out.println("연습: " +arr);
		arr.remove(0);
		System.out.println("연습: " +arr);
		System.out.println("연습: " + arr.size());
		
		arraylist.remove(2);
		System.out.println("remove: " + arraylist.toString());
		System.out.println("size: "+arraylist.size());

		
		
		//ArrayList 함수
		System.out.println(arraylist.contains(200)); // 값있니? //false
		System.out.println(arraylist.contains(1111)); //true
		
		System.out.println(arraylist.isEmpty()); //빈 값이야? //false
		
		arraylist.clear(); //배열 삭제 (값을 삭제, 크기는 존재)
		System.out.println(arraylist.isEmpty()); //true
		//isEmpty 는 사이즈를 말한다.. 값이 들어있나 안들어있나..
		
		
		System.out.println("연습: " +arr.contains("가나나"));
		System.out.println("연습: " +arr.isEmpty());
		arr.clear();
		System.out.println("연습: " +arr.isEmpty());
		
		//순차적으로 값 추가
		arraylist.add(101);
		arraylist.add(102);
		arraylist.add(103);
		System.out.println("remove: " + arraylist.toString());
		
		Object value = arraylist.remove(0); //지우는 값을 보관 할 수도 있다.
		System.out.println("value: "+value); //value: 101
		System.out.println("remove: " + arraylist.toString());
		
		
		arr.add("1");
		arr.add("3");
		arr.add("3");
		arr.add("4");
		System.out.println("arr연습: " +arr);
		//System.out.println(arr.remove(1));
		Object num = arr.remove(3);
		System.out.println("연습::::"+ num);
		
		ArrayList list = new ArrayList();
		list.add("가");
		list.add("나");
		list.add("다");
		list.add("가"); //중복데이터가 가능
		System.out.println("ArrayList: "+ list.toString()); //넣은 순서대로 유지가 된다.
		
		list.remove("가"); //값으로 적을 수도 있다.
		System.out.println("ArrayList remove: "+ list.toString());//값은 앞에서 부터 지운다.
		
		
		//**Point
		List li = new ArrayList(); //List가 인터페이스(부모)
		li.add(1); // list는 다 추상클래스인데.. li가 사용하게 된 이유는 오버로딩이 되어있어서..
		//li = new Vector(); //이것도 가능
		
		li.add("가");
		li.add("나");
		li.add("다");
		li.add("가");
		System.out.println(li.toString());
		
		List li2 = new ArrayList();
		li2.add(1);
		li2.add("가");
		li2.add("나");
		li2.add("다");
		li2.add("라");
		System.out.println("li2: "+li2);
		
		num =li2.subList(1, 2);
		System.out.println(num);
		
		List li4 = li.subList(0, 2); //뒤에는 exclusive 까지 (같은 값은 포함하지 않는다)
		System.out.println(li4);
		
		ArrayList alist = new ArrayList();
		alist.add(50);
		alist.add(1);
		alist.add(7);
		alist.add(40);
		alist.add(7);
		alist.add(15);
		System.out.println("before: "+alist.toString()); //before: [50, 1, 7, 40, 7, 15] 데이터가 순차적으로 들어간 것 확인
		
		Collections.sort(alist); //오름차순 정렬
		System.out.println("after: " +alist.toString());//after: [1, 7, 7, 15, 40, 50] 오름차순
		
		
		
		
		
		
	}

}


