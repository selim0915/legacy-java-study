import java.io.DataInputStream;
import java.io.FileInputStream;

//DataOutputStream으로 write한 데이터는 반드시 DataInputStream read해야한다.!

public class Ex14_DataInputStream {

	public static void main(String[] args) {

		//보조스트림 (DataOutputStream,DataInputStream,Buffer)
		int sum =0;
		int score=0;
		
		FileInputStream fis = null;
		DataInputStream dis = null;
		
		try {
			fis = new FileInputStream("score.txt");
			dis = new DataInputStream(fis); //DataInputStream가 도와줄거다
			
			while(true) {
				score = dis.readInt(); //쓴그대로 읽어 쓸 수 있다. //읽어드린게 정수로 읽어드리는게 대단한거다
				System.out.println("score int 타입: "+ score);
				sum +=score;
			}
			
		} catch (Exception e) {
			//값이 없으면 예외가 발생할 예정 , > 그때 멈출거다
			System.out.println("예외발생: "+e.getMessage());
			System.out.println("sum결과 : "+sum);
		} finally {
			try {
				dis.close();
				fis.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		
		
		
	}

}
