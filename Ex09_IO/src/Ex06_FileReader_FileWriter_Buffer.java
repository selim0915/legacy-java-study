import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class Ex06_FileReader_FileWriter_Buffer {

	public static void main(String[] args) {
		
		//파일이 없으면 만들까? 안만들까?
//		try {
//			FileWriter fw = new FileWriter("today.txt");
//			BufferedWriter bw = new BufferedWriter(fw);
//			
//			bw.write("로또");
//			bw.newLine(); // \n +\r 합한거(엔터)
//			bw.write("1,2,3,4,5");
//			
//			bw.flush(); //자리를 다 채우지않는이상. 쓰기 처리를 해주지 않는다.. 8190byte정도 채워야 한다.
//			//그떈 flush()로 강제로 보내줘야 한다.
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		FileReader fr = null;
		BufferedReader br = null;
		
		try {
			fr = new FileReader("Ex01_Stream.java");
			br = new BufferedReader(fr);
			
			//버퍼가 엔터를 지원해주는건 되게 편한 일..!
			
			String line="";
			
			//POINT
			//br.readLine(); 엔터를 기준으로 한줄씩 read POINT
			
			for(int i=0; (line =br.readLine())!= null; i++) { //string은 값이 없음 표시를 null로 한다.
				//System.out.println(line);
				
				
				//뒤에 가운데 앞에 원하는 문자가 표현된 문장만 읽고 싶다
				//Q: ;이 포함된 문자만 읽기
				
				if(line.indexOf(";") != -1) { //내가 찾는 문자의 인덱스가 존재하냐? 인덱스에 존재하지 않는다는 뜻은 -1
					System.out.println(line);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

}
