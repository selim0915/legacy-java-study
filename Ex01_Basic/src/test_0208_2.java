import java.util.Scanner;

public class test_0208_2 {

	public static void main(String[] args) {

		System.out.println("5X5 오른쪽 아래 직각사각형 만들기");
		for (int i = 1; i <= 5; i++) {
			for (int j = 1; j <= i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println();

		System.out.println("5X5 오른쪽 위 직각사각형 만들기");
		for (int i = 1; i <= 5; i++) {
			for (int j = 1; j <= 6 - i; j++) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println();

		System.out.println("5X5 왼쪽 아래 직각사각형 만들기");
		for (int i = 1; i <= 5; i++) {
			for (int j = i; j < 5; j++) {
				System.out.print(" ");
			}
			for (int k = 6 - i; k <= 5; k++) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println();

		System.out.println("5X5 왼쪽 위 직각사각형 만들기");
		for (int i = 0; i <= 5; i++) {
			for (int j = 6 - i; j <= 5; j++) {
				System.out.print(" ");
			}
			for (int k = i; k < 5; k++) {
				System.out.print("*");
			}
			System.out.println();
		}
		System.out.println();

		System.out.println("-------------------------------");

		// 다른 사람들 코드
		System.out.println();
		System.out.println();

		for (int i = 0; i < 7; i++) {
			int left = 7 - i;
			int right = 7 + i;
			for (int j = 1; j < 14; j++) {
				if (j >= left && j <= right) {
					System.out.print("*");
				} else {
					System.out.print(" ");
				}
			}
			System.out.println();
		}

		System.out.println();

		for (int i = 4; i <= 6; i++) {
			for (int j = 6; j >= 5; j--) {
				if (i >= j) {
					System.out.print("*");
				} else {
					System.out.print(" ");
				}
			}
			for (int k = 4; k <= 6; k++) {
				if (i >= k) {
					System.out.print("*");
				} else {
					System.out.print(" ");
				}
			}
			System.out.println();
		}

		System.out.println();
		System.out.println("-----------내가 해보는 거--------------------");
		System.out.println();

		for (int i = 1; i <= 10; i++) {
			for (int j = i; j < 10; j++) {
				System.out.print(" ");
			}
			for (int k = 11 - i; k <= 10; k++) {
				System.out.print("*");
			}
			for (int j = i; j < 10; j++) {
				System.out.print("*");
			}
			for (int k = 11 - i; k <= 10; k++) {
				System.out.print("*");
			}
			for (int j = i; j < 10; j++) {
				System.out.print("*");
			}
			for (int k = 11 - i; k <= 10; k++) {
				System.out.print(" ");
			}
			for (int j = i; j < 10; j++) {
				System.out.print(" ");
			}
			for (int k = 11 - i; k <= 10; k++) {
				System.out.print(" ");
			}
			System.out.println();
		}
		System.out.println();

		for (int i = 0; i < 10; i++) {
			for (int j = 10; j > 0; j--) {
				if (j > i + 1)
					System.out.print("1");
				else
					System.out.print("*");
			}
			for (int j = 10; j > 0; j--) {
				if (j > i)
					System.out.print("@");
			}
			System.out.println();
		}

		for (int i = 1; i <= 5; i++) {
			for (int j = 5; j > i; j--) {

				System.out.print(" ");
			}
			for (int k = 1; k < (i * 2); k++) {
				System.out.print("*");
			}
			System.out.println();
		}

		System.out.println();

		for (int i = 5; i >= 1; i--) {
			for (int j = 5; j > i; j--) {
				System.out.print(" ");
			}
			for (int k = i * 2; k > 1; k--) {
				System.out.print("*");

			}
			System.out.println();
		}

		System.out.println();
		System.out.println("------------------------------");

		int num = 0;
		Scanner sc = new Scanner(System.in);

		System.out.print("수 입력 : ");
		num = sc.nextInt();

		for (int i = 1; i <= num; i++) {
			for (int j = num; j > i; j--) {

				System.out.print(" ");
			}
			for (int k = 1; k <= (i * 2) - 1; k++) {
				System.out.print("*");
			}
			System.out.println();
		}

		for (int i = num; i >= 1; i--) {
			for (int j = num; j > i; j--) {
				System.out.print(" ");
			}
			for (int k = i * 2 - 1; k >= 1; k--) {
				System.out.print("*");
			}
			System.out.println();
		}

		// 정일찬님
		for (int i = 1; i <= 9; i++) {
			for (int j = 9; j >= 2; j--) {
				if (i > j) {
					System.out.print("*");
				} else {
					System.out.print(" ");
				}
			}
			System.out.println();
		}
		System.out.println();
	}

}
