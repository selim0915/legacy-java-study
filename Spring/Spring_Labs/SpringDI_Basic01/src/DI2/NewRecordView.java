package DI2;

import DI3.Record;

public class NewRecordView {
	//점수를 출력하기 위해선 NewReocord객체가 필요하다.
	
	private NewRecord record;
	
	//1. [생성자]를 통해서 필요한 객체를 생성하거나 or 주입받았다. >> DI
	//2. [함수]를 통해 (특수한 목적의 함수=setter)를 통해서 필요한 객체를 주입받을 수 있다. >>DI2
	
	public void setRecord(NewRecord record) {
		//함수의 파라미터를 통해서 NewRecord에 객체의 주소를 얻었다.
		this.record = record;
	}
	
	public void print() {
		System.out.println(record.total() + " / " + record.avg());
	}
	
}
