package kr.or.bit;

public class Fan {

	private String brand;
	private String modelname;
	private String color;
	private static int price;
	public boolean power;
	public int level;
	Moter mo;
	
	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getModelname() {
		return modelname;
	}

	public void setModelname(String modelname) {
		this.modelname = modelname;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public static int getPrice() {
		return price;
	}

	public static void setPrice(int price) {
		Fan.price = price;
	}

	
	public void poweron() {
		power = true;
		System.out.println("전원을 킵니다.");
	}
	
	public void poweroff() {
		power = false;
		System.out.println("전원을 끈다.");
	}
	
	public void levelMethod(int a) {
		if(a ==1) {
			System.out.println("1단계입니다.");
		} else if (a ==2) {
			System.out.println("2단계 입니다");
		} else if (a ==3) {
			System.out.println("3단계입니다");
		} else {
			System.out.println("1,2,3을 입력해주세요");
		}
	}

}
