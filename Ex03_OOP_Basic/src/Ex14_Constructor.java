import kr.or.bit.Employee;

public class Ex14_Constructor {

	public static void main(String[] args) {

		Employee emp = new Employee(); // default생성자 호출
		emp.empInfo();
		System.out.println(emp.getEname());
		
		Employee emp2 = new Employee(201901,"홍길동","영업팀");
		emp2.empInfo();
		System.out.println(emp2.getEname());
		emp2.setJob("개발팀");
		emp2.empInfo();
		
		//Array를 사용해서 사원3명을 만들어 보세요.
		//객체배열(8가지+String+array+클래스)
		//Employee[] emp3 = new Employee[3];
		Employee[] emp3 = {new Employee(1,"A","IT"), 
				new Employee(2,"B","SALES"),new Employee(3,"C","IT")};
		for(Employee e:emp3) {
			e.empInfo();
		}
		
		
		
	}

}
