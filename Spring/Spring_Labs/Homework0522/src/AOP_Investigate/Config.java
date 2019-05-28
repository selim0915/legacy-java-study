package AOP_Investigate;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
@Configuration
@EnableAspectJAutoProxy
public class Config {
	
	@Bean
	public ResultCalc resultCalc() {
		return new ResultCalc();
	}
	@Bean
	public AOP aop() {
		return new AOP();
	}
}
