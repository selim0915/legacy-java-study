import java.io.FileInputStream;
import java.io.FileOutputStream;

public class Ex03_Stram_CopyFile {

	public static void main(String[] args) throws Exception {

		String orifile = "C:\\Temp\\1.jpg";
		String targetfile = "copy.jpg";
		//default 경로 : C:\FrontEndBackEnd\JAVA\Labs\Ex09_IO
		//경로를 명시하지 않으면.. 프로젝트폴더가 default이다.
		
		FileInputStream fis = new FileInputStream(orifile);
		FileOutputStream fos = new FileOutputStream(targetfile);
		
		int data =0;
		while((data = fis.read())!= -1) {
			fos.write(data);
		}
		fos.close();
		fis.close();
		System.out.println("작업완료");
		
		
		
		
	}

}
