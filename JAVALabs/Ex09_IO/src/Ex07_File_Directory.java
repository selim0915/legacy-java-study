import java.io.File;

/*
 File 클래스
 1.파일(a.txt) > 생성, 수정, 삭제
 2. 디렉토리(폴더)(C:\\Temp) : 생성, 삭제   >> 자바는 파일클래스로 디렉토리도 같이 다룬다.
 
 POINT
 FileOutputStream, FileWriter 도 [파일생성기능]을 가지고 있다. <주 기능은 아니고
 
 7장에 배우는애가 주다.
 */


public class Ex07_File_Directory {

	public static void main(String[] args) {
		String path = "C:\\Temp\\file.txt"; //file.txt를 만들어져 있다는 전제
		File f = new File(path); //야 너 내가 file.txt줄테니까 분석 좀 해봐
		
		String filename = f.getName();
		System.out.println("파일명: "+ filename);
		System.out.println("전체경로: "+ f.getPath());
		System.out.println("절대경로 확인: "+ f.getAbsolutePath());
		System.out.println("폴더인지 아닌지 확인: "+ f.isDirectory()); //마지막 경로에 머물러 있니?
		System.out.println("파일인지 아닌지 확인: "+ f.isFile());
		System.out.println("파일크기: "+ f.length());
		System.out.println("부모경로를 가지고 있니: "+ f.getParent());
		System.out.println("파일 존재하는지 확인: "+ f.exists());
		
		//그외
		//f.creatNewFile() : 파일생성
		//f.delete() : 파일삭제 (turn true, false)
		//f.canWrite() : 쓰기 가능한 상태인지 묻는거
		
		
	}

}
