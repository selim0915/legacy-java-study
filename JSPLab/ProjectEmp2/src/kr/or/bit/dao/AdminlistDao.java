package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.or.bit.dto.AdminList;
import kr.or.bit.dto.Emp;


public class AdminlistDao {
	DataSource ds = null;
	
	public AdminlistDao() throws Exception {
		//conn = SingletonHelper.getConnection("oracle");
		 Context context = new InitialContext(); //이름기반 검색
		 ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); ///jdbc/oracle pool 검색
	}
	
	//admin id 조회
	public AdminList getAdminlist (String userid) {
		AdminList admin = new AdminList();
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM ADMINLIST WHERE USERID=?";
		try {
			conn = ds.getConnection();
			//
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				admin.setUserid(rs.getString("userid"));
				admin.setPwd(rs.getString("pwd"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {rs.close();} catch (Exception e){};
			try {pstmt.close();} catch (Exception e){};
			try {conn.close();} catch (Exception e){};
		}
		
		return admin;
	}

	//admin 데이터 삽입
	public int insertAdminlist(AdminList admin) {
		int row = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "INSERT INTO ADMINLIST(USERID, PWD) VALUES(?,?)";
		try {
			conn = ds.getConnection();
			//
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, admin.getUserid());
			pstmt.setString(2, admin.getPwd());
			
			row=pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception e){};
			try {conn.close();} catch (Exception e){};
		}
		
		return row;
	}

}
