
public class Ex02_Exception {

	public static void main(String[] args) {
		int num = 100;
		int result = 0;
		
		try {
			for (int i = 0; i < 10; i++) {
				result = num / (int) (Math.random() * 10); // 0~9
				System.out.println("result: " + result + " ,i: " + i);
			}
		} catch (ArithmeticException e) { // *가독성
			System.out.println(e.getMessage());
		} catch(Exception e) {
			System.out.println("나머지 예외 처리");
			//e.printStackTrace();
		}
		//가독성을 높이기 위해서 catch block를 생성 할 수 있다.
		// 그러나,,,,
		// 하위 예외는 항상 부모위에 있어야 한다.! (Exception 이 제일 부모)
		
		System.out.println("Main End");
	}
}
