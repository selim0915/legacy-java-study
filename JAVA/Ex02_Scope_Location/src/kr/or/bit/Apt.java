package kr.or.bit;

public class Apt { //얘는 퍼블릭
	public String aptname; //public
	int door; //default
	private int window; //private (캡슐화)
	
	//간접할당
	//직접할당을 막고 간접할당을 통한 데이터 보호..를 한단다..
	public void write_window(int w) { //캡슐화 된 자원의 write기능의 함수
		if(w==0) {
			window = 100;
		} else {
			window = w;
		}
	}
	
	public int read_window() { //캡슐화 된 자원에 read기능의 함수
		return window;
	}
}
