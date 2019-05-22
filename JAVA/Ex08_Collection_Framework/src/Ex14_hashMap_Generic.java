import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

//Today Point
//HashMap<k,v>
//HashMap<String ,String>
//HashMap<Integer, String>
//HashMap<String, Emp> Point >> value객체가 올수있다.. 

//Io, Network, Thread >> ArrayList<Emp>, HashMap<String, Emp> 코드 활용


class Student{
	int kor = 100;
	int math=80;
	int eng=20;
	String name;
	
	Student(String name){
		this.name = name;
	}
}

public class Ex14_hashMap_Generic {

	public static void main(String[] args) {
		HashMap<String, Student> student = new HashMap<String, Student>();
		student.put("hong", new Student("홍길동")); //키값의 짝, value를 기억..?
		student.put("kim", new Student("김유신"));
		
		Student hongstd = student.get("hong");
		System.out.println(hongstd.name);
		System.out.println(hongstd.kor);
		System.out.println(hongstd.math);
		System.out.println(hongstd.eng);
		System.out.println(hongstd.toString());
		
		
		//예외적으로
		//Map은 기본적으로 key가지고 value값 얻기
		//예외적으로 (key, value)모두 출력하고 싶을 때
		Set set = student.entrySet();
		Iterator it = set.iterator(); //set은 Iterator 할수있느까
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		//hong=Student@15db9742
		//kim=Student@6d06d69c
		//.entrySet() : key + "=" + value 를 하나의 문자열로 만들어서 보여준다.
		
		//예외적인 CASE
		//vlaue가 (Object)일때
		//Map.Entry 타입을 통해서 getKey(), getValue()각각의 정보를 출력 가능
		for(Map.Entry m : student.entrySet()) {
			System.out.println(m.getKey()+"/"+ ((Student)m.getValue()).name + "/"
					+ ((Student)m.getValue()).kor); //getValue(): 주소값
			//자기 타입으로 다운 캐스팅하면.. 자기 객체를 불러올 수 있다. 그렇게 낱개로 출력한다.
		}
		
		
		
		
		
		
		
	}

}
