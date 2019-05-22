package AOP_Annotation_sr;

//주관심사 처리
public class NewHello implements Hello {

	@Override
	public String nameHello(String name) {
		System.out.println(name+ " 안녕!");
		return "hi";
	}

	@Override
	public String nameBye(String name) {
		System.out.println(name+ " 잘가!");
		return "bye";
	}

}
