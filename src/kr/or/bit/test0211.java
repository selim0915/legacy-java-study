package kr.or.bit;

public class test0211 {

	//한정자
	public int age;
	private String name;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	// 기능함수
	public void add() {
		int result = 2+3;
		//System.out.println("1. 2와3을 더하면: " +result);
	}
	
	public int add2() {
		int result = 2+3;
		System.out.println("2. 2와3을 더하면: " +result);
		return result;
	}
	
	public void add3(int a, int b) {
		int result = a+b;
		System.out.println("3. a와b을 더하면: " +result);
	}
	
	public int add4(int a, int b) {
		int result = a+b;
		System.out.println("4. a와b을 더하면: " +result);
		return result;
	}
	
	
	//----------------------------------------------
	public boolean ball;
	
	public void ballstart() {
		
	}
}
