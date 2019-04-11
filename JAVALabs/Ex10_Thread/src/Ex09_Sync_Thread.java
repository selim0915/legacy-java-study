

//동기화
//한강 화장실 (공유자원) : 다수의 사용자가 화장실을 사용

//LOCK을 배우자 (장금장치)
//장금장치의 대상: 객체


//김씨가 화장실에서 일을 보다가 손을 씻고 싶어서 밖에 나가서 손을 씻고 들어왔어요
//다른 녀석이 화장실에 못 들어가게 막아요!


class Wroom{
	//public void openDoor(String name) {
	public synchronized void openDoor(String name) {
		System.out.println(name + "님 화장실 입장 ^^");
		for(int i=0; i<100; i++) {
			System.out.println(name + "님 사용: "+i);
			if(i==10) {
				System.out.println(name + "님 끙!");
			}
		}
		System.out.println("시원하다 ^^//");
	}
}

class User extends Thread{
	private Wroom wr;
	private String who;
	
	public User(String name, Wroom w) {
		this.who = name;
		this.wr = w; //화장실 주소값
	}
	
	@Override
	public void run() {
		wr.openDoor(this.who);
	}
}

public class Ex09_Sync_Thread {

	public static void main(String[] args) {
		//한강둔치
		Wroom w = new Wroom(); //화장실1개
		
		//사람들
		User kim = new User("권태환", w);
		User Lee = new User("권태환2", w);
		User Park = new User("권태환3", w);
		
		
		//시물레이션
		//모든사람들이 배탈이 났다.
		kim.start();
		Lee.start();
		Park.start();
	}

}
