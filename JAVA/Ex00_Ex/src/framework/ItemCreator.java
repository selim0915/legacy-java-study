package framework;

public abstract class ItemCreator {

	public Item create() {
		Item item;
		
		//step1
		requestItemInfo();
		//step2
		item = createItem();
		//step3
		createItemLog();
		
		return item;
	}
	
	abstract protected void requestItemInfo();
	
	abstract protected void createItemLog();
	
	abstract protected Item createItem();
}
