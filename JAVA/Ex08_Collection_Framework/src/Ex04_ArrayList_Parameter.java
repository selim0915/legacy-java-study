import java.util.ArrayList;
import java.util.Arrays;

class EmpData{
	private ArrayList alist;
	private int[] numbers;
	
	EmpData(){
		this.alist = new ArrayList();
		this.numbers = new int[10];
	}
	//alist >> getter(read return) , setter(write)
	
	//getter
	public ArrayList getAlist() {
		return this.alist;
	}
	//setter
	public void setAlist(ArrayList alist) {
		this.alist = alist;
	}
	
	//private int[] numbers;
	public int[] getNumbers() {
		return this.numbers;
	}
	
	public void setNumbers(int[] numbers) {
		this.numbers = numbers;
	}

	@Override
	public String toString() {
		return "EmpData [alist=" + alist + ", numbers=" + Arrays.toString(numbers) + "]";
	}
}

public class Ex04_ArrayList_Parameter {

	public static void main(String[] args) {
		EmpData empdata = new EmpData();
		System.out.println(empdata.toString());  // EmpData@15db9742
		
		ArrayList alist = new ArrayList();
		alist.add(1);
		alist.add(2);
		alist.add(3);
		
		empdata.setAlist(alist);
		System.out.println(empdata.getAlist()); 
		
		
		System.out.println(empdata.getAlist().toString());  // []  재정의

		ArrayList li = new ArrayList();
		li.add(100);
		li.add(200);
		li.add(300);
		
		empdata.setAlist(li);
		System.out.println(empdata.getAlist().toString());  // [100, 200, 300]
		
		ArrayList li2 = new ArrayList(100);  // 가능하다
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}