import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;

import kr.or.bit.UserInfo;

public class Ex15_ObjectDataOutputStream {

	public static void main(String[] args) {
		//UserInfo 객체를 만들어서 >> UserData.txt 파일에 >> write할거야
		
		String filename = "UserData.txt";
		try {
			FileOutputStream fos = new FileOutputStream(filename, true); //append(True)
			//데이터를 바꿔버리다. ??
			BufferedOutputStream bos = new BufferedOutputStream(fos);
			
			//객체 직렬화
			//객체 단위로 (줄을 세워서)
			ObjectOutputStream out = new ObjectOutputStream(bos); //보조스트림
			
			UserInfo u1 = new UserInfo("superman", "super", 500);
			UserInfo u2 = new UserInfo("scott", "tiger", 50);
			
			//직렬화작업 1줄 (객체단위로 write)
			out.writeObject(u1); //u1 객체를 조각내서 userData.txt write
			out.writeObject(u2);
			
			out.close();
			bos.close();
			fos.close();
			System.out.println("파일생성 >> buffer >> 직렬화");
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
