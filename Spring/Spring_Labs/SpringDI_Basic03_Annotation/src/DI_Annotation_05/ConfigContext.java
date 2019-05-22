package DI_Annotation_05;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/*
 ConfigContext 자바파일로 xml파일을 대체하겠다.
 
 이 파일을 가지고 객체의 생성과 주입작업을 하겠다.

 @Configuration (설정파일 명시)
 @Bean (객체생성을 명시) - 함수기반
 
 xml문서라면
 <bean id="user" class="DI_Annotation_05.User">
 <bean id="user2" class="DI_Annotation_05.User2">
 
 위 코드를 자바파일에선..
 함수로 만들어서 객체를 리턴하게 한다.
 
 
 */

@Configuration
public class ConfigContext {
	
	//함수이름이 ID
	@Bean
	public User user() { 
		// <bean id="user" class="DI_Annotation_05.User">
		return new User();
	}
	
	@Bean
	public User2 user2() {
		return new User2();
	}
}
