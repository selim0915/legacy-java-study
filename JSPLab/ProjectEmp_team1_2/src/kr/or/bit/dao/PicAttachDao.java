package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.or.bit.dto.PicAttach;

public class PicAttachDao {
	DataSource ds = null;
	
	public PicAttachDao() throws Exception {
		//conn = SingletonHelper.getConnection("oracle");
		 Context context = new InitialContext(); //이름기반 검색
		 ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); ///jdbc/oracle pool 검색
	}
	
	public int insertPicAttach(PicAttach dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		
		String sql = "INSERT INTO PIC_ATTACH(EMPNO, FILENAME) VALUES(?,?)";
		try {
			conn = ds.getConnection();
			//
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getEmpno());
			pstmt.setString(2, dto.getFilename());
			
			row = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {pstmt.close();} catch (Exception e){};
			try {conn.close();} catch (Exception e){};
		}
		
		return row;
	}
	
	public PicAttach selectPicAttachbyEmpNo(int empno) {
		PicAttach pics = new PicAttach();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT * FROM PIC_ATTACH WHERE EMPNO=?";
		try {
			conn = ds.getConnection();
			//
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, empno);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				pics.setEmpno(rs.getInt("empno"));
				pics.setFilename(rs.getString("filename"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {rs.close();} catch (Exception e){};
			try {pstmt.close();} catch (Exception e){};
			try {conn.close();} catch (Exception e){};
		}

		return pics;
	}

}
