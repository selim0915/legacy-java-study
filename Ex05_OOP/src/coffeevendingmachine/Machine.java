package coffeevendingmachine;

import java.util.Scanner;

public class Machine { //자판기
    private int password;
    private boolean power; // 전원
    private static int sales; // 매출(누적) 
    private int[] maxRecipe; // 최대 재료량(재료가 많아서 배열선택)
    private int[] changeMoney; // 거스름돈 단위
    private int[] inputMoney; // 받는 돈 단위
    private int[] size; // 사이즈
    
    private int[][] recipes = new int[][] { // 원두, 우유, 설탕, 물
        { 20, 0, 0, 100 },
        { 20, 100, 5, 100 },
        { 20, 80, 5, 100 }
    };
    
    Coffee[] coffees = { new Coffee("아메리카노", 1, recipes[0], 1500), 
            new Coffee("카푸치노", 2, recipes[1], 2000), 
            new Coffee("카페라떼", 3, recipes[2], 2500)};
            
    public void admin() { //愿�由ъ옄紐⑤뱶
    setRecipe();
    setCoffeeName();
    displaySales();
    }
    
    public void setRecipe() { //재료량 설정
        
    }
    public void setCoffeeName() {//커피종류 변경
 
    }
    public int displaySales() { //매출확인
        return 0;
    }
    public void enterAdmin(int password) { //관리자모드 접근
    	System.out.println("관리자");
        if(this.password == password) {
            admin();
        }else {
            System.out.println("잘못된 접근입니다.");
            displayMenu();
        }
    }
    public Coffee displayMenu() { //메뉴
    	System.out.println("┌─────────────┐");
		System.out.println("│  커 피  메 뉴	  │");
		System.out.println("│=============│");
		System.out.println("│ 1.아메리카노	  │");
		System.out.println("│	          │");
		System.out.println("│ 2.카푸치노	  │");
		System.out.println("│			  │");
		System.out.println("│ 3.카페모카	  │");
		System.out.println("│-------------│");
		System.out.println("│ 4. 종  료	  │");
		System.out.println("└─────────────┘");

		
		int menu = 0;
		do {
			try {
				Scanner sc = new Scanner(System.in);
				System.out.println("메뉴를 선택해 주세요.");
				menu = Integer.parseInt(sc.nextLine());
				if (menu >= 1 && menu <= 4 || menu==1234) {
					break;
				} else {
					throw new Exception("문제발생");
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("메뉴를 잘못 선택했어요");
				System.out.println("1,2,3,4 중에 선택해주세요");
			}
		} while (true);

		//this.password = password;
		Coffee c = null;
		switch (menu) {
		case 1: c=coffees[0]; break;
		case 2: c=coffees[1]; break;
		case 3: c=coffees[2]; break; 
		case 4: System.exit(0); break;
		case 1234: enterAdmin(menu); break;
		}
        //displayCoffee();
        //selectCoffee();
		
		//System.out.println("c: "+c);
        return c;
    }
    public int setUserRecipe() { //재료량 조절
        return 0;
    }
    public void displaySum() { //금액표시
        
    }
    public void selectCoffee() { //커피선택
        setUserRecipe();
    }
    public void displayCoffee() { //커피표시
        displaySum();
        
    }
    
}