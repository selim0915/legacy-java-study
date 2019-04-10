
class Product{//가전제품
	int price;
	int bonuspoint;
	
	Product(int price){
		this.price = price;
		this.bonuspoint = (int)(this.price/10.0);
	}
}

class KtTv extends Product{
	KtTv(){
		super(5000);
	}

	@Override
	public String toString() {
		return "KtTv";
	}
}

class Audio extends Product{
	Audio(){
		super(100);
	}

	@Override
	public String toString() {
		return "Audio";
	}
}

class Notebook extends Product{
	Notebook(){
		super(200);
	}

	@Override
	public String toString() {
		return "Notebook";
	}
}

class Buyer{
	int money =10000;
	int bonuspoint =0;
	
	/*
	 * 구매행위 만들기
	 * 구매행위 (잔액-제품가격, 포인트정보 갱신)
	 * 구매자는 매장에 있는 모든 제품을 구매 할 수 있어야 한다.
	 * 구매행위하는 함수 만들기 
	 * KtTv, Audio, Notebook
	 * 
	 * 
	 * 
	 * 2차
	 * 매장에 제품이 1000개의 다른 제품이 생겼다.
	 * 물건이 오면 매장에 자동 배치
	 * 세일> 고객> 구매
	 * ktTv, Audio, Notebook 제외한 제품은 구매 불가..!
	 * => 제품이 추가 되었을 때마다 구매함수를 구현해야 한다.
	 * 
	 * 2개선을 통해 메소드 이름을 공통 시켰다 (메서드오버로딩)
	 * 3차 개선 => 다형성
	 */
	
//	void ktTvBuy(KtTv ktTv) {
//		//구매한다는 이야기는 상품정보를 가져와야한다.
//		if(this.money < ktTv.price) {
//			System.out.println("잔액부족"); return;
//		}
//		
//		this.money -= ktTv.price;
//		this.bonuspoint += ktTv.bonuspoint;
//		
//		System.out.println("구매한 물건은 : "+ktTv.toString());
//	}
//	
//	void audioBuy(Audio audio) {
//		//구매한다는 이야기는 상품정보를 가져와야한다.
//		if(this.money < audio.price) {
//			System.out.println("잔액부족"); return;
//		}
//		
//		this.money -= audio.price;
//		this.bonuspoint += audio.bonuspoint;
//		
//		System.out.println("구매한 물건은 : "+audio.toString());
//	}
//	
//	void notebookBuy(Notebook notebook) {
//		//구매한다는 이야기는 상품정보를 가져와야한다.
//		if(this.money < notebook.price) {
//			System.out.println("잔액부족"); return;
//		}
//		
//		this.money -= notebook.price;
//		this.bonuspoint += notebook.bonuspoint;
//		
//		System.out.println("구매한 물건은 : "+notebook.toString());
//	}
	
	void Buy(Product product) {
		if(this.money < product.price) {
			System.out.println("잔액부족"); return;
		}
		
		this.money -= product.price;
		this.bonuspoint += product.bonuspoint;
		
		System.out.println("구매한 물건은 : "+product.toString());
	}
	
}

public class Ex12_Inherit_KwtPoint {

	public static void main(String[] args) {
		
//		KtTv tv =new KtTv();
//		System.out.println(tv.toString());
//		System.out.println(tv.price);
//		System.out.println(tv.bonuspoint);
		
		KtTv tv =new KtTv();
		Audio audio = new Audio();
		Notebook notebook = new Notebook(); //제품생산
		
		Buyer b =new Buyer();
		System.out.println(b.money);
		System.out.println(b.bonuspoint); //가진 돈
		
		b.Buy(notebook);
		b.Buy(audio);
		b.Buy(tv);
		
		System.out.println(b.money);
		System.out.println(b.bonuspoint); //남은 돈
	}

}
