package kr.or.bit;

import java.io.Serializable;

/*
 객체를 주고 받는 방법 (객체통신)
 네트워크 ... (프로세스)
 파일과 파일간에 (파일에다 객체를 write 할 수 있다) 반대로 그 파일을 read도 할 수 있다.
 
 직렬화 Serializable
 : 객체를 분해해서 줄을 세워 보내는 과정
 역직렬화
 : 객체를 다시 조립해서 만드는 과정
 
 실습)
 대상 파일(txt)
 객체를 파일에다 write (직렬화)
 파일을 read (역직렬화)
 
 */

//객체통신의 조건
//(객체통신)설계도는 반드시 implements Serializable 구현해야 한다.

//implements Serializable 개체통신
public class UserInfo implements Serializable {
	public String name;
	public String pwd;
	public int age;
	
	public UserInfo() {}
	public UserInfo(String name, String pwd, int age) {
		this.name = name;
		this.pwd = pwd;
		this.age = age;
	}
	
	@Override
	public String toString() {
		return "UserInfo [name=" + name + ", pwd=" + pwd + ", age=" + age + "]";
	}
}
