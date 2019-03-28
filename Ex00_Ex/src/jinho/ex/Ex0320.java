package jinho.ex;

import java.util.Scanner;

public class Ex0320 {

	public static void main(String[] args) {
		/*
		 스캐너를 이용하여 값을 받고 그걸이용해서 AXA 크기의 별을 찍으세요 (단 2중 배열을 사용할것)
		 */
		Star star = new Star();
		star.draw();
	}

}

class Star{
	Scanner sc;
	
	Star(){
		sc = new Scanner(System.in);
	}
	
	void draw() {
		System.out.println("별의 크기를 입력해주세요.");
		int size =Integer.parseInt(sc.nextLine());
		
		String[][] arr = new String[size][size];
		
		for(int i=0; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++) {
				arr[i][j] = "*";
				System.out.print(arr[i][j]);
			}
			System.out.println();
		}
		
		
	}
}