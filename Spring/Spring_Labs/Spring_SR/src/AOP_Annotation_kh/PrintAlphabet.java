package AOP_Annotation_kh;

import org.springframework.context.annotation.EnableAspectJAutoProxy;

@EnableAspectJAutoProxy
public class PrintAlphabet implements Alphabet {

	@Override
	public String AlphabetSection(char startAlphabet, char endAlphabet) {
		String result ="";
		StringBuffer sb = new StringBuffer();
		for(char ch=startAlphabet; ch<=endAlphabet; ch++) {
			sb.append(ch);
		}
		result = sb.toString();
		return result;
	}

	@Override
	public String AlphabetEnd(char endAlphabet) {
		String result ="";
		StringBuffer sb = new StringBuffer();
		for(char ch='a'; ch<=endAlphabet; ch++) {
			sb.append(ch);
		}
		result = sb.toString();
		return result;
	}


}
