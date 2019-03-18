package concrete;

import java.util.Date;

import framework.Item;
import framework.ItemCreator;

public class HpCreator extends ItemCreator{

	@Override
	protected void requestItemInfo() {
		System.out.println("데이터 베이스에서 체력회복 물량 가져옴");
	}

	@Override
	protected void createItemLog() {
		System.out.println("체력회복물약을 새로 생성 "+ new Date());
	}

	@Override
	protected Item createItem() {
		//작업
		return new Hppotion;
	}

}
