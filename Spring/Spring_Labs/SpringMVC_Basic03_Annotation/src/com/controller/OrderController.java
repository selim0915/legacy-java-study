package com.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.model.OrderCommand;
import com.model.OrderItem;


//주문화면(UI), 주문(처리)
//1.하나의 요청 주소(method="GET, POST") 를 정해서 화면을 보여줄건지, 처리할건지 결정

//다른방식 : 요청주소 > 화면 order.do
//				> 처리 orderOk.do

//하나의 주소 : order.do : 화면, 처리 모두


@Controller
@RequestMapping("/order/order.do") //객체가 주소단위로 매핑해야한다.
public class OrderController {
	
	@RequestMapping(method=RequestMethod.GET) //화면전달
	public String form() {
		
		return "order/OrderForm";
	}
	
	@RequestMapping(method = RequestMethod.POST) //결과처리
	public String submit(OrderCommand orderCommand) { //OrderCommand orderCommand 자동으로 빈 객체 생성
		System.out.println("orderCommand 주소  : " +orderCommand);
		System.out.println("orderCommand의 Item크기 : " +orderCommand.getOrderItem().size());
		
		//검증하는 코드를 넣고 싶다..
		List<OrderItem> items = orderCommand.getOrderItem();
		for(OrderItem item : items) {
			System.out.println(item.toString());
		}
		
		//OrderCommand orderCommand 하면 자동 forward된다
		//(객체이름 >> orderCommand)로 저장
		// ==request.setAttribute("orderCommand", orderCommand)
		return "order/OrderCommited";
	}
}
