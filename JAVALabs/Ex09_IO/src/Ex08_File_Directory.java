import java.io.File;

public class Ex08_File_Directory {

	public static void main(String[] args) {
		//System.out.println(args.length);
		//System.out.println(args[0]);
		//System.out.println(args[1]);
		
		if(args.length != 1) {
			System.out.println("사용법 : java파일명[디렉토리 명]");
			System.exit(0); //프로세스 강제종료
		}
		
		//java Ex08_File_Directory C:\\kkk (0)
		//java Ex08_File_Directory (x)
		
		File f =new File(args[0]);
		if(!f.exists() || !f.isDirectory()) {
			//디렉토리건 파일이건.. 존재하지 않거나 혹은 디렉토리가 아니라면
			System.out.println("유효하지 않는 경로이다.");
			System.exit(0);
		}
		
		//이제 분석 시작
		//POINT
		File[] files = f.listFiles(); //File 타입에 배열주소값을 리턴
		for(int i=0; i<files.length; i++) {
			String name = files[i].getName();
			System.out.println(files[i].isDirectory() ? "DIR-"+name : "FILE-"+name);
		}
		
	}

}
