/*
 * 똑같은 코드를 반복하기보다 한번에 쓰는게 하기 때문에 사용한다.
 * 배열을 사용하여, 덧셈, 나누기 할수 있으면 일단 성공!
 * 하나를 고정한 상태로 하나를 바꿔야할땐 중첩포문밖에 없다.
 * 객체의 초기화는 new를 통한 메모리를 할당하는것이 초기화이다.
 */
class Car{
	int door;
	String color;
}

public class Ex06_Array {

	public static void main(String[] args) {
		// 2차원 (행과열)
		// int[][] =>앞에가 행, 뒤에가 열

		int[][] score = new int[3][2];
		System.out.println(score[0][0]);
		System.out.println(score[2][1]);

		score[0][0] = 100;
		score[0][1] = 200;
		score[1][0] = 300;
		score[1][1] = 400;
		score[2][0] = 500;
		score[2][1] = 600;

		System.out.println(score.length); // length는 행의 길이를 알려준다.
		System.out.println(score[0].length); // 행의 위치를 적어야 열을 알수 있다.

		// 왜 그럴까? 그림을 그려보자

		// 행의개수: 배열이름.length
		// 열의갯쉬: 배열이름[행수].length

		for (int i = 0; i < score.length; i++) {
			for (int j = 0; j < score[i].length; j++) {
				// System.out.printf("score[%d][%d] = %d\n",i,j,score[i][j]);
				System.out.print(score[i][j] + " ");
			}
			System.out.println();
		}

		// Today point
		// Array(정적:고정) > colletion동적
		// 개선된 for문
		// c#: for(Type 변수명 in 배열) {출력구문}
		// JAVA: for(Type 변수명 : 배열) {출력구문}
		// javascript: for(Type 변수명 in 배열) {출력구문}

		int[] arr3 = { 5, 6, 7, 8, 9, 10 };
		for (int i = 0; i < arr3.length; i++) {
			System.out.println(arr3[i]);
		}

		// 변형된 for문
		for (int value : arr3) { // :뒤에 오는 것 여러개의 자원을 가진 것
			System.out.println(value);
		}

		String[] strarr = { "A", "B", "c", "D", "ff" };
		for (String val : strarr) {
			System.out.println(val);
		}

		// 센스
		// 1차
		int[][] score3 = new int[][] { { 11, 12 }, { 13, 14 }, { 15, 16 }, };

		for (int[] values : score3) { // :뒤에 오는 것 여러개의 자원을 가진 것
			for (int val : values) {
				System.out.println(val);
			}
		}

		
		//객체배열
		Car[] cararr = new Car[2];
		cararr[0] = new Car();
		cararr[0].color = "red";
		cararr[0].door =4;
		
		cararr[1] = new Car();
		cararr[1].color = "green";
		cararr[1].door =2;
		
		//일반 for문을 사용해서 자동차의 색상과 문의 개수를 출력하세요.
		for(int i=0; i<cararr.length; i++) {
			System.out.println(cararr[i].color+"/"+cararr[i].door);
		}
		
		for(Car val : cararr) {
			System.out.println(val.color+"/"+val.door);
		}
		
		
		
		
		
	}

}