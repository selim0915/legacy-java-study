import java.util.Scanner;

public class Ex09_Static_do_while_Menu {
		
	static Scanner sc = new Scanner(System.in);
	
	static void inputRecord() {
		System.out.println("성적데이터 입력: ");
	}
	
	static void deleteRecord() {
		System.out.println("성적데이터 삭제:");
	}
	
	static void sortRecord() {
		System.out.println("성적데이터 정렬:");
	}
	
	static int displaymenu() {
		System.out.println("******************");
		System.out.println("******성적관리*******");
		System.out.println("1.학생성적 입력하기");
		System.out.println();
		System.out.println("2.학생성적 삭제하기");
		System.out.println();
		System.out.println("3.학생성적 이름순 정리");
		System.out.println();
		System.out.println("4.프로그램 종료");
		System.out.println();
		
		int menu =0;
		
		do {
			try {
				menu = Integer.parseInt(sc.nextLine());
				if(menu >= 1 && menu <=4) {
					break;
				} else {
					throw new Exception("문제발생");
				}
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("메뉴를 잘못 선택했어요");
				System.out.println("1,2,3,4 중에 선택해주세요");
			}
		} while(true);
		
		return menu;
		
	}
	
	public static void main(String[] args) {
		while(true) {
			switch (displaymenu()) {
			case 1: inputRecord(); break;
			case 2: deleteRecord(); break;
			case 3: sortRecord(); break;
			case 4: System.out.println("프로그램 종료"); System.exit(0);
			}
		}
	}

}
