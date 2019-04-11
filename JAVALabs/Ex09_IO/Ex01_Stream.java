import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.util.Arrays;

/*
 I/O 
 1. stream (연결통로, 입출력통로, 중간매개체) ex)빨대
 2. stream (통로의 크기가 정해져 있다 >> 입출력 크기가 정해져있다.) byte단위로 입출력이 가능하다.
 		>> Byte배열을 가지고 활용한다.
 3. JAVA API 제공하는 입력 출력 클래스를 공부해보자.!
 
 Stream(Byte)
 inputStream(read),   outputStream(write)
 두개의 추상클래스는 상속을 통한 재정의가 목적(강제구현)
 
  대상(memory)
 ByteArrayInputStream   ,	ByteArrayOutputStream
 
 대상(File)
 FileInputStream ,	FileOutputStream
 
 대상(Piped)
 PipedInputStream ,	PipedOutpurStream
 
 대상(Audio)
 AudioInputStream,	AudioOutputStream
 
 추가적으로 도움을 주는 클래스(성능을 좋아지게 해주는)
 Buffer (IO성능 향상)
 BufferedInputStream,	BufferedOutputStream
 
 
 
 
 */
public class Ex01_Stream {

	public static void main(String[] args) {
		// Memory(Array, Collection)
		// Byte(-128~127) 정수값을 저장
		byte[] inSrc = {0,1,2,3,4,5,6,7,8,9};
		System.out.println(inSrc[5]);
		
		byte[] outSrc = null; //null를 가지는 배열은 메모리를 가지고 있지 않다.
		ByteArrayInputStream input = null; //ByteArrayInputStream을 통해 읽어올수 있다.
		ByteArrayOutputStream output = null; //ByteArrayOutputStream 데이터 통로를 통해 내보낼 수 있다.
		
		input = new ByteArrayInputStream(inSrc);
		//inSrc 배열주소 read()
		output = new ByteArrayOutputStream(); //write대상이 memory라서 출력값 적지않았다.
		
		System.out.println("before output: "+ Arrays.toString(outSrc));
		
		
		//공식같은 로직
		int data =0;
		//배열의 값이 없다는 -1
		//값이 있으면 계속 돌아라~
		while((data=input.read()) != -1) { //read()의 리턴타입은 정수값이다
			System.out.println("data: "+data);
			
			output.write(data); //data값을 자기자신(output)에게 내보낸다.
			//write대사이 ByteArrayOutputStream read() -> write
		}
		outSrc = output.toByteArray();
		//자신이 가지고 있는 값을 배열형태로 만들어서 outSrc에게 주소값을 할당해준다.
		System.out.println("outSrc: after >> "+Arrays.toString(outSrc));
		
		
//		while(input.read() != -1) { //read()의 리턴타입은 정수값이다
//			System.out.println("data: "+input.read());
//		}
		/*
		 * data: 1
			data: 3
			data: 5
			data: 7
			data: 9
			read()함수는 내부적으로 next기능을 가지고 있다.
		 */
		
		
	}

}
