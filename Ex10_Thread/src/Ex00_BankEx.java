import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.zip.DataFormatException;

class Bank2{
	private List<Account2> accounts; //계좌
	private int totalAccount; //총계좌 수
	
	//생성자
	public Bank2() {
		this.accounts = new ArrayList<>();
		this.totalAccount = 0;
	}

	//계좌를 생성한다
	public void addAccount(String accountNo, String name) {
		accounts.add(new Account2(accountNo, name));
	}
	
	//계좌를 계좌번호로 찾는다
	public Account getAccount(String accountNo) {
		return null;
	}
	
	//계좌를 이름으로 찾는다
	public List<Account2> findAccounts(String name) {
		return accounts;
	}
	
	//계좌 목록을 본다
	public List<Account2> getAccounts() {
		return accounts;
	}
	
	//총계좌수를 본다
	public int getTotalAccount() {
		return totalAccount;
	}
}

class Account2{
	private String accountNo; //계좌번호
	private String name; //이름
	private long balance; //잔고
	private List<Transaction2> transactions; //거래내역
	
	//생성자
	public Account2(String accountNo, String name) {
		this.accountNo = accountNo;
		this.name = name;
	}
	
	//입금한다.
	public void deposit(long amount) {
		this.balance += amount;
		System.out.println(amount + "원 입금했습니다. 총 잔액은: "+this.balance);
	}

	//출금한다.
	public void withdraw(long amount) {
		if(this.balance <= 0) {
			System.out.println("잔고가 0원입니다.");
		} else if(this.balance < amount) {
			System.out.println("출금잔고가 부족합니다. 현재 "+this.balance);
		} else {
			this.balance -= amount;
			System.out.println(amount + "원 출금했습니다. 총 잔액은: "+this.balance);
		}
	}
	
	//잔고를 확인한다.
	public long getBalance() {
		System.out.println("당신의 잔액은: "+this.balance);
		return balance;
	}
	
	//거래내역을 본다.
	public List<Transaction2> getTransaction() {
		return transactions; //transations.toString()
	}

	@Override
	public String toString() {
		return "계좌번호: " + accountNo 
				+ "\t 이름: " + name 
				+ "\t 잔고: " + balance 
				+ "\t 거내내역: " + transactions;
	}
	
	
}

class Transaction2{
	private String transationDate; //거래일
	private String transactionTime; //거래시간
	private String kind; //입금, 출금
	private long amount; //거래금액
	private long balance; //잔고
	private SimpleDateFormat sd;
	private SimpleDateFormat sd2;
	
	//생성자
	public Transaction2(String kind, long amount, long balance) {
		this.sd = new SimpleDateFormat("yyyy-MM-dd");
		this.transationDate = sd.format(new Date());
		this.sd2 = new SimpleDateFormat("HH:mm");
		this.transactionTime = sd2.format(new Date());
		this.kind = kind;
		this.amount = amount;
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "거래날짜: " + transationDate 
				+ "\t 거래시간: " + transactionTime 
				+ "\t 종류: " + kind 
				+ "\t 거래금액: " + amount 
				+ "\t 잔고: " + balance;
	}
	
}
public class Ex00_BankEx {

	public static void main(String[] args) {
		Account2 a2 = new Account2("1234", "우세림");
		a2.deposit(10000);
		a2.deposit(5000);
		a2.withdraw(15000);
		//a2.withdraw(1000);
		a2.getBalance();
		
		//a2.getTransaction();
		
		
		
	}

}
