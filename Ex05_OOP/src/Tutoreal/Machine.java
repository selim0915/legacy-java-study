package Tutoreal;

import java.util.Scanner;

public class Machine { // 자판기
	private Scanner sc = new Scanner(System.in);
	private int password;
	private static int sales; // 매출(누적)
	private final int[] MAXSTOCK = new int[] { 200, 1000, 50, 100 };; // 최대 재료량(재료가 많아서 배열선택)
	private int[] currentStock;
	// private int changeMoney; // 거스름돈 단위
	// private int inputMoney; // 받은 돈
	private int[] size; // 사이즈
	private int[][] recipes;
	private Coffee coffeeOrder;
	private Coffee[] coffees;

	public Machine() {
		password = 1234;
//    	changeMoney = new int[] { 5000, 1000, 500, 100 };
//    	inputMoney = new int[] { 5000, 1000, 500, 100 };
		currentStock = new int[] { 200, 1000, 50, 100 };
		size = new int[] { 5, 10, 5, 10 };
		recipes = new int[][] { // 원두, 우유, 설탕, 물
				{ 20, 0, 0, 100 }, { 20, 100, 5, 100 }, { 20, 80, 5, 100 } };
		coffees = new Coffee[] { new Coffee1("아메리카노", recipes[0], 1500), new Coffee2("카페라떼", recipes[1], 2500),
				new Coffee3("카푸치노", recipes[2], 2000) };
	}

	public void vendingMachine() { // 실행 함수
		while (true) {
			Coffee coffee = displayMenu();
			if (coffee == null)
				continue;
			coffee = setUserRecipe(coffee);
			displaySum(coffee);
			refund(coffee, inputMoney());
		}
	}

	private void admin() { // 관리자 모드
		System.out.println("┌─────────");
		System.out.println("│  커 피  메 뉴	  ");
		System.out.println("│=============");
		System.out.println("│ 1.재료량 설정	  ");
		System.out.println("│	          ");
		System.out.println("│ 2.커피종류 변경  ");
		System.out.println("│			  ");
		System.out.println("│ 3.매출확인	  ");
		System.out.println("│	");
		System.out.println("│ 4. 재고확인");
		System.out.println("│-------------");
		System.out.println("│ 5. 종  료	  ");
		System.out.println("└─────────");

		int menu = 0;
		do {
			try {
				Scanner sc = new Scanner(System.in);
				System.out.println("메뉴를 선택해 주세요.");
				menu = Integer.parseInt(sc.nextLine());
				break;
			} catch (NumberFormatException e) {
				System.out.println("다시 입력해주세요");
			}
		} while (true);

		switch (menu) {
		case 1:
			setRecipe();
			break;
		case 2:
			setCoffeeName();
			break;
		case 3:
			displaySales();
			break;
		case 4:
			Nowstock();
			break;
		case 5:
			break;
		}
	}

	/*
	 * private void 현재재고량() { // 최대재고량 출력 // 현재재고량 출력 // 30% 미만시 재료를 넣어주세요 출력 }
	 */
	private void Nowstock() {
		for (int i = 0; i < MAXSTOCK.length; i++) {
			if (currentStock[i] / MAXSTOCK[i] <= 0.3) {
				System.out.println("재료가 30% 남았습니다.");
				break;
			}
		}
		System.out.println("원두,  우유,  설탕,  물  - 최대");
		for (int remain : MAXSTOCK) {
			System.out.printf("[%4d]", remain);
		}
		System.out.println();
		System.out.println("원두,  우유,  설탕,  물  - 현재");
		for (int remain2 : currentStock) {
			System.out.printf("[%4d]", remain2);

		}
		System.out.println();
		System.out.println("\t\t나가기 [0]");
		String exit = sc.nextLine();
		if (exit.equals("0")) {
			admin();
		} else {
			System.out.println("잘못 입력하였습니다.");
			Nowstock();
		}
	}

	private void displaySales() { // 매출 확인
		System.out.printf("현재까지 커피 매출은 [%d]입니다.\n", sales);
		System.out.println();
		System.out.println("\t\t나가기 [0]");
		String exit = sc.nextLine();
		if (exit.equals("0")) {
			admin();
		} else {
			System.out.println("잘못 입력하였습니다.");
			displaySales();
		}
	}

