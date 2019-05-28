package AOP_Investigate;

public class ResultCalc implements Calc {

	@Override
	public int Sum(int x, int y) {
		return x+y;
	}

	@Override
	public int Avg(int x, int y) {
		return (x+y)/2;
	}

	@Override
	public int Div(int x, int y) {
		return x/y;
	}

}
