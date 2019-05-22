package Spring_DI4;

import java.util.Scanner;

public class NewRecordView implements RecordView{
	//점수를 출력하는 클래스
	private NewRecord record;
	
	public void setRecord(Record record) { //parameter의 타입을 인터페이스로
		//함수의 파라미터를 통해서 NewRecord에 객체의 주소를 얻었다.
		this.record = (NewRecord) record;
	}
	
	@Override
	public void print() {
		System.out.println(record.total()+ " / " + record.avg());
	}

	@Override
	public void input() {
		Scanner scan = new Scanner(System.in);
		System.out.println("kor: ");
		record.setKor(Integer.parseInt(scan.nextLine()));
		System.out.println("eng: ");
		record.setEng(Integer.parseInt(scan.nextLine()));
		System.out.println("math: ");
		record.setMath(Integer.parseInt(scan.nextLine()));
	}
}
