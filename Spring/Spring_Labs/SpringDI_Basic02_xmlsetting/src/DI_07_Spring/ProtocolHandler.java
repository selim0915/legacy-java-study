package DI_07_Spring;

import java.util.List;

// 이 클래스가 filter를 사용할것이다.
public class ProtocolHandler {
	private List<MyFilter> filters; //filters라는 Collection주소값
	
	public List<MyFilter> getFilters(){
		return this.filters;
	}
	
	public void setFilters(List<MyFilter> filters) {
		this.filters = filters;
	}
	
	//검증하는 함수
	public int filter_Length() {
		return this.filters.size();
	}
}
