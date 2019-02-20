
public class Ex02_Lotto_Main {

	public static void main(String[] args) {
		// *****************************************************************
		// 1~45까지의 난수 중 6개를 배열에 담는다.
		// 중복값이 나올수도 있다.나오면 안된다.
		// 6개를 낮은 순으로 정렬한다.
		// 배열을 출력한다.

		int[] arr = new int[6];// 크기가 6인 배열 생성

		// 1~45까지의 난수를 배열에 담아라
		// int su = (int)(Math.random()*45)+1;

		for (int i = 0; i < 6; i++) {
			arr[i] = (int) (Math.random() * 45) + 1;
			// 중복 제거
			for (int j = 0; j < i; j++) {
				if (arr[j] == arr[i]) {
					i--;
					break;
				}
			}
		}
		System.out.println();

		// 6개의 수를 낮은 순으로 정렬한다.
		for (int i = 0; i < 6; i++) {
			for (int j = i + 1; j < 6; j++) {
				if (arr[i] < arr[j]) {
					int temp = arr[i];
					arr[i] = arr[j];
					arr[j] = temp;
				}
			}
		}

		// 출력
		for (int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}
	}

}
