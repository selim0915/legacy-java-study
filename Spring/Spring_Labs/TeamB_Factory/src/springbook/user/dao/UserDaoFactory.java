package springbook.user.dao;

public class UserDaoFactory implements DaoFactory {
  private String vendor;
  
  public UserDaoFactory(String vendor) {
    this.vendor = vendor;
  }

	@Override
	public Dao makeDao() {
		Dao dao = new UserDao(makeConnectionMaker(vendor));
		System.out.println("유저 다오생성.");
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
