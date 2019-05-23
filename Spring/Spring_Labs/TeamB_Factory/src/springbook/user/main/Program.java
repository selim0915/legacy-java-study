package springbook.user.main;

import springbook.user.dao.AccountDaoFactory;
import springbook.user.dao.Dao;
import springbook.user.dao.DaoFactory;
import springbook.user.dao.MessageDaoFactory;
import springbook.user.dao.UserDaoFactory;
import springbook.user.domain.Account;
import springbook.user.domain.Message;

public class Program {
  public static void main(String[] args) throws Exception {
    DaoFactory daoFactory = new MessageDaoFactory("N");
    Dao dao = daoFactory.makeDao();
    dao.update(new Message());

    daoFactory = new AccountDaoFactory("D");
    dao = daoFactory.makeDao();
    dao.insert(new Account());

    daoFactory = new UserDaoFactory("N");
    dao = daoFactory.makeDao();
    dao.select("권순조");
  }
}