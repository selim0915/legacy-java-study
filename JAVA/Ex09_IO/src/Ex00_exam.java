import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Ex00_exam {

	public static void main(String[] args) {
		
		FileInputStream fs = null;
		FileOutputStream fos = null;
		String path = "C:\\Temp\\a.txt";

		try {
			fs = new FileInputStream(path); // read
			fos = new FileOutputStream("C:\\Temp\\new.txt"); 
			
			int data = 0;
			while((data = fs.read())!= -1) {
				fos.write(data);  // new.txt (encoding)
			}

			
			
			
			
		} catch (Exception e) {
             System.out.println(e.getMessage());
		} finally {
             try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
             try {
				fs.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
	}

}
