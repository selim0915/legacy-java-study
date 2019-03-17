package coffeevendingmachine;

import java.util.Scanner;

public class Machine { // �옄�뙋湲�
	private Scanner sc = new Scanner(System.in);
	private int password; // 愿�由ъ옄 紐⑤뱶 鍮꾨�踰덊샇
	private static int sales; // 留ㅼ텧(�늻�쟻)
	private final int[] MAXSTOCK = new int[] { 200, 1000, 50, 1000 };; // 理쒕� �옱猷뚮웾(�옱猷뚭� 留롮븘�꽌 諛곗뿴�꽑�깮)
	private int[] currentStock;
	private int[] size; // �궗�씠利�
	private int[][] recipes; // �옱猷뚮웾
	private Coffee coffeeOrder; // 二쇰Ц�븯�뒗 而ㅽ뵾
	private Coffee[] coffees; // 而ㅽ뵾 �젙蹂� 諛곗뿴
	String[] recipeName; // �옱猷� �씠由�

	public Machine() { // �깮�꽦�옄 �븿�닔
		password = 1234;
		currentStock = new int[] { 200, 1000, 50, 1000 };
		size = new int[] { 5, 10, 5, 10 };
		recipes = new int[][] { // �썝�몢, �슦�쑀, �꽕�깢, 臾�
				{ 20, 0, 0, 100 }, { 20, 100, 5, 100 }, { 20, 80, 5, 100 } };
		coffees = new Coffee[] { new Coffee1("�븘硫붾━移대끂", recipes[0], 1500), new Coffee2("移댄럹�씪�뼹", recipes[1], 2500),
				new Coffee3("移댄뫖移섎끂", recipes[2], 2000) };
		recipeName = new String[] { "�썝�몢", "�슦�쑀", "�꽕�깢", "臾�" };
	}

	public void vendingMachine() { // �떎�뻾 �븿�닔
		while (true) {
			Coffee coffee = displayMenu();
			if (coffee == null)
				continue;
			coffee = setUserRecipe(coffee);
			refund(coffee, inputMoney(coffee));
		}
	}

