import java.lang.reflect.Array;
import java.util.Arrays;

/*
 * 배열은 객체이다 (heap)메모리에 저장
 * new라는 연산자를 통해 만들어진다.
 */
public class Ex01_Array_Basic {

	public static void main(String[] args) {
		
		int[] score = new int[3];
		System.out.println("score변수 (참조): " +score[0]);
		System.out.println("score변수 (참조): " +score[2]);
		
		score[1] =333;
		//Array 각각의 방을 가지고 있다.
		//각 방의 크기는 4byte이다. (int=4byte)
		//각각의 방에 대한 접근은 첨자로 한다: 첨자 or 인덱스
		//배열의 시작 값은 0부터 시작한다.
		//score[0], score[1], score[2]
		//배열의 갯수=length: 3개
		//배열의 마지막 첨자값은: length-1
		//배열은 타입의 default값을 가진다. 각각 타입의 정수면0, 실수면 0.0, 문자면null 그런것
		
		// *배열관련 오류
		//score[3] =500; //java.lang.ArrayIndexOutOfBoundsException: 3
		//길이가 맞지 않습니다.
		
		// 예외처리를 안하면?
		// 예외상황 발생> 프로그램 강제종료
		// 그래서 try, catch로 오류를 잡아야 한다.
		
		// array와 잘 맞는 제어문은?
		// for
		for(int i=0; i<score.length; i++) {
			System.out.printf("score[%d]=%d\t", i,score[i]);
		}
		
		System.out.println();
		
		//배열을 사용하다 보면 사용 시 도와주는 보조 클래스들이 있다.(helper클래스)
		String result = Arrays.toString(score); //[0, 333, 0]이렇게 리턴해준다.
		System.out.println(result);
		
		score[0] =666;
		result = Arrays.toString(score);
		System.out.println(result);
		
		//정렬
		Arrays.sort(score); //낮은순 정렬
		result = Arrays.toString(score);
		System.out.println(result);
		
		
		
		// *배열을 만드는 방법
		int[] arr = new int[5]; //기본
		int[] arr2 = new int[] {100,200,300,400,500}; //값(초기값)을 정의하여 생성하는 것
		int[] arr3 = {11,12,13,14,15}; //컴파일러가 내부적으로 new을 해준다.
		//javascript: var만 쓴다. 타입이 없다. (variable)
				// var cars = ["a","b","c"]
		
		for(int i=0; i<arr3.length; i++) {
			System.out.printf("arr3[%d]=%d\n",i, arr3[i]);
		}
		
		//Car c;
		//c=new Car();
		
		int[] arr4;//배열선언 이렇게 하면 값은 null이 나온다. (전역일때)
		//System.out.println(arr4); //지역변수는 초기화 하지 않으면 출력할수 없다.
		// **arr4 = {11,22,33}; //나눠서 선언 할당할때는 먹지 않는다. 반드시 new를 써야한다.
		arr4 = new int[] {21,22,23,24,25};
		
		int[] arr5 = arr4; //주소값 할당 //arr5와 arr4합체
		System.out.println(arr4== arr5);
		
		//배열은 8가지 타입으로 다 만들 수 있다.
		char[] ch = new char[10];

		for(int i=0; i<ch.length; i++) {
			System.out.printf("ch[%c]=%c\n",i, ch[i]);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		int[] ar = new int[3]; //크기만 사용
		int[] ar2 = new int[] {1,2,3}; //초기화까지
		int[] ar3 = {1,2,3}; //컴파일러에게 의지하는 배열
	}

}
