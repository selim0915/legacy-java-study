//package kr.or.bit;
//
//import java.util.Scanner;
//
//public class Display {
//
//	public static void main(String[] args) {
//		Coffee c = new Coffee();
//		c.displayCoffee();
//	}
//
//}
//
//// 
//class Coffee {
//	private Coffee[][] coffees;
//
//	public Coffee[] displayCoffee() {
//		System.out.println("┌─────────────┐");
//		System.out.println("│  커 피  메 뉴	  │");
//		System.out.println("│=============│");
//		System.out.println("│ 1.아메리카노	  │");
//		System.out.println("│	          │");
//		System.out.println("│ 2.카푸치노	  │");
//		System.out.println("│			  │");
//		System.out.println("│ 3.카페모카	  │");
//		System.out.println("│-------------│");
//		System.out.println("│ 4. 종  료	  │");
//		System.out.println("└─────────────┘");
//
//		
//		int menu = 0;
//		do {
//			try {
//				Scanner sc = new Scanner(System.in);
//				System.out.println("메뉴를 선택해 주세요.");
//				menu = Integer.parseInt(sc.nextLine());
//				if (menu >= 1 && menu <= 4) {
//					break;
//				} else {
//					throw new Exception("문제발생");
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//				System.out.println("메뉴를 잘못 선택했어요");
//				System.out.println("1,2,3,4 중에 선택해주세요");
//			}
//		} while (true);
//
//		
//		while(true) {
//			switch (menu-1) {
//			case 1: return coffees[menu] break;
//			case 2: coffees[menu] break;
//			case 3: coffees[menu] break; 
//			case 4: System.out.println("프로그램 종료"); break;
//			}
//			System.exit(0);
//		}
//	}
//	
//	
//	
//	
//	
//	
//	
//}