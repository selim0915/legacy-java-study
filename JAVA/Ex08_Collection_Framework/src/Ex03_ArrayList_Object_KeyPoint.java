import java.awt.List;
import java.util.ArrayList;

import kr.or.bit.Emp;

public class Ex03_ArrayList_Object_KeyPoint {

	public static void main(String[] args) {
		
		//객체배열
		//1.사원 1명의 정보를 담으세요.
		Emp e = new Emp(100,"김유신","군인");
		System.out.println(e.toString());
		
		Emp e2 = new Emp(200,"김유신","경찰");
		System.out.println(e2);
		
		//사원2명을 만들어라
		Emp[] emplist = {new Emp(10, "kim", "it developer"), new Emp(20, "park", "sales")};
		for(Emp emp : emplist) {
			System.out.println(emp.toString());
		}
		
		System.out.println("----------");
//		Emp[] emplist2 = {new Emp(10,"a","a"), new Emp(20,"b","b")};
//		for(Emp emp : emplist2) {
//			System.out.println(emp.toString());
//		}
		Emp[] emplist2 = new Emp[2];
		emplist2[0] = new Emp(10,"c","c");
		emplist2[1] = new Emp(10,"c","c");
		for(int i=0; i<emplist2.length; i++) {
			System.out.println(emplist2[i]);
		}
		
		
		//사원 한명 추가
		//정적배열에는 추가를 하지 못함 >> 새로 만들어서 복사해야함..
		//동적 ArrayList
		ArrayList alist = new ArrayList();
		alist.add(new Emp(1,"kim","it"));
		alist.add(new Emp(2,"lee","it"));
		alist.add(new Emp(3,"park","sales"));
		System.out.println(alist);
		
		System.out.println("---------");
		ArrayList alist3 = new ArrayList();
		alist3.add(new Emp(30,"d","d"));
		alist3.add(new Emp(40,"d","d"));
		alist3.add(new Emp(50,"d","d"));
		
		
		for(int i=0; i<alist3.size(); i++) {
			Emp emp = (Emp)alist3.get(i);
			System.out.println(emp.getEmpno()+"/"+emp.getEname());
		}
			
		for(Object obj : alist3) {
			Emp emp = (Emp)obj;
			System.out.println(emp.getEname()+"/"+emp.getEname()+"/"+emp.getJob());
		}
			
			
		//일반 for을 사용하여 출력하기
		for(int i=0; i<alist.size(); i++) {
			//System.out.println(alist.get(i).toString());
			
			//각각의 정보를 가져오는 방법
			Emp emp =(Emp) alist.get(i); //Onject는 EMP보다 크고,, //*다운캐스팅
			//자식은 부모에게 다 주지만..
			//부모는 자식에게 맞춰 가야한다.
			System.out.println(emp.getEmpno()+"/"+emp.getEname()+"/"+emp.getJob());
		}
		
		for(Object obj : alist) {
			Emp emp2 =(Emp)obj; //다운 캐스팅 구문
			System.out.println(emp2.getEmpno()+"//"+emp2.getEname()+"//"+emp2.getJob());
		}
		
		
		
		//사실은 위의 코드가 불편해여 (Object)
		//generic (99%)
		ArrayList<Emp> alist2 = new ArrayList<Emp>();  //다운캐스팅 걱정 업다!
		alist2.add(new Emp(1,"a","it"));
		alist2.add(new Emp(2,"B","it"));
		for(Emp obj : alist2) {
			System.out.println(obj.getEmpno()+"/"+obj.getEname()+"/"+obj.getJob());
		}
		
		ArrayList<Emp> alist4 = new ArrayList<Emp>();
		alist4.add(new Emp(1,"2","3"));
		for(Emp emp : alist4) {
			System.out.println(emp.getEmpno());
		}
	}

}