	Coffee displayMenu() { // 硫붾돱
		System.out.println("�뵆����������������������������");
		System.out.println("�봻  而� �뵾  硫� �돱   ");
		System.out.println("�봻=============");
		System.out.printf("�봻 1  %s   \n", coffees[0].getCoffeeName());
		System.out.println("�봻             ");
		System.out.printf("�봻 2  %s    \n", coffees[1].getCoffeeName());
		System.out.println("�봻             ");
		System.out.printf("�봻 3  %s     \n", coffees[2].getCoffeeName());
		System.out.println("�봻-------------");
		System.out.println("�봻 4   醫�  猷�      ");
		System.out.println("�뵒����������������������������");

		int menu = 0;
		do {
			try {
				Scanner sc = new Scanner(System.in);
				System.out.println("硫붾돱瑜� �꽑�깮�빐二쇱꽭�슂.");
				menu = Integer.parseInt(sc.nextLine());
				if (menu >= 1 && menu <= 4 || menu == password) {
					break;
				}
			} catch (Exception e) {
				System.out.println("硫붾돱瑜� �옒紐� �꽑�깮�뻽�뼱�슂");
				System.out.println("1,2,3,4 以묒뿉 �꽑�깮�빐二쇱꽭�슂");
			}
		} while (true);

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

	private Coffee setUserRecipe(Coffee coffee) { // �옱猷뚮웾 議곗젅

		coffeeOrder = new Coffee(coffee.getCoffeeName(), new int[4], coffee.getCoffeePrice());

		for (int i = 0; i < coffee.getRecipe().length; i++) {
			coffeeOrder.getRecipe()[i] = coffee.getRecipe()[i];
		}

		System.out.printf("%s 而ㅽ뵾瑜� �꽑�깮�븯�뀲�뒿�땲�떎.\n", coffeeOrder.getCoffeeName());
		System.out.println();
		for (int i = 0; i < coffeeOrder.getRecipe().length; i++) {
			if (coffeeOrder.getRecipe()[i] != 0) {
				int sizeSelect = 0;
				do {
					System.out.printf("%s�쓽 �뼇�쓣 �꽑�깮�빐二쇱꽭�슂.\n", recipeName[i]);
					System.out.println("1. 湲곕낯 2. �쟻寃� 3. 留롪쾶");
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
					System.out.println("湲곕낯�쑝濡� �꽕�젙�뻽�뒿�땲�떎.");
					System.out.println();
					break;
				case 2:
					System.out.println("�쟻�� �뼇�쑝濡� �꽕�젙�뻽�뒿�땲�떎.");
					System.out.println();
					coffeeOrder.getRecipe()[i] -= size[i];
					break;
				case 3:
					System.out.println("留롮� �뼇�쑝濡� �꽕�젙�뻽�뒿�땲�떎.");
					System.out.println();
					coffeeOrder.getRecipe()[i] += size[i];
					break;
				default:
					System.out.println("�삱諛붾Ⅸ 媛믪쓣 �엯�젰�빐二쇱꽭�슂.");
					System.out.println();
					i--;
					break;
				}
			}
		}

		System.out.println("�뼹�쓬�쓣 異붽��븯�떆寃좎뒿�땲源�? (+500�썝) (�삁 / �븘�땲�삤)");
		String answer = sc.nextLine();
		if (answer.equals("�삁")) {
			coffeeOrder.setIce(true);
			coffeeOrder.setCoffeePrice(coffeeOrder.getCoffeePrice() + 500);
		}

		return coffeeOrder;
	}

	private void showOrder(Coffee coffee) { // 二쇰Ц �궡�뿭 �솗�씤
		Coffee original = null;
		for (Coffee c : coffees) {
			if (coffee.getCoffeeName() == c.getCoffeeName()) {
				original = c;
				break;
			}
		}
		
		System.out.println("二쇰Ц �궡�슜�쓣 �솗�씤�빐二쇱꽭�슂.");
		System.out.println();
		if (coffee.isIce()) {
			System.out.print("�븘�씠�뒪 ");
		}
		System.out.println(coffee.getCoffeeName());
		System.out.println();
		for (int i = 0; i < coffee.getRecipe().length; i++) {
			String sizeString = null;
			if (coffee.getRecipe()[i] == 0) {
				continue;
			} else if (coffee.getRecipe()[i] == original.getRecipe()[i]) {
				sizeString = "湲곕낯";
			} else if (coffee.getRecipe()[i] < original.getRecipe()[i]) {
				sizeString = "�쟻寃�";
			} else if (coffee.getRecipe()[i] > original.getRecipe()[i]) {
				sizeString = "留롪쾶";
			}
			System.out.printf("%s : %s\n", recipeName[i], sizeString);
		}

		System.out.println();
		
		System.out.printf("媛�寃� : %d�썝\n", coffee.getCoffeePrice());
		System.out.println();
	}
	
	private int inputMoney(Coffee coffee) { // 二쇰Ц �솗�씤, 痍⑥냼, �엯湲�
		
		showOrder(coffee);
		
		System.out.println("�씠��濡� 二쇰Ц�븷源뚯슂? (�삁 / �븘�땲�삤)");
		String answer = sc.nextLine();
		
		int inputMoney;
		if (answer.equals("�삁")) {			
			System.out.println("湲덉븸�쓣 �닾�엯�븯�꽭�슂.");
			do {
				try {
					inputMoney = Integer.parseInt(sc.nextLine());
					break;
				} catch (NumberFormatException e) {
					System.out.println("�떎�떆 �엯�젰�빐二쇱꽭�슂");
				}
			} while (true);		
		} else {
			System.out.println("二쇰Ц�쓣 痍⑥냼�빀�땲�떎.");
			inputMoney = 0;
		}
		return inputMoney;
	}

	private void refund(Coffee coffee, int inputMoney) { // 怨꾩궛, �옍�룉 諛섑솚
		int result;
		
		if (inputMoney == 0) {
			return;
		} else if (inputMoney < coffee.getCoffeePrice()) {
			System.out.println("湲덉븸�씠 遺�議깊빀�땲�떎");
			result = inputMoney;
		} else {	
			System.out.println(inputMoney + "�썝�쓣 �꽔�쑝�뀲�뒿�땲�떎.");
			result = inputMoney - coffee.getCoffeePrice();

			System.out.println("�옍�룉�� " + result + "�썝�엯�땲�떎");
			makeCoffee(coffee);
		}

		int unit = 10000;
		int num = 0;
		int sw = 0;

		while (true) {
			num = (int) (result / unit);
			System.out.printf("%5d�썝  %4d媛�\n", unit, num);
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
				System.out.println("�옍�룉�쑝濡� �굹�솕�뒿�땲�떎.");
				return;
			}
		}
	}

