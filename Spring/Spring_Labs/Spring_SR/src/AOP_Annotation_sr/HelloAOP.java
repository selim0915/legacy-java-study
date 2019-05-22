package AOP_Annotation_sr;

import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class HelloAOP {
	@Pointcut("execution(* AOP_Annotation_sr.NewHello.nameHello(..))")
	public void pointcutMethod() {
		
	}
	
	@Before("pointcutMethod()")
//	@Before("within(AOP_Annotation_sr.*)")
	public void beforeMethod() {
		System.out.println("hi 메서드만 START");
	}
	
	
	@AfterReturning("execution(String *(..))")
	public void afterReturnMethod() {
		System.out.println("메서드 정상 작동");
	}
	
//	@AfterThrowing 
//	public void afterThrowingMethod() {
//		System.out.println("메서드 예외 발생"); 
//	}
	
//	@Around("pointcutMethod()") 
//	public void around() { 
//		System.out.println("메서드 END"); 
//	}
	
	
}
