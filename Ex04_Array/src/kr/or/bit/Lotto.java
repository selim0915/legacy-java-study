package kr.or.bit;

import java.util.Random;
import java.util.Scanner;

// Lotto 설계도 만들기
// 쓰는 목적: Lotto lotto = new Lotto();
// lotto.SelectLottoNumber(); >>메뉴제공
// 1 값을 입력하면 >> selectBasicNumber(); 함수 호출(실번호 추출)
// 2 값을 입력하면 >> 화면 출력
// 3 값을 입력하면 >> 프로그램 종료
public class Lotto {
	private Scanner scanner; // 부품정보
	private Random r; // 부품정보 //r.nextInt(45) //0~44 //+1 해주면 0~45
	private int[] numbers; // 상태번호
	private int[] count;

	public Lotto() {
		// 특수한 목적을 가지고 있는 함수: member field 초기화
		// 생성자 함수 constructor
		scanner = new Scanner(System.in); // 초기화의 의미: 참조변수는 주소값을 갖는 것
		r = new Random();
		numbers = new int[6]; // 로또
		count = new int[45];
	}

	// 메뉴 출력
	private void showMenu() {
		System.out.println("******로또추점******");
		System.out.println("1.로또추첨 하기");
		System.out.println("2.프로그램 종료");
	}

	// 입력받은 값 검사
	private int MenuMethod(Scanner scanner) {
		showMenu();

		int menu = 0;
		do {
			menu = Integer.parseInt(scanner.nextLine());
			try {
				if (menu >= 1 && menu <= 2) {
					break;
				} else {
					throw new Exception("범위 문제발생");
				}
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("catch문: 1,2 메뉴를 잘못 선택했어요");
			}
		} while (true);

		return menu;
	}

	public void selectBasicNumber() {
		escape: while (true) {
			int menu = MenuMethod(scanner);
			switch (menu) {
			case 1:
				sortMethod(numbers);
				// selectBasicLottoSort(numbers);
				selectBasicLottoPrint(numbers); // 출력
				break;
			case 2:
				System.out.println("switch: 프로그램 종료");
				break escape;
			// System.exit(0);
			default:
				System.out.println("1~4중에 숫자를 입력하세요.");
			}
		}
	}

	// 실 로또 번호를 추출하고 중복값을 배제하는 함수
	public void selectBasicLottoNumber(Random r, int[] numbers) {
		for (int i = 0; i < 6; i++) {
			numbers[i] = r.nextInt(46); // 0~45
			// 중복 제거
			for (int j = 0; j < i; j++) {
				if (numbers[j] == numbers[i]) {
					i--;
					break;
				}
			}
		}
	}

	// 로또 낮은 순서대로 정렬
	public void selectBasicLottoSort(int[] numbers) {
		for (int i = 0; i < 6; i++) {
			for (int j = i + 1; j < 6; j++) {
				if (numbers[i] > numbers[j]) {
					int temp = numbers[i];
					numbers[i] = numbers[j];
					numbers[j] = temp;
				}
			}
		}
	}

	// 로또 출력
	public void selectBasicLottoPrint(int[] numbers) {
		for (int i = 0; i < numbers.length; i++) {
			System.out.print(numbers[i] + " ");
		}
		System.out.println();
	}

	// 검증(기능 함수) (6개의 합을 구해서 6으로 나눈 평균의 범위가
	// 5보다 크거나 같고 10보다 작거나 같으면 번호 추출
	// (avg >= 5 && avg <= 10) ... 이 범위가 아니면 재추출
	private boolean checkAverage(int[] numbers) {
		int sum = 0;
		int average = 0;
		for (int i = 0; i < numbers.length; i++) {
			sum += numbers[i];
		}
		average = sum / numbers.length;
		return (average >= 5 && average <= 10); // 평균이 5,6,7,8,9,10이면 TRUE 리턴
	}

	// 나란히 증가하는 번호 뽑기
	public void sortMethod(int[] numbers) {
//		for (int i = 0; i < 6; i++) {
//			numbers[i] = r.nextInt(45) + 1; // 0~45
//			if (i > 0) {
//				for (int j = i - 1; j < i; j++) {
//					if ((numbers[j] - numbers[i]) != -1) {
//						i--;
//						break;
//					} 
//					if(numbers[i] >= 42) {
//						numbers[i] = 1;
//					}
//				}
//			}
//		}

//		int temp = 1;
//		for (int i = 0; i < 1; i++) {
//			numbers[i] = (int) (Math.random() * 45) + 1;
//			for (int j = 1; j < numbers.length; j++) {
//				numbers[j] = numbers[j - 1] + 1;
//				if (45 < numbers[j - 1] + 1) {
//					numbers[j] = temp;
//					temp++;
//				}
//			}
//		}

		int temp = 1;
		for (int i = 0; i < 1; i++) {
			numbers[i] = (int) (Math.random() * 45) + 1;
			for (int j = 1; j < numbers.length; j++) {
				numbers[j] = numbers[j - 1] + 1;
				if (45 < numbers[j - 1] + 1) {
					numbers[j] = temp;
					temp++;
				}
			}
		}

	}
}
