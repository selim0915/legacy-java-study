import java.util.HashMap;
import java.util.Scanner;
import java.util.Set;
import java.io.*;


public class MemberCheck {
	static HashMap<Integer, Member> map = new HashMap<Integer, Member>();
	static int count = 1;
	static Scanner scan = new Scanner(System.in);

	public static void main(String[] args) {
		MemberCheck bc = new MemberCheck();
		while(true){
		System.out.println("회원관리 프로그램");
		System.out.print("<1>추가 <2>삭제 <3>출력 <4>저장 <5>로드 <6>종료 : ");

		switch (scan.nextInt()) {
		case 1:
			bc.add();
			break;
		case 2:
			bc.delete();
			break;
		case 3:
			bc.print();
			break;
		case 4 :
			bc.save();
			break;
		case 5:
			bc.load();
			break;
		case 6:
			bc.exit();
			break;

		}// switch
		}//while
	}// main

	private void save() {
		File file = new File("member.txt");
		try{
			FileOutputStream fos = new FileOutputStream(file);
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			
			oos.writeObject(map);
			
			oos.close();
			fos.close();
		}catch(Exception e){
			System.out.println("에러발생!!!");
			e.printStackTrace();
		}
		System.out.println("저장되었습니다.");
	}

	private void exit() {
		System.out.println("시스템을 종료합니다.");
		System.exit(0);
		scan.close();
	}

	private void print() {
		Set<Integer> set = map.keySet();
		System.out.println("번호\t이름\t나이\t전화번호\t주소\t행운숫자");
		for (Integer number : set) {
			String name = map.get(number).getName();
			int age = map.get(number).getAge();
			String numb = map.get(number).getNumb();
			String address = map.get(number).getAddress();
			int num = map.get(number).getNum();

			System.out.printf("%s\t%s\t%d\t%s\t%s\t\\t%d\t\n", number, name, age, numb, address, num);
		}
	}

	private void delete() {
		System.out.print("삭제하실 넘버를 입력해 주세요 : ");
		int num = scan.nextInt();
		if (map.containsKey(num)) {
			map.remove(num);
			System.out.println("삭제되었습니다.");
		} else {
			System.out.println("고객넘버를 잘못입력하셨습니다. 해당 정보가 없습니다.");
		}
	}

	private void add() {
		Member member = new Member();
		map.put(count, member.input(member));
		System.out.println("회원정보를 추가하였습니다.");
		count++;
	}
	
	private void load() {
		File file = new File("grade.txt");
		try{
			FileInputStream fis = new FileInputStream(file);
			ObjectInputStream oos = new ObjectInputStream(fis);
			
			map = (HashMap)oos.readObject();
			
			Set<Integer> set = map.keySet();
			System.out.println("번호\t이름\t나이\t전화번호\t주소\t행운숫자");
			for (Integer number : set) {
				String name = map.get(number).getName();
				int age = map.get(number).getAge();
				String numb = map.get(number).getNumb();
				String address = map.get(number).getAddress();
				int num = map.get(number).getNum();

				System.out.printf("%s\t%s\t%d\t%s\t\\t%s\t%d\t\n", number, name, age, numb, address, num);
			}
			oos.close();
			fis.close();
			
		}catch(Exception e){
			System.out.println("불러오는데 실패하였습니다.");
			e.printStackTrace();
		}
	}
}// class
