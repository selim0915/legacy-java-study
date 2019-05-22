package DI_Annotation_03;

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

	//@Autowired(required=true) 기본설정(무조건:injection)
	@Autowired(required=false) //타입기반 (IOC 컨테이너 안에 REcorder타입을 가지는 객체가 있으면 자동주입
	public void setRecoder(Recoder recoder) {
		this.recoder = recoder;
		System.out.println("setter 주입 성공: " + recoder);
	}
	
}






