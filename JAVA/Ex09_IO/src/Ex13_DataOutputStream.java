import java.io.DataOutputStream;
import java.io.FileOutputStream;

//보조스트림에 대하여 공부합시다
//얘는,,
//JAVA API 제공 8타입(타입별로 다 read, write 가능)클래 스
//DataOutputStream, DataInputStream

public class Ex13_DataOutputStream {

	public static void main(String[] args) {
		int[] score = {100, 60, 55, 97, 30};
		
		//타입을 인정하면서 write할수 있다.
		try {
			//보조스트림이라 혼자서 쓰지 못한다.
			FileOutputStream fos = new FileOutputStream("score.txt"); //FileOutputStream(): 없으면 만든다.
			
			//helper
			DataOutputStream dos = new DataOutputStream(fos);
			//DataOutputStream 통해서 score.txt. write하겠다.
			
			//배열은 한번에 쓸수 없어서 for문을 활용하여 작성
			for(int i=0; i <score.length; i++) {
				dos.write(score[i]);  //정수값을 write 할수 있따. 반드시 read는 DataOutputStream해야한다.
				
				//dos.writeUTF(str); //웹채팅할때 주로 사용(한글이 안 깨져서)
			}
			
			dos.close();
			fos.close();
			
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

}
