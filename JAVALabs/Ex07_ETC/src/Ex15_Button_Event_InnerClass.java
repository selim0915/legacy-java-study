import java.awt.Button;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.Label;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;

/*class Btn_Handler2 implements ActionListener{ //얘를 반드시 해줘야한다. 
	private TextField txtid;
	private TextField txtpwd;
	
	//생성자 오버로딩으로 함수 받기
	public Btn_Handler2(TextField txtid, TextField txtpwd) {//위에서 주소값 2개를 받음
		//생성자를 통해서 TextField의 주소값을 받는다.
		this.txtid =txtid;
		this.txtpwd = txtpwd;
	}
	
	//id,pwd를 입력하고 버튼을 클릭하면 id,pwd값을 가지고와서 내가 미리 지정한 값과 일치하는지 확인
	
	
	
	//클릭이벤트가 발생하면 호출되는 함수(핸들러 함수)
	@Override
	public void actionPerformed(ActionEvent e) {
		//필요한 로직
		//System.out.println("ActionEvent발생지의 객체 주소: "+e.getSource());
		System.out.println(txtid.getText()+"/"+txtpwd.getText()); //getText(): 텍스트가져오기
		
		if(txtid.getText().equals("hong")) {
			System.out.println("방가방가 / "+ txtpwd.getText());
		} else {
			System.out.println("홍이 아니다.");
		}
	}
	
}*/

class LoginForm3 extends Frame{
	Label lbl_id;
	Label lbl_pwd;
	TextField txt_id;
	TextField txt_pwd;
	Button btn_ok;
	
	//inner construbtor
	public LoginForm3(String title) {
		super(title);
		lbl_id = new Label("ID: ", Label.RIGHT);
		lbl_pwd = new Label("PWD: ", Label.RIGHT);
		
		txt_id =new TextField(10); //10개의 글자가 들어갈 칸의 넓이
		txt_pwd = new TextField(10); 
		txt_pwd.setEchoChar('*'); //글작성시 문자가 보이는게 아니라 *로보이게 한다.
		btn_ok = new Button("login");
		
		this.setLayout(new FlowLayout()); //add한 순서대로 보이게
		this.setSize(500, 100); //프레임 크기
		this.setVisible(true); //화면에 보여져라
		
		this.add(lbl_id);
		this.add(txt_id);
		
		this.add(lbl_pwd);
		this.add(txt_pwd);
		
		this.add(btn_ok);
		
		
		//15번
		//1. 다른 클래스 자원을 사용(생성자 주소값 받기)
		//2. innerclass 사용해서 id,pwd자원을 사용하자 << 결국 클래스를 만든건 같다
		//3. 클래스까지 만들 필요가 있나요?
		//3.1 재사용성이 중요하지 않나요?
		//3.2 어차피 지금의 코드는 재사용의 의미가 없어요~
		
		//최종 - 단점: 1회성만 사용할 수 있다. 장점: 코드를 빨리 구현할 수 있다.
		//익명 타입으로 가자 (실제로 인터페이스는 직접 객체 생성이 불가능 합니다)
		//인터페이스 클래스없이도 직접 구현하는 방법 제공(익명 타입)
		
		btn_ok.addActionListener(new ActionListener() { //<<익명타입이라고 한다.
			
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println(txt_id.getText()+"/"+txt_pwd.getText());
				String id = txt_id.getText().trim();
				String pwd = txt_pwd.getText();
				
				if(id.equals("hong")) {
					System.out.println("3. hong 하이!"+pwd);
				} else {
					System.out.println("3. 안녕!"+pwd);
				}
			}
		});
		
		//익명타입을 사용하여 인터페이스를 직접 구현한거.
		//사용하지 않는 추상함수도 구현하고 있다.
		this.addWindowListener(new WindowAdapter() { //얘는 일반클래스: 필요한것만 재정의 할수 있다.
			@Override
			public void windowClosing(WindowEvent e) {
				//창이 닫히길 원함
				e.getWindow().setVisible(false); //창이 안보이게 함
				e.getWindow().dispose(); //프로그램이 끝나게 함
			}
		});
		
		/*
		this.addWindowListener(new WindowListener() {
			
			@Override
			public void windowOpened(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowIconified(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowDeiconified(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowDeactivated(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowClosing(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowClosed(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void windowActivated(WindowEvent e) {
				// TODO Auto-generated method stub
				
			}
			
		});
		*/
		
	}
}
public class Ex15_Button_Event_InnerClass {

	public static void main(String[] args) {
		LoginForm3 login = new LoginForm3("로그인"); 
	}

}
