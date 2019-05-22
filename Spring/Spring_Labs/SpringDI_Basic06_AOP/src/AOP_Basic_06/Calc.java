package AOP_Basic_06;

import org.springframework.aop.support.NameMatchMethodPointcut;
import org.springframework.aop.support.DefaultPointcutAdvisor;

public interface Calc {
	int ADD(int x , int y);
	int MUL(int x , int y);
	int SUB(int x , int y);
}
