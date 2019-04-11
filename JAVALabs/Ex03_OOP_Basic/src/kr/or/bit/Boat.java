package kr.or.bit;
/*
 * 배는 이름과 문의 수와 최대 탑승인원과 가격과 배의 무게가 포함되어야한다. => 필드생성
*배가 만들어지면 이름과 문의 수 , 탑승인원 , 가격 , 무게가 반드시 포함되어야 한다. =>생성자
*배가 만들어지면 배의 정보는 수정 불가하다. => setter생성x
 */
public class Boat {
	private String name;
	private int door;
	private int maxp;
	private int price;
	private int ton;
	
	public Boat(String name, int door, int maxp, int price, int ton) {
		this.name = name;
		this.door = door;
		this.maxp = maxp;
		this.price = price;
		this.ton = ton;
	}

	public String getName() {
		return name;
	}

	public int getDoor() {
		return door;
	}

	public int getMaxp() {
		return maxp;
	}

	public int getPrice() {
		return price;
	}

	public int getTon() {
		return ton;
	}
}
