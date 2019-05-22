package DI_Annotation_01;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.AutowiredAnnotationBeanPostProcessor;

public class MonitorViewer {
	/*
	 * 1단계 xml 설정파일로 DI
	private Recoder recoder;

	public Recoder getRecoder() {
		return recoder;
	}

	public void setRecoder(Recoder recoder) {
		this.recoder = recoder;
	}
	*/
	
	//2단계: annotation 기반 DI작업(injection : 생성자, setter주입)
	//추가적으로 member field도 injection이 가능하다
	//@Autowired: IOC컨테이너 안에 Recorde라는 타입을 가진 객체가 있다면 자동으로 그 객체의 주소를 받는다.
	
	//	Recorder r = new Recorder();
	//	recorder = r;
	/*
		 <property name="recoder">
		 	<ref bean="recoder"/>
		 </property>
	 */
	
	
	/*
	 멤버필드 주입은 잘 하지 않는다.
	@Autowired
	private Recoder recoder;

	public Recoder getRecoder() {
		return recoder;
	}
	*/
	
	//setter를 통한 자동주입
	private Recoder recoder;
	
	public Recoder getRecoder() {
		return recoder;
	}

	@Autowired //타입기반 (IOC 컨테이너 안에 REcorder타입을 가지는 객체가 있으면 자동주입
	public void setRecoder(Recoder recoder) {
		this.recoder = recoder;
	}
}






