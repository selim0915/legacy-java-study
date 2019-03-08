import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

//set 인터페이스를 구현하고 있는 클래스
// set: 순서가 없는 집합, 중복데이터도 허용하지 않음 => 순서x 중복x 데이터의 집합을 다룰 때
// set을 부모로 두고있는 대표 클래스: hashSet, TreeSet
// 순서를 보장하지 않아요. (넣은 순서를 보장하지않는다)

public class Ex10_Set_Interface {

	public static void main(String[] args) {
		HashSet<Integer> hs =new HashSet<Integer>();
		hs.add(1);
		hs.add(100);
		hs.add(55);
		System.out.println(hs.toString());
		
		//1.검증
		// 중복데이터는 들어가지 않는다.
		boolean bo = hs.add(1);
		System.out.println(bo); //false : 들어가지 않았다.
		// 기존에 같은 데이터가 들어가 있으면 추가x
		System.out.println(hs.toString());
 		hs.add(2);
 		System.out.println(hs.toString());
 		
 		HashSet<String> hs2 = new HashSet<String>();
 		hs2.add("b");
 		hs2.add("A");
 		hs2.add("F");
 		hs2.add("c");
 		hs2.add("z");
 		System.out.println(hs2.toString());
 		
 		
 		//1. 중복데이터를 허락하지 않아요 (일상 생활 속에서 사용하는 상황?)
 		String[] obj = {"A","B","A","C","D","B","A"};
 		HashSet<String> hs3 = new HashSet<String>();
 		for(int i=0; i<obj.length; i++) {
 			hs3.add(obj[i]);
 		}
 		System.out.println(hs3.toString());
 		
 		
 		//Quiz
 		//HashSet을 사용해서 1~45까지 난수6개를 넣으세요.
 		HashSet<Integer> hs4 = new HashSet<Integer>();
 		for(int i=0; hs4.size()<6; i++) {
 			hs4.add((int)(Math.random()*45)+1);
 		}
 		System.out.println(hs4.toString());
 		
 		
 		Set set = new HashSet();// 다형성 부모타입으로 받았다..!
 		//System.out.println(set.size());
 		for(int i=0; set.size()<6; i++) { //무턱대고 6번을 돌리는것이 아니라.. set.size() 값이 들어있는 만큼횟수만 돌게
 			int num = (int)(Math.random()*45)+1;
 			set.add(num);
 		}
 		System.out.println(set.toString());
 		
 		
 		//while
 		Set set2 = new HashSet();
 		int i =0;
 		while(set2.size()<6) {
 			System.out.println("index: "+ (++i));
 			set2.add((int)(Math.random()*45)+1);
 		}
 		System.out.println(set2.toString());
 		
 		
 		HashSet<String> set3 = new HashSet<String>();
 		set3.add("AA");
 		set3.add("DD");
 		set3.add("ABC");
 		set3.add("FFFF");
 		System.out.println(set3.toString());
 		
 		
 		Iterator<String> s = set3.iterator();
 		while(s.hasNext()) {
 			System.out.println(s.next()); //순서를 보장하지 않는다. 배열만 순서가 보장된다.
 		}
 		
 		
 		//Collections.sort(List<T> list); List인터페이스를 구현하는 모든 객체 parameter로..
 		//set인터페이스를 구현하는 hashset를 가지고 놀다가 .. 데이터 정렬이 하고싶어졌다..
 		//hashSet은 sort라는 것을 지원하지 않는다. (순서가 없는 친구라..)
 		List list = new ArrayList(set3);
 		System.out.println("before : 무작위 >> "+ list.toString());
 		Collections.sort(list);
 		System.out.println("after : 정렬 >> "+ list.toString());
 		//set도 list를 활용하면 정렬을 시킨다. 부모인 collection을 이용하여 섞어 사용하면 좋다.
 		
 		HashSet<Integer> hs5 = new HashSet<>();
 		hs5.add(1);
 		hs5.add(5);
 		hs5.add(100);
 		System.out.println(hs5.toString());
 		
 		List list2 = new ArrayList(hs5);
 		System.out.println("before : 무작위 >> "+ list2.toString());
 		Collections.sort(list2);
 		System.out.println("after : 정렬 >> "+ list2.toString());
 		
 		
 		
	}

}
