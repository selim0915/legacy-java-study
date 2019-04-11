
public class Ex01_Array_Quiz {

	public static void main(String[] args) {
		// 수학과 학생들의 기말고사 시험점수
		// 제어문을 사용해서 max에 최대값,min에 최소값을 출력하시오.
		int[] score = new int[] { 79, 88, 97, 54, 56, 95 };

		int max = score[0];
		int min = score[0];

		for (int i = 0; i < score.length; i++) {
			max = (max < score[i]) ? max = score[i] : max;
			min = (min > score[i]) ? min = score[i] : min;
		}
		System.out.println("max: " + max);
		System.out.println("min: " + min);

		// 10개의 방을 1~10까지 초기화
		int[] number = new int[10];

		for (int i = 0; i < number.length; i++) {
			number[i] += i;
			System.out.println("number[" + i + "] : " + number[i]);
		}

		// 어느 학생에 기말고사 시험점수입니다. (5과목)
		// 과목 수
		// 과목의 합
		// 과목의 평균
		int sum = 0;
		float average = 0f;
		int[] jumsu = { 100, 55, 90, 60, 78 };

		for (int i = 0; i < jumsu.length; i++) {
			sum += jumsu[i];
			if (i == jumsu.length - 1) {
				average += sum / (float) jumsu.length;
			}
		}

		System.out.println("총 과목 수: " + jumsu.length);
		System.out.println("과목의 합: " + sum);
		System.out.println("과목의 평균: " + average);

		// 조별과제
		// 1~45까지의 난수 중 6개를 배열에 담는다.
		// 중복값이 나올수도 있다.나오면 안된다.
		// 6개를 낮은 순으로 정렬한다.
		// 배열을 출력한다.
		int[] lotto = new int[6];
		// 번호 추출 (중복값 제거)
		for (int i = 0; i < 6; i++) {
			lotto[i] = (int) (Math.random() * 45) + 1; // 난수 추출
			for (int j = 0; j < i; j++) {
				if (lotto[i] == lotto[j]) {
					i--; // point
					break;
				}
			}
		}
		// 정렬하기
		for (int i = 0; i < lotto.length; i++) {
			for (int j = i + 1; j < lotto.length; j++) {
				if (lotto[i] > lotto[j]) {
					int temp = lotto[i];
					lotto[i] = lotto[j];
					lotto[j] = temp;
				}
			}
		}
		// 출력하기
		for (int i = 0; i < lotto.length; i++) {
			System.out.println(lotto[i]);
		}

	}

}
