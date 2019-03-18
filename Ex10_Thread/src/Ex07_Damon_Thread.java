

//데몬스레드
// damon Thread (보조스레드) : 한글작업 시 3초마다 자동저장되는거 같은 거 (한글이 끝나면 저장이 끝나듯)
//						: 보조스레드도 메인이 끝나면 끝난다.




public class Ex07_Damon_Thread implements Runnable{

	static boolean autosave = false; //자동실행 false 세팅
	
	@Override
	public void run() {//damon thread로 구현
		while(true) { //무한루프
			try {
				Thread.sleep(3000);//3초마다 쉬기
			}catch(Exception e) {
				
			}
			if(autosave) { //autosave가 true이면 .. 이런 뜻
				//if() 조건안에 true, false를 직접적으로 적어줄수 있다. 
				//false이면 무한루프, true면 메서드 실행
				autoSaveFunction(); //출력한다.
			}
		}
	}
	
	public void autoSaveFunction() {
		System.out.println("문서가 3초 간격으로 자동 저장됩니다.");
	}
	
	public static void main(String[] args) { //일반스레드 (setDamon으로 지정해주지 않은 것은 다 일반 스레드)
		
		
		Thread th = new Thread(new Ex07_Damon_Thread()); //implements Runnable을 하는 객체의 주소
		//Ex07은 implements 해서, 스레드클래스를 상속 받지않아서, 스레드 객체에 담아줘야 스레드로 사용이 가능하다
		//스레드생성자()에 객체나, new 클래스로 쓰레드에 사용할 주소를 담아준다.  
		
		th.setDaemon(true); //damon사용 시 동작전에 보조스레드라는 것을 알려줘야한다.
		//setDaemon(): th객체를 보조스레드로 사용할 건가 (true) 
		th.start();
		//start(): 스레드 실행
		
		
		//main함수 (Ex_Damon_Thread 보조)
		//main( 글쓰기 역할 구현)
		for(int i=0; i<=30; i++) { // 0~30
			try {
				Thread.sleep(1000);
			}catch (Exception e) {
				// TODO: handle exception
			}
			System.out.println("Main Thread "+ i);
			if(i==5) {
				//i가 5가 되는 시점 부터
				System.out.println(i);
				autosave =true;
			}
		}
		
		
		
	}

}
