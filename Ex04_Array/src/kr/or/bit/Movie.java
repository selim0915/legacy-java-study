package kr.or.bit;

import java.util.Scanner;

class Seat {// 자리
	private int seatRow; // 자리행
	private int seatCol; // 자리열
	private boolean reserved; // 자리 주인 있음

	public int getSeatRow() {
		return seatRow;
	}

	public void setSeatRow(int seatRow) {
		this.seatRow = seatRow;
	}

	public int getSeatCol() {
		return seatCol;
	}

	public void setSeatCol(int seatCol) {
		this.seatCol = seatCol;
	}

	public boolean isReserved() {
		return reserved;
	}

	public void setReserved(boolean reserved) {
		this.reserved = reserved;
	}
}

class Reservation {
	private Scanner sc;
	private Seat mySeat;
	private static Seat[][] seats;
	static {
		seats = new Seat[3][3];
		for (int i = 0; i < seats.length; i++) {
			for (int j = 0; j < seats[i].length; j++) {
				Seat seat = new Seat();
				seats[i][j] = seat;
				seat.setSeatRow(i + 1);
				seat.setSeatCol(j + 1);
			}
		}
	}

	public Reservation() {
		sc = new Scanner(System.in);
	}

	private void reserveSeat() { // 자리 예매
		if (mySeat != null) {
			System.out.println("좌석 변경을 이용하세요. (1 ~ 3)");
		} else {
			try {
				System.out.println("원하는 좌석의 열을 입력하세요. (1 ~ 3)");
				int row = Integer.parseInt(sc.nextLine()) - 1; // 1번 줄을 선택했을때 [0]번 줄을 선택하기 위한 -1
				System.out.println("원하는 좌석의 번호를 입력하세요.");
				int col = Integer.parseInt(sc.nextLine()) - 1;
				if ((row >= 0 && row <= 2) && (col >= 0 && col <= 2)) {
					if (seats[row][col].isReserved()) {
						System.out.println("이미 예약된 좌석입니다.");
					} else {
						mySeat = seats[row][col];
						mySeat.setReserved(true);
						System.out.printf("선택하신 좌석, %d열 %d번째 좌석 예매가 완료되었습니다.\n", mySeat.getSeatRow(),
								mySeat.getSeatCol());
					}
				} else {
					throw new Exception();
				}
			} catch (Exception e) {
				System.out.println("올바른 숫자를 입력해주세요.");
			}
		}
		/*
		 * (내 자리 있음) // mySeat != null "자리 변경을 이용하세요"
		 * 
		 * (없음) // mySeat == null 자리 열 입력 자리 줄 입력 seat[열][줄] => 여기로 예약 내 자리 = 선택한 자리
		 */
	}

	private void mySeat() { // 내 자리 확인
		if (mySeat != null) {
			System.out.printf("예약하신 자리는 %d열 %d번째 자리입니다\n", mySeat.getSeatRow(), mySeat.getSeatCol());
		} else {
			System.out.println("예약하신 자리가 없습니다.");
		}
	}

	private void checkSeat() { // 빈 자리 확인
		System.out.println("이미 예약된 자리는 X로 표시됩니다");
		System.out.println();
		System.out.println("     [=======Screen=======]");
		System.out.println();
		for (int i = 0; i < seats.length; i++) {
			System.out.printf("%d열\t   ", i + 1);
			for (int j = 0; j < seats[i].length; j++) {
				if (seats[i][j].isReserved()) {
					System.out.print("[X]");
				} else {
					System.out.printf("[%d]", seats[i][j].getSeatCol());
				}
			}
			System.out.println();
		}
		/*
		 * (빈 자리)
		 * 
		 * 번호 표시
		 * 
		 * (주인 있는 자리) X 표시 "[1][2][3]" "[4][X][6]" "[7][8][9]"
		 */
	}

