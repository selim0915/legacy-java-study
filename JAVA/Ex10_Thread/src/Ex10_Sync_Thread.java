

//ATM 동시에 출금

//누군가 (출금행위)을 하면 다른사람은 대기한다. (행위 LOCK)

class Account2{
	int balance =1000;
	
	//void withdraw(int money) {
	synchronized void withdraw(int money) {
		//권한확인, 인증확인 등의 작업이 있엇다고 치자..!
		System.out.println("고객: " + Thread.currentThread().getName()); 
		//currentThread():현재스레드의 이름을 리턴함
		System.out.println("현재 잔액정보: "+this.balance);
		
		if(this.balance >= money) {
			try {
				Thread.sleep(1000); //은행업무 처리되는 과정(인증, 권한 등)
			} catch(Exception e) {
				System.out.println(e.getMessage());
			}
			this.balance -= money;
		}
		System.out.println("인출금액: "+ money);
		System.out.println("인출 후 잔액: "+this.balance);
	}
}

class Bank2 implements Runnable{

	Account2 acc = new Account2();
	
	@Override
	public void run() {
		while(acc.balance>0) {
			int money = ((int)(Math.random()*3)+1)*100;
			//100, 200, 300
			
			//실 출금 처리
			acc.withdraw(money);
		}
	}
}

public class Ex10_Sync_Thread {

	public static void main(String[] args) {
		Bank2 b2 = new Bank2(); //Bank만들면 Accont자동으로 만들어진다. !?!??!
		
		Thread thread = new Thread(b2, "park"); //(): 쓰레드가 동작할 객체의 주소값
		Thread thread2 = new Thread(b2, "kim"); 
		Thread thread3 = new Thread(b2, "lee"); 
		
		thread.start();
		thread2.start();
		thread3.start();
		
		
	}

}
