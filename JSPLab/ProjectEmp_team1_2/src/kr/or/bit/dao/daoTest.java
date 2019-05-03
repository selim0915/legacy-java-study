package kr.or.bit.dao;

import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;

public class daoTest {

	public static void main(String[] args) throws Exception {
//		Empdao dao = new Empdao();
		Map<Integer, String> dept = new HashMap<Integer, String>();
//		dept = dao.selectDeptList();
		
		dept.put(1, "A");
		dept.put(2, "B");
		dept.put(3, "C");
		
		for(int key : dept.keySet()) {
			System.out.printf("키: %s, 값: %s ", key, dept.get(key));
		}
	}

}
