package AOP_Basic_01;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.util.StopWatch;

/*
 간단한 계산기 프로그램
 -주관심(업무) 
 	1. 사칙연산(add, mul)
 -보조관심(공통사항)
 	1. 연산에 걸리는 시간
 	2. log에 출력(console출력) 시스템에서 출력하는 것처럼 RED색으로
 	
 */
public class Cal {
	public int add(int x, int y) {
		Log log = LogFactory.getLog(this.getClass());
		
		//System.currentTimeMillis()
		StopWatch sw = new StopWatch();
		sw.start();
		log.info("타이머 시작");
		
		int result = x+y;
		
		sw.stop();
		log.info("[타이머 종료]");
		log.info("[TIME LOG] METHOD : ADD");
		log.info("[TIME LOG] METHOD TIME : " + sw.getTotalTimeMillis());
		return result;
	}
	public int mul(int x, int y) {
		Log log = LogFactory.getLog(this.getClass());
		
		//System.currentTimeMillis()
		StopWatch sw = new StopWatch();
		sw.start();
		log.info("타이머 시작");
		
		int result = x*y;
		
		sw.stop();
		log.info("[타이머 종료]");
		log.info("[TIME LOG] METHOD : MUL");
		log.info("[TIME LOG] METHOD TIME : " + sw.getTotalTimeMillis());
		return result;
	}
	
}
