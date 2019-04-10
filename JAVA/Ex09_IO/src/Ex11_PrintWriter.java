import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.PrintWriter;

//PrintWriter 클래스를 사용하면 [출력형식 정의]
//친척: System.out.printf(), String.format()
public class Ex11_PrintWriter {

	public static void main(String[] args) {
		try {
			PrintWriter pw = new PrintWriter("C:\\Temp\\homework.txt");
			//PrintWriter() : 파일이 없다면 생성하고, 있다면 오버라이트한다. 
			pw.println("****************************");
			pw.println("**********HOMEWORK**********");
			pw.println("****************************");
			pw.printf("%3s : %5d	%5d	%5d	%5.1f", "아무개", 10, 90,88,(float)((10+90+88)/3));
			pw.println();
			pw.close();
			//출력형식을 정의한다 > 포멧팅이 가능하다.
			
			//read (Line단위) >> buffered가 line단위로 읽어오는게 가능햇다
			FileReader fr = new FileReader("C:\\Temp\\homework.txt");
			BufferedReader br = new BufferedReader(fr);
			String s ="";
			while((s=br.readLine()) != null) { //문자는 널, 배열은 -1
				System.out.println(s);
			}
			
			br.close();
			fr.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 

	}

}
