package springbook.user.dao;

public class AccountDaoFactory implements DaoFactory {
  private String vendor;
  
  public AccountDaoFactory(String vendor) {
    this.vendor = vendor;
  }
  
	@Override
	public Dao makeDao() {
		// TODO Auto-generated method stub
		Dao dao = new AccountDao(makeConnectionMaker(vendor));
		System.out.println("어카운트 다오 생성.");
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
