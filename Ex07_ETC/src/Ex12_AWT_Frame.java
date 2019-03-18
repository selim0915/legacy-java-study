//import java.awt.Button;
import java.awt.Button;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

//AWT (CS프로그램을 만들 수 있는 class 제공)
//JAVA라는 언어로 메모장, 계산기등을 만들수 잇따. (현재 java는 웹 중심이라 이런건 만들지 않는다..)

//AWT >> SWING 순수자바코드로 버전업

class MyFrame extends Frame{
	public MyFrame(String title) {
		super(title);
	}
}


//**이벤트 구현 (이벤트 사건 만들어져 있다. click, mouseover)
class BtnClick_Handler implements ActionListener{ //ActionListener

	@Override
	public void actionPerformed(ActionEvent e) { //event :버튼을 클릭하면 발생하는 이벤트
		
		//안쪽 코드는 마음대로 적으세여
		//버튼 클릭 이벤트
		//버튼을 클릭하면 actionPerformed함수가 자동호출된다
		//만드는게 아니라 버튼에 붙여줘야한다. code75
		System.out.println("개발자가 원하는 행위 구현");
		
	} 
	
}



public class Ex12_AWT_Frame {

	public static void main(String[] args) {
		
		
		MyFrame frame = new MyFrame("LOGIN");
		
		frame.setSize(300,300); //사이즈 정하기
		frame.setVisible(true); //창이 보여라
		
		frame.setLayout(new FlowLayout());//레이아웃 환경설정 5개정도 잇음
		
		//버튼생성
		Button btn = new Button("button");
		Button btn2 = new Button("button too");
		Button btn3 = new Button("button toooo~");
		
		//버튼추가
		frame.add(btn);
		frame.add(btn2);
		frame.add(btn3);
		
		/*
		익명타입 (인터페이스를 직접 구현하지 않고 바로 객체를 만들어 쓰는 방법)
		코드량.. 
		일회성 (재사용성)
		btn.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				
			}
		});
		*/
		
		//ActionListener를 구현하는 클래스 객체생성( 재사용성이 가능하게 만들었다) btn, btn2
		BtnClick_Handler handler = new BtnClick_Handler();
		btn.addActionListener(handler); //이벤트를 버튼에 부여하기 >> addActionListener
		btn2.addActionListener(handler);
		
		btn3.addActionListener(new ActionListener() { //인터페이스를 직접 구현할 수 있다.
			//1개만 만들 땐 편하다
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println("인터페이스 직접 코딩");
				
			}
		});
		
		
		
		
	}

}
