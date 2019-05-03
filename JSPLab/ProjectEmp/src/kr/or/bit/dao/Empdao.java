package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.or.bit.dto.Emp;

public class Empdao {
	DataSource ds = null;
	
	public Empdao() throws NamingException {
		//conn = SingletonHelper.getConnection("oracle");
		 Context context = new InitialContext(); //이름기반 검색
		 ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle"); ///jdbc/oracle pool 검색
	}
	
	//전체 사원 조회
	public List<Emp> getEmpAllList() {
		Connection conn= null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		List<Emp> emplist = new ArrayList<Emp>();
		try {
			conn = ds.getConnection();
			String sql = "select empno,ename, job, mgr, hiredate, sal, nvl(comm, 0) comm, deptno from Emp";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Emp e = new Emp();
				e.setEmpno(rs.getInt("empno"));
				e.setEname(rs.getString("ename"));
				e.setJob(rs.getString("job"));
				e.setMgr(rs.getInt("mgr"));
				e.setHiredate(rs.getDate("hiredate"));
				e.setSal(rs.getInt("sal"));
				e.setComm(rs.getInt("comm"));
				e.setDeptno(rs.getInt("deptno"));
				emplist.add(e);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt!=null)try {pstmt.close();}catch(Exception e) {}
			if(conn!=null)try {conn.close();}catch(Exception e) {}
			if(rs!=null)try {rs.close();}catch(Exception e) {}
		}
		return emplist;
	}
	
	//사원 번호 조회
	public Emp getEmpnoList(String empno) {
		return null;
	}
	
	//부서 번호 조회
	public List<Emp> getDeptnoList(String detpno) {
		return null;
	}
	
	//사원 등록 기능
	public int insertEmp(Emp emp) {
		int rowcount = 0;
		 
		 Connection conn = null;
		 PreparedStatement pstmt=null;
		 
		 try {
			 String sql="insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values(?,?,?,?,?,?,?,?)";
			 
			 conn = ds.getConnection();
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setInt(1, emp.getEmpno());
			 pstmt.setString(2, emp.getEname());
			 pstmt.setString(3, emp.getJob());
			 pstmt.setInt(4, emp.getMgr());
			 pstmt.setDate(5, emp.getHiredate());
			 //System.out.println("getHiredate: "+ emp.getHiredate());
			 pstmt.setInt(6, emp.getSal());
			 pstmt.setInt(7, emp.getComm());
			 pstmt.setInt(8, emp.getDeptno());
			
			 rowcount = pstmt.executeUpdate(); 
			 
		 }catch (Exception e) {
			 e.printStackTrace();
		 }finally {
			 if(pstmt != null)try{pstmt.close();}catch (Exception e){e.printStackTrace();}
			 if(conn != null) try{conn.close();}catch (Exception e){e.printStackTrace();}  //반환
		 }
		 
		 return rowcount;
	}
	
	//사원 수정 기능
	public int updateEmp(Emp emp) {
		int resultrowcount=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "update emp set ename=?, job=?, mgr=?, hiredate=?, sal=?, comm=?, deptno=? where empno=?";
			
			conn = ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, emp.getEname());
			pstmt.setString(2, emp.getJob());
			pstmt.setInt(3, emp.getMgr());
			pstmt.setDate(4, emp.getHiredate());
			pstmt.setInt(5, emp.getSal());
			pstmt.setInt(6, emp.getComm());
			pstmt.setInt(7, emp.getDeptno());
			pstmt.setInt(8, emp.getEmpno());
			
			resultrowcount = pstmt.executeUpdate();
			
			if (resultrowcount > 0) {
				System.out.println("반영된 행의 수 : " + resultrowcount);
			}
			else {
				System.out.println("insert fail : " + resultrowcount);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null)try{pstmt.close();}catch (Exception e){e.printStackTrace();}
			if(conn != null) try{conn.close();}catch (Exception e){e.printStackTrace();}  //반환
		}
		return resultrowcount;
	}
	
	//사원 삭제 기능
	public int deleteEmp(int empno) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int row = 0;
		
		try {
			conn = ds.getConnection();
			String sql = "delete from emp where empno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);
			row = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		} finally {
			 if(pstmt != null)try{pstmt.close();}catch (Exception e){e.printStackTrace();}
			 if(conn != null) try{conn.close();}catch (Exception e){e.printStackTrace();}  //반환
		}

		return row;
	}
}
