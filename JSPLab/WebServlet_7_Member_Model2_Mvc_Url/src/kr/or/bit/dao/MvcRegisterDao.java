package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.or.bit.dto.MvcRegister;

public class MvcRegisterDao {

	static DataSource ds;
	//1. 일반생성자에서 ds을 객체 초기화 할수 없다.
	//static { static 멤버 초기화 }
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	static {
		InitialContext ctx; //이름 기반으로 찾는 방식 클래스
		
		try {
			//Context context = new InitialContext();
			//ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
			ctx = new InitialContext();
			Context envctx = (Context)ctx.lookup("java:comp/env"); //java:comp/env애가 기본값이라고 구분진거 한번더 들어가서 찾아야한다.
			ds = (DataSource)envctx.lookup("/jdbc/oracle");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//
	//
	//여기서 부터 crud함수 만들기!!
	//insert
	public int writeOk(MvcRegister dto) {
		int row =0;
		
		try {
			conn = ds.getConnection();
			String sql = "insert into mvcregister(id, pwd, email) values ( ?, ?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getId()); //가져온 값을 넣는다.
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			row = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.getMessage();
			row = -1;
		} finally {
			//연결해제 close
			if(pstmt != null) { try{pstmt.close();}catch(Exception e) {e.printStackTrace();}}
			//conn반환 colse
			if(conn != null) { try{conn.close();}catch(Exception e) {e.printStackTrace();}}
		}
		
		return 0;
	}
	
	//단일 select
	
	//다중 select
	
	//update
	
	//delete
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
