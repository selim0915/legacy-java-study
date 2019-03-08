/*
 * 영어 대소문자와 띄어쓰기만으로 이루어진 문자열이 주어진다. 
 * 이 문자열에는 몇 개의 단어가 있을까? 이를 구하는 프로그램을 작성하시오. 
 * 단, 한 단어가 여러 번 등장하면 등장한 횟수만큼 모두 세어야 한다.
 */
public class Ex02_Array_test {

	public static void main(String[] args) {

		// 단어를 할당한다.
		String str = "Hello World";

		int sum=0;
		// 알파벳a-z까지 배열을 선언한다.
		char[] ch = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'n', 'm', 'o', 'p', 'q', 'r', 's',
				't', 'u', 'v', 'w', 'x', 'y', 'z' };

		// 할당한 단어가 a~z중에 뭐와 같은지 확인한다.
		for (int i = 0; i < str.length(); i++) {
			for (char j = 'a'; j <= 'z'; j++) {
				if (i == ch[j]) {
					sum += j;
				}
			}
		}
		// 각 단어마다 누적된 횟수가 필요하다.

		// 사용한 알파벳과, 사용횟수를 구한다.

	}

}
