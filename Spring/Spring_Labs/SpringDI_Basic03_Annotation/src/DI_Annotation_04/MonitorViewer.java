package DI_Annotation_04;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor;
import org.springframework.beans.factory.annotation.Qualifier;

public class MonitorViewer {
	
	//setter를 통한 자동주입
	private Recoder recoder;
	
	public Recoder getRecoder() {
		return recoder;
	}

	//@Autowired :같은 타입의 객체가 여러개 있어서 예외남
	@Resource(name="zz") //by name (같은 타입이 있더라도 name 으로 선택)
	public void setRecoder(Recoder recoder) {
		this.recoder = recoder;
		System.out.println("setter 주입 성공: " + recoder);
	}
	
}






