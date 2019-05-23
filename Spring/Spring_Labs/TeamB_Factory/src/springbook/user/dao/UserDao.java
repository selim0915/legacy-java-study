package springbook.user.dao;

import springbook.user.domain.Domain;
import springbook.user.domain.User;

public class UserDao implements Dao {
	private ConnectionMaker connectionmaker;
	public UserDao(ConnectionMaker simpleconnectionmaker){
		this.connectionmaker = simpleconnectionmaker;
		System.out.println("유저 생성.");
	}

	@Override
	public Domain select(String id) throws Exception {
		System.out.println("유저 셀렉트.");
		return new User();
	}

	@Override
	public int insert(Domain domain) throws Exception {
		System.out.println("유저 인서트.");
		return 0;
	}

	@Override
	public int delete(String id) throws Exception {
		System.out.println("유저 딜리트.");
		return 0;
	}

	@Override
	public int update(Domain domain) throws Exception {
		System.out.println("유저 업데이트.");
		return 0;
	}
}
