package jinho.ex;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Ex0319 {

	public static void main(String[] args) {
		/*
		 * 1번 문제 숫자 1,2,3,4,5가 들어있는 배열 A를 생성하시오 A배열 크기의 2배가되는 배열 B를 선언하고 A배열의 데이터를 B에
		 * 복사하시오 B에 남은 공간에는 6,7,8,9,10을 저장하시오
		 */

		int[] arr = new int[5];
		for (int i = 0; i < arr.length; i++) {
			arr[i] = i + 1;
			System.out.println(arr[i]);
		}

		// int size=arr.length *2;
		int[] arr2 = new int[arr.length * 2];
		for (int i = 0; i < arr2.length; i++) { // i = 0~9
			if (i < 4) {
				arr2[i] = arr[i];
			} else {
				arr2[i] = i + 1;
			}
			System.out.println(arr2[i]);
		}

		/*
		 * 100점 a등급 80점이상 100미만이면 b등급 80점 미만 60점이상 이면 c등급이되는 if문 switch문을 작성하세요
		 */
		int score = 75;
		String grade = "";
		if (score == 100) {
			grade = "a등급";
		} else if (score >= 80 && score < 100) {
			grade = "b등급";
		} else if (score >= 60 && score < 80) {
			grade = "c등급";
		} else {
			grade = "80점 아래";
		}
		System.out.println("당신의 점수: " + score + " 등급은: " + grade);

		int val = score / 10;
		switch (val) {
		case 10:
			grade = "a등급";
			break;
		case 9:
		case 8:
			grade = "b등급";
			break;
		case 7:
		case 6:
			grade = "c등급";
			break;
		default:
			grade = "80점 아래";
		}
		System.out.println("당신의 점수: " + score + " 등급은: " + grade);

		/*
		 * 클래스 TV와 클래스 TVMAIN을 선언하고 TVMAIN에서 TV의 채널과 전원을 관리할 수 있도록 만드시오
		 */

		TvMain tvm = new TvMain();
		System.out.println("TV전원 상태:" + tvm.tv.power);
		tvm.tv.powerMethod();
		System.out.println("TV전원 상태2:" + tvm.tv.power);
		// tvm.tv.powerMethod();
		// System.out.println("TV전원 상태3:" + tvm.tv.power);

		System.out.println("TV채널:" + tvm.tv.ch);
		tvm.tv.chUp();
		tvm.tv.chUp();
		System.out.println("TV채널:" + tvm.tv.ch);
		tvm.tv.chDown();
		tvm.tv.likeCh();
		tvm.tv.chDown();
		tvm.tv.chDown();
		System.out.println("TV채널:" + tvm.tv.ch);
		tvm.tv.chUp();
		tvm.tv.chUp();
		tvm.tv.likeCh();
		tvm.tv.chUp();
		tvm.tv.chUp();
		System.out.println("TV채널:" + tvm.tv.ch);
		tvm.tv.likeCh();
		
	}

}

class Tv {
	static int ch;
	boolean power;

	Tv() {
		this.ch=0;
		this.power = false;
	}

	void chUp() {
		if (this.power == true) {
			ch++;
			System.out.println("채널up");
		} else {
			System.out.println("전원 꺼져있음");
		}
	}

	void chDown() {
		if (this.power == true) {
			ch--;
		} else {
			System.out.println("전원 꺼져있음");
		}
	}

	void powerMethod() {
		this.power = !power;
		String val =(power == true) ? "o" : "x";
		System.out.println("전원상태: "+val);
	}
//	String chPower() {
//		return (power == true) ? "o" : "x";
//	}
	
	void likeCh() {
		List<Integer> li = new ArrayList<Integer>();
		li.add(ch);
		
		System.out.println("선호한 채널 목록");
		Iterator<Integer> it =li.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
	}
}

class TvMain {
	Tv tv;

	TvMain() {
		this.tv = new Tv();
	}
}
