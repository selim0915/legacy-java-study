import java.util.Arrays;

//배열을 만들 수 있는 타입은
//8가지 기본타입+ String+ 사용자정의클래스

class Person{
	String name;
	int age;
}

public class Ex04_Object_Array {

	public static void main(String[] args) {
		int[] intarr = new int[10];
		boolean[] booarr = new boolean[5];
		System.out.println(Arrays.toString(booarr));
		
		Person[] objarr = new Person[3];
		System.out.println(Arrays.toString(objarr));
		//참조타입 배열은 방을 만들고 각각 방에 객체를 널어주는 작업이 필요하다.
		
		objarr[0] = new Person(); //주소값을 생성해 주는 중
		objarr[1] = new Person();
		objarr[2] = new Person();
		System.out.println(Arrays.toString(objarr));
		
		//객체배열은 두번 작업해야한다.
		// 1. 방만들기 (방만 만듬 값은null)
		// 2. 객체주소 넣기
		
		objarr[0].name = "홍길동";
		objarr[0].age =100;
		System.out.println(objarr[0].name + objarr[0].age);
		
		System.out.println("배열: "+objarr);
		for(int i=0; i<objarr.length; i++) {
			System.out.println(objarr[i].name+"/"+objarr[i].age);
		}
		
		//1. int[] arr = new int[5];
		Person[] parray = new Person[5];
		for(int i=0; i<parray.length; i++) {
			parray[i] = new Person();
			System.out.println("주소값: "+parray[i]);
		}
		
		// 2. int[] arr = new int[] {10,20,30};
		Person[] array2 = new Person[] {new Person(),new Person(),new Person()};
		
		//3. int[] arr = {10,20,30};
		Person[] array3 = {new Person(),new Person(),new Person()};
		
		
		
		
	}

}