	private void setRecipe() { // 재료량 설정
		System.out.println("바꾸실 재료의 커피를 선택해주세요.");
		System.out.printf("1.[%s] ,2[%s] ,3[%s]", coffees[0].getCoffeeName(), coffees[1].getCoffeeName(),
				coffees[2].getCoffeeName());
		System.out.println();
		int coffee1 = Integer.parseInt(sc.nextLine());
		exit: while (true) {
			switch (coffee1) {
			case 1:
				System.out.println(coffees[0].getCoffeeName());
				for (int i = 0; i < recipes[0].length; i++) {
					System.out.printf("[%d] 원두 > 우유 > 설탕 > 물 순입니다.", i + 1);
					recipes[0][i] = Integer.parseInt(sc.nextLine());
				}
				System.out.printf("[%d],[%d],[%d],[%d] 바뀐 레시피입니다.", recipes[0][0], recipes[0][1], recipes[0][2],
						recipes[0][3]);
				break exit;
			case 2:
				System.out.println(coffees[1].getCoffeeName());
				for (int i = 0; i < recipes[1].length; i++) {
					System.out.printf("[%d] 원두 > 우유 > 설탕 > 물 순입니다.", i + 1);
					recipes[1][i] = Integer.parseInt(sc.nextLine());
				}
				System.out.printf("[%d],[%d],[%d],[%d] 바뀐 레시피입니다.", recipes[1][0], recipes[1][1], recipes[1][2],
						recipes[1][3]);
				break exit;
			case 3:
				System.out.println(coffees[2].getCoffeeName());
				for (int i = 0; i < recipes[2].length; i++) {
					System.out.printf("[%d] 원두 > 우유 > 설탕 > 물 순입니다.", i + 1);
					recipes[2][i] = Integer.parseInt(sc.nextLine());
				}
				System.out.printf("[%d],[%d],[%d],[%d] 바뀐 레시피입니다.", recipes[2][0], recipes[2][1], recipes[2][2],
						recipes[2][3]);
				break exit;
			default:
				System.out.println("잘못 입력하였습니다.");
			}

		}
		admin();
	}

	private void setCoffeeName() {// 커피종류 변경
		System.out.printf("1.[%s], 2.[%s], 3.[%s]", coffees[0].getCoffeeName(), coffees[1].getCoffeeName(),
				coffees[2].getCoffeeName());
		System.out.println();
		System.out.println("변경할 커피 번호 입력 : ");
		int numbers = Integer.parseInt(sc.nextLine());
		if (numbers == 1) {
			System.out.println("변경할 이름을 입력해주세요 :");
			coffees[0].setCoffeeName(sc.nextLine());
			System.out.println("바뀐이름 :" + coffees[0].getCoffeeName());
		} else if (numbers == 2) {
			System.out.println("변경할 이름을 입력해주세요 :");
			coffees[1].setCoffeeName(sc.nextLine());
			System.out.println("바뀐이름 :" + coffees[1].getCoffeeName());
		} else if (numbers == 3) {
			System.out.println("변경할 이름을 입력해주세요 :");
			coffees[2].setCoffeeName(sc.nextLine());
			System.out.println("바뀐이름 :" + coffees[2].getCoffeeName());
		} else {
			System.out.println("잘못 입력하였습니다.");
			setCoffeeName();
		}
		admin();
	}

	private int inputMoney() {
		int inputMoney;

		System.out.println("금액을 투입하세요.");

		do {
			try {
				inputMoney = Integer.parseInt(sc.nextLine());
				break;
			} catch (NumberFormatException e) {
				System.out.println("다시 입력해주세요");
			}
		} while (true);

		return inputMoney;
	}

