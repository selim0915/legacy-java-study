import java.io.Serializable;
import java.util.Scanner;

public class Member implements Serializable {
	private String name = "";
	private int age = 0;
	private String numb = "";
	private String address = "";
	private int num = 0;

	public Member input(Member member) {
		Member m  = new Member();
		
		Scanner scan = new Scanner(System.in);
		System.out.println("이름을 입력하세요 : ");
		this.name = scan.nextLine();
		System.out.println("나이를 입력하세요 : ");
		this.age = Integer.parseInt(scan.nextLine());
		System.out.println("전화번호를 입력하세요 : ");
		this.numb = scan.nextLine();
		System.out.println("주소를 입력하세요 : ");
		this.address = scan.nextLine();
		//행운숫자
		this.num = (int)(Math.random() * 10) + 1;
		return member;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getNumb() {
		return numb;
	}

	public void setNumb(String number) {
		this.numb = number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return name + "\t" + age + "\t" + numb + "\t" + address + "\t" + num;
	}


}