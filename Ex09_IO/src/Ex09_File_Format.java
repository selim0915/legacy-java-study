import java.io.File;
import java.text.DecimalFormat;
import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.Date;


//포멧팅
public class Ex09_File_Format {

	public static void main(String[] args) {
		//Format클래스 (형식)
		
		//화폐단위처리
//		DecimalFormat df = new DecimalFormat("#,###.0"); //"#,###.0" 별도의 표 제공
//		String result = df.format(1234567.89);
//		System.out.println(result);
//		
//		
//		//날짜형식처리
//		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
//		String strDate = sd.format(new Date());
//		System.out.println(strDate);
//		
//		String message = "회원ID: {0} \n회원이름: {1} \n회원전화:{2}";
//		result = MessageFormat.format(message, "woo","우세림","1234-1234");
//		System.out.println(result);
		
		File dir = new File("C:\\Temp");
		File[] files = dir.listFiles(); //file배열에는 폴더와 파일이 모두 담긴다.
		
		for(int i=0; i<files.length; i++) {
			File file = files[i];
			
			String name = file.getName(); //name >> a.txt, name >> NEW
			
			SimpleDateFormat df = new SimpleDateFormat("yyy-MM-dd HH-mma");
			String attribute="";
			String size="";
			
			if(files[i].isDirectory()) {
				//데렉토리이다.
				attribute="<DIR>";
			}else {
				//파일이다.
				//a.txt, copy.jpg
				size = file.length() + "byte";
				attribute = file.canRead() ? "R" : "";
				attribute += file.canWrite() ? "W" : "";
				attribute += file.isHidden()? "H" : "";
			}
			System.out.printf("%s	%3s	%10s	%s	\n",
					df.format(new Date(file.lastModified())),
							attribute,
							size,
							name);
			
			
		}
		
		
	}

}
