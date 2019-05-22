package AOP_Basic_07;

import org.springframework.aop.support.RegexpMethodPointcutAdvisor;


public interface Calc {
	int ADD(int x , int y);
	int MUL(int x , int y);
	int SUB(int x , int y);
}
