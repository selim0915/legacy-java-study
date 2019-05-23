package springbook.user.dao;

public class MessageDaoFactory implements DaoFactory {
  private String vendor;

  public MessageDaoFactory(String vendor) {
    this.vendor = vendor;
  }

  @Override
  public Dao makeDao() {
    Dao dao = new MessageDao(makeConnectionMaker(vendor));
    System.out.println("메세지 다오생성.");
    return dao;
  }

  @Override
  public ConnectionMaker makeConnectionMaker(String vendor) {
    ConnectionMaker cm = null;
    if (vendor.equals("N")) {
      System.out.println("오라클 커넥션메이커 생성.");
      cm = new NConnectionMaker();
    } else {
      System.out.println("MySQL 커넥션메이커 생성.");
      cm = new DConnectionMaker();
    }
    return cm;
  }

}
