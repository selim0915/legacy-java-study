import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import kr.or.bit.ExClass;

/*
 * 
 클래스를 설계시 내가 만드는 자원에 대해서 개발자가 강제로 예외처리를 하게하는 방법
 
 
 생성자, 함수 사용시 예외를 강제하도록 설계하는것 = throws 
 */
public class Ex04_Exception_throw {

	public static void main(String[] args) {
		
		//FileInputStream fi = new FileInputStream("C:\\Temp\\a.Txt");
//		try {
//			FileInputStream fi = new FileInputStream("C:\\Temp\\a.Txt");
//		} catch (FileNotFoundException e1) {
//			// TODO Auto-generated catch block
//			e1.printStackTrace();
//		}
		
		//ExClass ex = new ExClass("c:\\Temp");
		ExClass ex;
		try {
			ex = new ExClass("c:\\Temp");
			ex.call();
		} catch(IOException e){
			e.printStackTrace();
		} catch (ArithmeticException e) {
			e.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
