package AOP_Annotation_kh;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.util.StopWatch;


@Aspect
public class LogPrintAroundAdvice{
	
	@Pointcut("execution(public * *(..))")
	private void pointcutMethod() {}
	
	@Around("pointcutMethod()")
	public Object invoke(ProceedingJoinPoint joinPoint) throws Throwable {
		
		//보조(공통) 업무
		Log log = LogFactory.getLog(this.getClass());
		StopWatch sw = new StopWatch();
		sw.start();
		log.info("타이머 시작");
		
		//주업무 (실객체의 함수 호출)
		Object result = joinPoint.proceed();
		
		//보조(공통)업무
		sw.stop();
		log.info("[타이머 종료]");
		log.info("[Time Log] Method : ALPHABAT");
		log.info("[Time Log] Method TIME : " + sw.getTotalTimeMillis());
		
		return result;
	}
	
}
