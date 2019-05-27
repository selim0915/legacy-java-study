package com.model;

import java.util.List;

//주문서 클래스
//하나의 주문은 여러개의 상품을 가질 수 있다.
public class OrderCommand {
	private List<OrderItem> orderItem;
	//ArrayList, Vector 통해서 주소값

	public List<OrderItem> getOrderItem() {
		return orderItem;
	}

	public void setOrderItem(List<OrderItem> orderItem) {
		this.orderItem = orderItem;
	}
	
	/*
	 	orderCommand command = new OrderCommand();
	 	//key point
	 	command.setOrderItem("상품목록");
	 	List<OrderItem> list = new ArrayList<>();
	 	list.add(new OrderItem(1, 10, "파손주의");
	 	list.add(new OrderItem(2, 100, "...");
	 	list.add(new OrderItem(3, 111, "사이즈 교환 불가");
	 	command.setOrderItem(list);
	 	
	 	Map > Map<>
	 */
	
}
