package kr.or.bit;

//stack 자료구조 설계
public class MyStack {

	// 힌트
	private int top; // 값이 변하는 곳을 담을 곳 (이동: 커서)
	private Object[] stackarr; // 데이터를 담을 공간
	private int maxsize;
	
	// 추가적으로 필요한 변수 추가

	public MyStack(int maxsize) { // 가질 방의 크기
		this.top = 0; // 젤 먼저 0값 세팅?
		stackarr = new Object[maxsize];
	}

	// 기능1. 스텍이 비어있는지(empty) 확인하는 함수
	public boolean isEmpty() {
		return (top==-1); //-1 값이 없으면
	}

	// 기능2. 스텍 크기가 넘었는지(full) 확인하는 함수
	public boolean isFull() {
		return (top == maxsize-1); //배열의 마지막 방번호가 top(전채크기초과 안되는데..)과 같으면
	}

	// 기능3. 스텍 push
	public void stackPush(Object obj) {
		if(isFull()) {
			System.out.println("배열 다참");
		} else {
			stackarr[++top] = obj;
		}
		
//		this.stackarr[top] = obj;
//		this.top++;
	}

	// 기능4. 스텍 pop
	public Object stackPop() {
		Object output = null;
		if(isEmpty()) {
			System.out.println("배열 없음");
		} else {
			output = stackarr[top];
			top--;
		}
		return output;
		
//		Object obj = this.stackarr[top-1];
//		this.top--;
//		return obj;
	}

}