	private void changeSeat() { // 자리 변경
		if (mySeat == null) {
			System.out.println("좌석 예매를 먼저 해주세요.");
		} else {
			try {
				System.out.println("변경할 좌석의 열을 입력하세요. (1 ~ 3)");
				int row = Integer.parseInt(sc.nextLine()) - 1;
				System.out.println("변경할 좌석의 번호를 입력하세요. (1 ~ 3)");
				int col = Integer.parseInt(sc.nextLine()) - 1;
				if ((row >= 0 && row <= 2) && (col >= 0 && col <= 2)) {
					if (seats[row][col].isReserved()) {
						System.out.println("이미 예약된 좌석입니다.");
					} else {
						mySeat.setReserved(false);
						mySeat = seats[row][col];
						mySeat.setReserved(true);
						System.out.printf("선택하신 좌석, %d열 %d번째 좌석으로 변경 완료되었습니다.\n", mySeat.getSeatRow(),
								mySeat.getSeatCol());
					}
				} else {
					throw new Exception();
				}
			} catch (Exception e) {
				System.out.println("올바른 숫자를 입력해주세요.");
			}
		}
		/*
		 * (내 자리 없음) "좌석 예매를 먼저 해주세요"
		 * 
		 * (내 자리 있음) 변경할 자리 선택하세요 자리 열 입력 자리 줄 입력 원래 내 자리 주인 => 없음 내 자리 = 새롭게 선택한 자리
		 */
	}

	private void menuUI() { // 메뉴 그림
		System.out.println("영화 예매");
		System.out.println();
		System.out.println("1. 좌석 예매");
		System.out.println("2. 내 자리 확인");
		System.out.println("3. 빈 자리 확인");
		System.out.println("4. 자리 변경");
		System.out.println("5. 종료");
		System.out.println();
	}

	private int menuSelect() { // 메뉴에서 입력한 번호 받는 함수
		int menu = 0;
		do {
			try {
				menuUI();
				menu = Integer.parseInt(sc.nextLine());
				if (menu >= 1 && menu <= 5) {
					break;
				} else {
					throw new Exception("입력 값 문제");
				}
			} catch (Exception e) {
				System.out.println("1~5의 값을 입력해주세요.");
				System.out.println();
			}
		} while (true);
		return menu;
	}

	public void reservation() { // 예매하기
		Main: while (true) {
			switch (menuSelect()) {
			case 1:
				reserveSeat();
				System.out.println();
				break;
			case 2:
				mySeat();
				System.out.println();
				break;
			case 3:
				checkSeat();
				System.out.println();
				break;
			case 4:
				changeSeat();
				System.out.println();
				break;
			case 5:
				System.out.println("예매를 종료합니다.");
				System.out.println();
				break Main;
			}
		}
	}
}

public class Movie {

	public static void main(String[] args) {
		// 1번 사람이 예매를 끝내고
		// 2번 사람이 예매를 끝내고
		// 1번 사람이 다시 예매 시스템을 이용하는 상황

		Reservation r1 = new Reservation();
		r1.reservation();
		Reservation r2 = new Reservation();
		r2.reservation();
		r1.reservation();

//	private int[][] move;
//	private Scanner sc;
//	private static int su;
//
//	
//	//객체 주소값할당하고 1~25값을 넣는 는 메소드(초기화)
//	Movie(){
//		sc = new Scanner(System.in);
//		move = new int[5][5];
//	}
//	
//	//객체 주소값할당하고 1~25값을 넣는 는 메소드(초기화)
//	private void moveNum() {
//		for(int i=0; i<move.length; i++) {
//			for(int j=0; j<move[i].length; j++) {
//				
//				
//			}
//		}
//	}
//	
//	//메뉴를 출력하는 메소드 
//	private void moveMenu() {
//		System.out.println("***********");
//		System.out.println("1. 자리 예약하기");
//		System.out.println("2. 자리 확인하기");
//		System.out.println("3. 나가기");
//	}
//	
//	//영화관 자리 출력
//	private void movePrint(int[][] move) {
//		for (int i = 0; i < move.length; i++) {
//			for (int j = 0; j < move[i].length; j++) {
//				move[i][j] = j+1+i*5;
//				System.out.print(move[i][j] + "\t");
//			}
//			System.out.println();
//		}
//	}
//	
//	//사용자가 원하는 자리를 입력받는 메소드(반복) 
//	public void moveInput(Scanner sc) {
//		int user = Integer.parseInt(sc.nextLine());
//	}
//	
//	
//	//사용자가 입력한 자리가 비어있으면 예약, 비어있지않으면 자리있습니다 안내
//	
//	

	}

}
