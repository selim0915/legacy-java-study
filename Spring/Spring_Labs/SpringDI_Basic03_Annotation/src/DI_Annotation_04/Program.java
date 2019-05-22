package DI_Annotation_04;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class Program {

	public static void main(String[] args) {
		/*
		 * //1. java코드 
		 * MonitorViewer viewer = new MonitorViewer(); 
		 * Recoder recoder = new
		 * Recoder(); 
		 * viewer.setRecoder(recoder);
		 * System.out.println(viewer.getRecoder());
		 */
		
		ApplicationContext context = 
				new GenericXmlApplicationContext("classpath:DI_Annotation_04/DI_Annotation_04.xml"); //classpath
		
		MonitorViewer viewer = context.getBean("monitorViewer", MonitorViewer.class);
		System.out.println(viewer.getRecoder());
	}

}
