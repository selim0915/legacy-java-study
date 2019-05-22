import java.awt.Button;
import java.awt.FlowLayout;
import java.awt.Frame;
import java.awt.Label;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

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

class LoginForm2 extends Frame{
	Label lbl_id;
	Label lbl_pwd;
	TextField txt_id;
	TextField txt_pwd;
	Button btn_ok;
	
	//inner construbtor
	public LoginForm2(String title) {
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
		
		
		//13번 코드를 inner클래스로 변경해보겠다.
		//(inner class >> Outer class 의 자원을 사용 가능)
		class Btn_Handler3 implements ActionListener{
			//inner 클래스가 외부 클래스 자원을 막 가져다 슴
			
			@Override
			public void actionPerformed(ActionEvent e) {
				System.out.println(txt_id.getText()+"/"+txt_pwd.getText());
				String id = txt_id.getText().trim();
				String pwd = txt_pwd.getText();
				
				if(id.equals("hong")) {
					System.out.println("hong 하이!"+pwd);
				} else {
					System.out.println("안녕!"+pwd);
				}
			}
			
		}
		
		btn_ok.addActionListener(new Btn_Handler3()); //버튼에 이벤트추가
		
	}
}
public class Ex14_Button_Event_InnerClass {

	public static void main(String[] args) {
		LoginForm2 login = new LoginForm2("로그인"); 
	}

}
