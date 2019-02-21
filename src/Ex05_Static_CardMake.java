import kr.or.bit.Card;

public class Ex05_Static_CardMake {

	public static void main(String[] args) {

		Card c3 = new Card();
		c3.number = 10;
		c3.kind = "별";
		c3.cardInfo();
		
		Card c = new Card();
		c.number = 1;
		c.kind = "별";
		//*변경사항 추가 , 아래도 다같이 바뀜(공유자원)
		c.h =500;
		c.w =200;
		c.cardInfo();
		
		Card c2 = new Card();
		c2.number = 10;
		c2.kind = "별";
		c2.cardInfo();
		
		// 이때 요구사항이 바뀐다면?
		// 카드 크기 수정 변경. h=500, w=200
		// class파일은 한번 적히면 수정할 수 없다, 즉 하나씩 53번을 반복해서 수정해야 한다.
		// static 자원을 사용하면, 한번의 변경을 통해 모든 값을 바꿀수 있다.
	}

}