	private Coffee displayMenu() { // 메뉴
		System.out.println("┌──────────────");
		System.out.println("│  커 피  메 뉴   ");
		System.out.println("│=============");
		System.out.printf("│ 1  %s   \n", coffees[0].getCoffeeName());
		System.out.println("│             ");
		System.out.printf("│ 2  %s    \n", coffees[1].getCoffeeName());
		System.out.println("│             ");
		System.out.printf("│ 3  %s     \n", coffees[2].getCoffeeName());
		System.out.println("│-------------");
		System.out.println("│ 4   종  료      ");
		System.out.println("└──────────────");

		int menu = 0;
		do {
			try {
				Scanner sc = new Scanner(System.in);
				System.out.println("메뉴를 선택해 주세요.");
				menu = Integer.parseInt(sc.nextLine());
				if (menu >= 1 && menu <= 4 || menu == password) {
					break;
				}
			} catch (Exception e) {
				System.out.println("메뉴를 잘못 선택했어요");
				System.out.println("1,2,3,4 중에 선택해주세요");
			}
		} while (true);

		// this.password = password;
		coffeeOrder = null;

		switch (menu) {
		case 1:
		case 2:
		case 3:
			coffeeOrder = coffees[--menu];
			break;
		case 4:
			System.exit(0);
		case 1234:
			admin();
			break;
		}
		return coffeeOrder;
	}

	private Coffee setUserRecipe(Coffee coffee) { // 재료량 조절
		String[] recipeName = { "원두", "우유", "설탕", "물" };

		coffeeOrder = new Coffee(coffee.getCoffeeName(), new int[4], coffee.getCoffeePrice());

		for (int i = 0; i < coffee.getRecipe().length; i++) {
			coffeeOrder.getRecipe()[i] = coffee.getRecipe()[i];
		}

		System.out.printf("%s 커피를 선택하셨습니다.\n", coffeeOrder.getCoffeeName());
		System.out.println();
		for (int i = 0; i < coffeeOrder.getRecipe().length; i++) {
			if (coffeeOrder.getRecipe()[i] != 0) {
				int sizeSelect = 0;
				do {
					System.out.printf("%s의 양을 선택해주세요.\n", recipeName[i]);
					System.out.println("1. 기본 2. 적게 3. 많게");
					try {
						sizeSelect = Integer.parseInt(sc.nextLine());
						if (sizeSelect >= 1 && sizeSelect <= 3) {
							break;
						} else {
							throw new Exception();
						}
					} catch (Exception e) {
						break;
					}
				} while (true);

				switch (sizeSelect) {
				case 1:
					System.out.println("기본으로 설정했습니다.");
					System.out.println();
					break;
				case 2:
					System.out.println("적은 양으로 설정했습니다.");
					System.out.println();
					coffeeOrder.getRecipe()[i] -= size[i];
					break;
				case 3:
					System.out.println("많은 양으로 설정했습니다.");
					System.out.println();
					coffeeOrder.getRecipe()[i] += size[i];
					break;
				default:
					System.out.println("올바른 값을 입력해주세요.");
					System.out.println();
					i--;
					break;
				}
			}
		}

		System.out.println("얼음을 추가하시겠습니까? (+500원) (예 / 아니오)");
		String answer = sc.nextLine();
		if (answer.equals("예")) {
			coffeeOrder.setIce(true);
			coffeeOrder.setCoffeePrice(coffeeOrder.getCoffeePrice() + 500);
		}

		return coffeeOrder;
	}

	private void displaySum(Coffee coffee) { // 금액 표시
		int result = coffee.getCoffeePrice();
		System.out.printf("가격은 %d원입니다\n", result);
		System.out.println();

	}

	private void refund(Coffee coffee, int inputMoney) { // 계산, 잔돈 반환
		int result;

		if (inputMoney < coffee.getCoffeePrice()) {
			System.out.println("금액이 부족합니다");
			result = inputMoney;
		} else {
			System.out.println(inputMoney + "원을 넣으셨습니다.");
			result = inputMoney - coffee.getCoffeePrice();

			System.out.println("잔돈 " + result + "입니다");
			makeCoffee(coffee);
		}

		int unit = 10000;
		int num = 0;
		int sw = 0;

		while (true) {
			num = (int) (result / unit);
			System.out.printf("%5d원  %4d개\n", unit, num);
			if (unit > 10) {
				result = result - unit * num;
				if (sw == 0) {
					unit = unit / 2;
					sw = 1;
				} else {
					unit = unit / 5;
					sw = 0;
				}
			} else {
				System.out.println("잔돈으로 나왔습니다.");
				return;
			}
		}
	}

	private void makeCoffee(Coffee coffee) {
		for (int i = 0; i < currentStock.length; i++) {
			currentStock[i] -= coffee.getRecipe()[i];
		}
		sales += coffee.getCoffeePrice();
		System.out.println("주문한 커피가 나왔습니다.");
		System.out.println();
	}
}
