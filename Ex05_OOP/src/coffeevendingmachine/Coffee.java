package coffeevendingmachine;

public class Coffee {
	private String coffeeName; // 커피 이름
	private int coffeeId;      // 커피 고유번호
	private int coffeePrice;   // 커피 가격
	
	private int[] recipe;      // 커피 재료 사용량
	
	public Coffee(String coffeeName, int coffeeId, int[] recipe, int coffeePrice) { // 커피 생성자 함수
		this.coffeeName = coffeeName;
		this.coffeeId = coffeeId;
		this.recipe = recipe;
		this.coffeePrice = coffeePrice;
	}
}