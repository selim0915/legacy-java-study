package springbook.user.dao;

import springbook.user.domain.Domain;

public interface Dao {
	int insert(Domain domain) throws Exception;
	int update(Domain domain) throws Exception;
	int delete(String id) throws Exception;
	Domain select(String id) throws Exception;
}
