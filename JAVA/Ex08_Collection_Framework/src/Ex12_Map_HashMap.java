import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/*
 
 Map 인터페이스를 구현하는 클래스
 Map > [키(key), 값(vlaue)] => 쌍배열
 ex) 지역번호: (02, 서울)..
 key값은 중복 허용하지 않음, value값은 중복 허용.
 
 Map >> Generic지원 (타입강제)
 
 HashTable(구버전) : 동기화 보장(강제)
 HashMap(신버전) : 필요시 동기화 
 
 
 */

public class Ex12_Map_HashMap {

	public static void main(String[] args) {
		HashMap map = new HashMap();
		map.put("Tiger", "1004");
		map.put("scott", "1004");
		map.put("superman", "1007");
			
		//활용: 회원ID, 회원PWD (memory에 담는다)
		//메모리(heap) >> 종료 보전 (파일기반) login.txt 관리문제가 생긴다. //RDBMS(관계형 데이터베이스)
		System.out.println(map.containsKey("Tiger")); //key값이 맵안에 있냐없냐 확인    //대소문자 구분\
		System.out.println(map.containsKey("scott"));
		System.out.println(map.containsValue("1004")); //갯수 상관없이 하나라도 포함하고 있으면 true
		
		//(key, value)
		//point : key값을 가지고 value값을 찾을 수 있다.
		System.out.println(map.get("Tiger")); //get : 키를 가지고 value값 찾기 //키입력.. 
		System.out.println(map.get("hong")); //객체는 값이 없다는 표현을 null이라고 한다.
		
		
		//put : 담다
		map.put("Tiger", 1008); //키가 같은 값이면 value를 덮어씌어버린다(오버라이트 overwrite)
		System.out.println(map.get("Tiger"));
		
		//size
		System.out.println("before: "+map.size());
		Object returnvalue = map.remove("superman");
		System.out.println(returnvalue); //필요하다면 써.. (출력은 보여드림,,?) > 위 구문이 삭제전 값에 담고 지워져서 변수로 사용됨
		//size
		System.out.println("after: "+map.size());
		
		
		Set set = map.keySet();
		//HashSet set2 = (HashSet) map.keySet(); //다운캐스팅 해야함.. 위에가 낫다0ㄹ
		//keySet(): Set인터페이스를 구현하는 객체(HashSet)를 내부적으로 new하고 거기에다가 key값을 담고 주소값을 리턴하는 것 ..> 다형성을 적용한다.
		Iterator it = set.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		
		
		//Quiz Map에서 value값들을 모아서 출력하세요.
		//map.values()..
		Collection vlist = map.values();
		System.out.println(vlist.toString());
		
		
	}

}
