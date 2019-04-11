package concrete;

import framework.Item;

public class Hppotion implements Item {

	@Override
	public void use() {
		System.out.println("마력 회복");
	}

}
