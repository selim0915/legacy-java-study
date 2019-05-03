package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import kr.or.bit.dto.memo;
import kr.or.bot.utils.SingletonHelper;

//CRUD 작업을 할 수 있는 코드를 적는 곳
//DB서버 통신 > CRUD에 대한 method 제공
//memo table > select, insert, update, delete 함수 제공
//기본으로 5개(select 단일행, 다중행) : + 알파(like, 조건조회)

//CRUD 함수 생성(parameter, return type) 고민
//parameter 객체(dto 타입)
//return 객체, 문자열 리턴

//public int insertmemo(String id, String email, String content){}  (x)
//public int insertmemi(memo m){} 									(o)

//단일 select
//public memo selectByMemoId(String id) { .. where id=?}

//다중 select
//public List selectMemo (select 한 데이터 >> 객체담기)
//List<memo> list = new ArrayList<>();
//return list

public class memodao {

	Connection conn = null;
	
	public memodao(){
		conn = SingletonHelper.getConnection("oracle");
	}
	
	//단일행 조회
	public memo getMemoSelectID(String id) {
		memo memo =null;
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from memo where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				memo = new memo(); // 하나의 row 담기 위한 객체
				memo.setId(rs.getString("id"));
				memo.setEmail(rs.getString("email"));
				memo.setContent(rs.getString("content"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}

		return memo;	
	}
	
	//다중행 조회
	public List<memo> getMemoAllList(){
		List<memo> memolist = new ArrayList<>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "select * from memo";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				memo memo = new memo();
				memo.setId(rs.getString("id"));
				memo.setEmail(rs.getString("email"));
				memo.setContent(rs.getString("content"));
				memolist.add(memo);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
		
		return memolist;
	}
	
	//insert
	public int insertMemo(memo memo) {
		 PreparedStatement pstmt=null;
		 int rowcount = 0;
		 
		 try {
			 String sql="insert into memo(id, email, content) values(?,?,?)";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, memo.getId());
			 pstmt.setString(2, memo.getEmail());
			 pstmt.setString(3, memo.getContent());
			
			 rowcount = pstmt.executeUpdate(); 
			 
		 }catch (Exception e) {
			 e.printStackTrace();
		 }finally {
			 SingletonHelper.close(pstmt);
		 }
		 
		 return rowcount;
	}
	
	//insert2
	public int insertMemo(String id, String email, String content) {
		 PreparedStatement pstmt=null;
		 int rowcount = 0;
		 
		 try {
			 String sql="insert into memo(id, email, content) values(?,?,?)";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, id);
			 pstmt.setString(2, email);
			 pstmt.setString(3, content);
			
			 rowcount = pstmt.executeUpdate(); 
			 
		 }catch (Exception e) {
			 e.printStackTrace();
		 }finally {
			 SingletonHelper.close(pstmt);
		 }
		 
		 return rowcount;
	}
	
	//ID검증
	public String isCheckById(String id) {
		String ismemoid= null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			
				String sql = "select id from memo where id=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					//do {
						//String id = rs.getString("id")
						ismemoid = "false";
						
					//}while(rs.next());
				}else {
						ismemoid = "true";
				}
			
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			SingletonHelper.close(rs);
			SingletonHelper.close(pstmt);
		}
		//System.out.println("ismemoid : " + ismemoid);
		return ismemoid;
	}
	
}
