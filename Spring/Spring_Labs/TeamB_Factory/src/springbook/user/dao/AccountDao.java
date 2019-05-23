package springbook.user.dao;

import springbook.user.domain.Account;
import springbook.user.domain.Domain;

public class AccountDao implements Dao {
  private ConnectionMaker connectionmaker;

  public AccountDao(ConnectionMaker simpleconnectionmaker) {
    this.connectionmaker = simpleconnectionmaker;
    System.out.println("어카운트 생성.");
  }

  @Override
  public int insert(Domain domain) throws Exception {
    System.out.println("어카운트 인서트.");
    return 0;
  }

  @Override
  public int update(Domain domain) throws Exception {
    System.out.println("어카운트 업데이트.");
    return 0;
  }

  @Override
  public int delete(String id) throws Exception {
    System.out.println("어카운트 딜리트.");
    return 0;
  }

  @Override
  public Domain select(String id) throws Exception {
    System.out.println("어카운트 셀렉트.");
    return new Account();
  }
}
