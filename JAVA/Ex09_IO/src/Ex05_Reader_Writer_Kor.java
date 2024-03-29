
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

/*
 한글의 문제점
 1. 한글은 1자에 2byte를 차지.. >> stream(1byte)통로에 한글이 통과 못함..
 2. 통로 하나 더 만들어 줄게 >>2byte가 지나갈 수 있는 통로가 필요 >>reader, writer
 */
public class Ex05_Reader_Writer_Kor {

	public static void main(String[] args) {
		//File reader, writer 작업

		FileReader fr =null;
		FileWriter fw =null;
		
		try {
			fr = new FileReader("Ex01_Stream.java");
			fw = new FileWriter("copy_Ex01.txt"); //복사본을 만들겠다
			
			int data =0;
			while((data = fr.read())!=-1) {
				System.out.println(data+ " : "+(char)data);
				//요구사항 :공백,엔터,탭은 제거하고 파일을 쓰세요
				//if(data!=' ' && data!='\t' && data!='\n' &&data!='\r') {
				//	fw.write(data);
				//}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				fw.close();
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
	}

}
