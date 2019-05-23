package springbook.user.dao;

public interface DaoFactory {
	Dao makeDao();
	ConnectionMaker makeConnectionMaker(String vendor);
}
