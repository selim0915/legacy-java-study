package kr.or.bit;
/*
 * 만든이: 홍길동
 * 날짜: 2019-02-08
 * 파일: Emp.java(사원정보)
 * 
 * class= 설계도=타입
 * 설계도의 기본 구성요소는: 상태정보, 고유정보..+행위정보)
 * 속성(변수, 필드) + 기능(함수, 메소드)
 */
public class Emp {
	public int empno; //사번(정보 > 변수 > member field (instance variable) > 객체변수
	public String ename;
	public String job;
	
	private int sal; //급여 (캡슐화, 은닉화:간접할당)이 목적.
	
	//sal 값을 write(set:내려놓고), read(get:가지고오고)
	public int getSal() { //읽어오는 친구
		return sal;
	}
	
	public void setSal(int sal) { //가져다가 쓰는 친구 //리턴값이 필요없음
		if(sal <0) {
			this.sal = 0;
		} else {
			this.sal = sal; //간접 할당 //순서 중요
		}
	}
	
	private int mgr;

	//캡슐화 된 멤버필드에 한해 읽어보고 불러오는 친구들을 겟터 셋터라고 부른다.
	public int getMgr() {
		return mgr;
	}

	public void setMgr(int mgr) {
		this.mgr = mgr;
	}
	
	public String getEmpInfo() {
		return empno + "/" + ename + "/" + job + "/" + sal;
	}
	
	
	
}
