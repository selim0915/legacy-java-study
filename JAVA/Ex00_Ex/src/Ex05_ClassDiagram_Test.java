import java.util.ArrayList;
import java.util.List;

class Bank {
	private ArrayList<Account> accounts; //계좌
	private int totalAccount; //총계좌수
	
	public Bank() {
		
	}
	
	public Bank(ArrayList<Account> accounts, int totalAccount) {
		super();
		this.accounts = accounts;
		this.totalAccount = totalAccount;
	}

	//계좌를 생성하는 기능
	public void addAccount(String accountNo, String name) {
		//List<Account> accounts = new ArrayList<>();
		accounts.add(new Account(accountNo, name));
		this.totalAccount++;
	}
	
	//계좌번호로 계좌를 찾는다.
	//public Account getAccount(String accountNo) {
	public void getAccount(String accountNo) {
		for(Account act : accounts) {
			if(act.getAccountNo().equals(accounts)) {
				System.out.println(act);
			}
		}
		//return accounts;
	}
	
	//소유자명으로 계좌를 찾는다.
	//public ArrayList<Account> findAccounts(String name) {
	public void findAccounts(String name) {
		for(Account act : accounts) {
			if(act.getAccountNo().equals(name)) {
				System.out.println(act);
			}
		}
		//return accounts;
	}
	
	//계좌목록을 본다.
	public ArrayList<Account> getAccounts() {
		for (Account val : accounts) {
			System.out.println(val);
		}
		return accounts;
	}
	
	//총계좌수를 반환한다.
	public int getTotalAccount() {
		return this.totalAccount;
	}
}

class Account{
	private String accountNo; //계좌번호
	private String name; //소유자명
	private long balance; //잔고
	private ArrayList<Transaction> transactions; //거래내역
	
	public Account(String accountNo, String name) {
		this.accountNo = accountNo;
		this.name = name;
		this.transactions = new ArrayList<Transaction>();
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setBalance(long balance) {
		this.balance = balance;
	}

	public void setTransactions(ArrayList<Transaction> transactions) {
		this.transactions = transactions;
	}

	//입금한다.
	public void deposit(long amount) {
		System.out.println(amount+"입금한다.");
		 this.balance += amount;
		 transactions.add(new Transaction("2018-01-01", "12:00", "입금", amount, this.balance));
	}
	
	//출금한다.
	public void withdraw(long amount) {
		//잔액이 0원일때 경고
		if(this.balance < amount) {
			System.out.println("잔고가 부족합니다.");
		} else {
			System.out.println(amount+"출금한다.");
			this.balance -= amount;
			transactions.add(new Transaction("2018-01-01", "12:00", "출금", amount, this.balance));
		}
	}
	
	//잔고를 확인한다.
	public long getBalance() {
		//System.out.print("잔고는 "+ this.balance);
		return balance;
	}
	
	//거래내역을 본다.
	public ArrayList<Transaction> getTransactions() {
		for(int i=0; i<transactions.size(); i++) {
			System.out.println(transactions.get(i));
		}
		return transactions;
	}

	@Override
	public String toString() {
		return "Account [accountNo=" + accountNo + ", name=" + name + ", balance=" + balance;
	}
}

class Transaction{
	private String transactionDate; //거래일
	private String transactionTime; //거래시간
	private String kind; //구분(입금, 출금)
	private long amount; //거래금액
	private long balance; //잔고
	
	public Transaction() {
		
	}
	
	public Transaction(String transactionDate, String transactionTime, String kind, long amount, long balance) {
		super();
		this.transactionDate = transactionDate;
		this.transactionTime = transactionTime;
		this.kind = kind;
		this.amount = amount;
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "Transaction [transactionDate=" + transactionDate + ", transactionTime=" + transactionTime + ", kind="
				+ kind + ", amount=" + amount + ", balance=" + balance + "]";
	}
	
	
}

public class Ex05_ClassDiagram_Test {

	public static void main(String[] args) {
		
		Account account = new Account("1234", "가나다");
		account.deposit(2000); //입금
		System.out.println(account.toString());
		account.deposit(500);
		System.out.println(account.toString());
////		account.deposit(1000);
		account.withdraw(1000); //출금
		System.out.println(account.toString());
////		account.withdraw(2000);
////		account.withdraw(2000);
		System.out.println(account.getBalance()); // 잔액확인
		System.out.println(account.toString());
		System.out.println(account.getTransactions()); //잔고출력
		System.out.println(account.toString());
//		
		///////////////////////////
		
		
//		Bank bank = new Bank();
//		bank.addAccount("1234", "우세림");
//		bank.addAccount("2345", "우애림");
//		bank.getAccount("1234");
//		bank.findAccounts("우세림");
//		
		//계좌 총 출력
		//System.out.println(bank.getTotalAccount());
	}
}
