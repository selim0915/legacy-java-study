package springbook.user.dao;

import springbook.user.domain.Domain;
import springbook.user.domain.Message;

public class MessageDao implements Dao{
	private ConnectionMaker connectionmaker;
	public MessageDao(ConnectionMaker simpleconnectionmaker){
		this.connectionmaker = simpleconnectionmaker;
		System.out.println("메세지 생성.");
	}
	
	@Override
	public int insert(Domain domain) throws Exception {
		System.out.println("메세지 인서트.");
		return 0;
	}

	@Override
	public int update(Domain domain) throws Exception {
		System.out.println("메세지 업데이트.");
		return 0;
	}

	@Override
	public int delete(String id) throws Exception {
		System.out.println("메세지 딜리트.");
		return 0;
	}

	@Override
	public Domain select(String id) throws Exception {
		System.out.println("메세지 셀렉트.");
		return new Message();
	}
}
