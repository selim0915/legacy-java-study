package AOP_Investigate;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.util.StopWatch;

@Aspect
public class AOP {
	
	Log log = LogFactory.getLog(this.getClass());
	
	@Pointcut("execution(* AOP_Investigate.ResultCalc.Avg(..))")
	public void PointCut() {}
	

	
	@Around("PointCut()")
	public Object AroundAOP(ProceedingJoinPoint jp) {
		
		StopWatch sw = new StopWatch();
		log.info("[AOP Around Start]");
		sw.start();
		Object time = null;
		try {
			time = jp.proceed();
		} catch (Throwable e) {
			System.out.println("에러 :" + e.getMessage());
		}
		
		sw.stop();
		log.info("======== "+sw.getTotalTimeMillis() + "초 =========");
		log.info("[AOP Around End]");
		return time;
	}
	
	@AfterReturning(pointcut = "execution(int *(..))", returning = "result")
	public void Returnning(Object result) {
		log.info("[결과 값을 출력합니다.]");
		log.info(result.toString());
		log.info("================");
	}

}