	private void makeCoffee(Coffee coffee) { // 而ㅽ뵾 �젣議�
		for (int i = 0; i < currentStock.length; i++) {
			if (currentStock[i] < coffee.getRecipe()[i]) {
				System.out.println("二꾩넚�빀�땲�떎. �옱猷뚭� 遺�議깊빀�땲�떎. 愿�由ъ옄�뿉寃� �뿰�씫�븯�꽭�슂.");
				return;
			}
		}

		for (int i = 0; i < currentStock.length; i++) {
			currentStock[i] -= coffee.getRecipe()[i];
		}
		sales += coffee.getCoffeePrice();
		System.out.println("二쇰Ц�븳 而ㅽ뵾媛� �굹�솕�뒿�땲�떎.");
		System.out.println();
	}

	private void admin() { // 愿�由ъ옄 紐⑤뱶
		System.out.println("�뵆����������������������������");
		System.out.println("�봻  愿� 由� �옄 硫� �돱	  ");
		System.out.println("�봻=============");
		System.out.println("�봻 1. �옱猷뚮웾 �꽕�젙	  ");
		System.out.println("�봻	          ");
		System.out.println("�봻 2. 而ㅽ뵾 �씠由� 蹂�寃�  ");
		System.out.println("�봻			  ");
		System.out.println("�봻 3. 留ㅼ텧 �솗�씤	  ");
		System.out.println("�봻");
		System.out.println("�봻 4. �옱怨� �솗�씤");
		System.out.println("�봻-------------");
		System.out.println("�봻 5. 醫�  猷�	  ");
		System.out.println("�뵒����������������������������");

		int menu = 0;
		do {
			try {
				Scanner sc = new Scanner(System.in);
				System.out.println("硫붾돱瑜� �꽑�깮�빐 二쇱꽭�슂.");
				menu = Integer.parseInt(sc.nextLine());
				break;
			} catch (NumberFormatException e) {
				System.out.println("�떎�떆 �엯�젰�빐二쇱꽭�슂");
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
			currentStock();
			break;
		case 5:
			break;
		}
	}

	private void setRecipe() { // �옱猷뚮웾 �꽕�젙
		int coffee1;
		do {
			try {
				System.out.println("�옱猷뚮웾�쓣 諛붽씀�떎 而ㅽ뵾瑜� �꽑�깮�빐二쇱꽭�슂.");
				System.out.printf("1. %s 2. %s 3. %s\n", coffees[0].getCoffeeName(), coffees[1].getCoffeeName(),
						coffees[2].getCoffeeName());
				coffee1 = Integer.parseInt(sc.nextLine()) - 1;
				if (coffee1 >= 0 && coffee1 <= 2) {
					break;
				}
			} catch (NumberFormatException e) {
				System.out.println("�삱諛붾Ⅸ 媛믪쓣 �엯�젰�빐二쇱꽭�슂.");
			}
		} while (true);
		
		exit: while (true) {
			switch (coffee1 + 1) {
			case 1:
			case 2:
			case 3:
				System.out.println(coffees[coffee1].getCoffeeName());
				for (int i = 0; i < recipes[coffee1].length; i++) {
					System.out.printf("%s�쓽 �뼇�쓣 �엯�젰�빐二쇱꽭�슂.", recipeName[i]);
					recipes[coffee1][i] = Integer.parseInt(sc.nextLine());
				}
				System.out.printf("蹂�寃쎈맂 �옱猷뚮웾�엯�땲�떎.\n[%d, %d, %d, %d]\n", recipes[coffee1][0], recipes[coffee1][1],
						recipes[coffee1][2], recipes[coffee1][3]);
				break exit;
			default:
				System.out.println("�옒紐� �엯�젰�븯���뒿�땲�떎.");
			}

		}
		System.out.println();
		admin();
	}

	private void setCoffeeName() {// 而ㅽ뵾 �씠由� 蹂�寃�
		int numbers;	
		do {
			try {
				System.out.println("�씠由꾩쓣 蹂�寃쏀븷 而ㅽ뵾瑜� �꽑�깮�빐二쇱꽭�슂.");
				System.out.printf("1. %s 2. %s 3. %s\n", coffees[0].getCoffeeName(), coffees[1].getCoffeeName(),
						coffees[2].getCoffeeName());
				numbers = Integer.parseInt(sc.nextLine()) - 1;
				if (numbers >= 0 && numbers <= 2) {
					break;
				}
			} catch (NumberFormatException e) {
				System.out.println("�삱諛붾Ⅸ 媛믪쓣 �엯�젰�빐二쇱꽭�슂.");
			}
		} while (true);
		
		switch (numbers + 1) {
		case 1:
		case 2:
		case 3:
			System.out.println("蹂�寃쏀븷 �씠由꾩쓣 �엯�젰�빐二쇱꽭�슂 :");
			coffees[numbers].setCoffeeName(sc.nextLine());
			System.out.println("蹂�寃쏀븳 �씠由� :" + coffees[numbers].getCoffeeName());
			break;
		default:
			System.out.println("�옒紐� �엯�젰�븯�뀲�뒿�땲�떎.");
			setCoffeeName();
		}	
		System.out.println();
		admin();
	}

	private void displaySales() { // 留ㅼ텧 �솗�씤
		System.out.printf("�쁽�옱源뚯��쓽 留ㅼ텧�� %d�썝�엯�땲�떎.", sales);
		System.out.println();	
		System.out.println("\t\t�굹媛�湲� [0]");	
		String exit = sc.nextLine();	
		if (exit.equals("0")) {
			admin();
		} else {
			System.out.println("�옒紐� �엯�젰�븯���뒿�땲�떎.");
			displaySales();
		}
	}

	private void currentStock() { // �쁽�옱 �옱怨좊웾 �솗�씤
		for (int i = 0; i < MAXSTOCK.length; i++) {
			if ((float) currentStock[i] / MAXSTOCK[i] <= 0.3) {
				System.out.printf("%s �옱猷뚭� 30%% 誘몃쭔 �궓�븯�뒿�땲�떎.\n", recipeName[i]);
			}
		}
		System.out.println("�썝�몢,  �슦�쑀,  �꽕�깢,  臾�  - 理쒕�");
		for (int remain : MAXSTOCK) {
			System.out.printf("[%4d]", remain);
		}
		System.out.println();
		System.out.println("�썝�몢,  �슦�쑀,  �꽕�깢,  臾�  - �쁽�옱");
		for (int remain2 : currentStock) {
			System.out.printf("[%4d]", remain2);

		}
		System.out.println();
		System.out.println("\t\t�굹媛�湲� [0]");
		String exit = sc.nextLine();
		if (exit.equals("0")) {
			admin();
		} else {
			System.out.println("�옒紐� �엯�젰�븯���뒿�땲�떎.");
			currentStock();
		}
	}
}