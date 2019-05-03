package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Emp getEmpnoList(int empno) {
		
		Emp emp = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//POOL 연결 객체 얻어오기
			String sql = "select empno, ename, job, mgr, hiredate, sal, nvl(comm, 0) comm, deptno from Emp where empno = ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, empno);
        	System.out.println("들어옴");
				rs = pstmt.executeQuery();
			
				if (rs.next()) {
		            do {
		            	emp = new Emp();
		            	emp.setEmpno(rs.getInt("empno"));
		            	emp.setEname(rs.getString("ename"));
		            	emp.setJob(rs.getString("job"));
		            	emp.setMgr(rs.getInt("mgr"));
		            	emp.setHiredate(rs.getDate("hiredate"));
		            	emp.setSal(rs.getInt("sal"));
		            	emp.setComm(rs.getInt("comm"));
		            	emp.setDeptno(rs.getInt("deptno"));
		            } while (rs.next());
		        } else {
		            System.out.println("데이터가 없습니다.");
		        }

		}catch (Exception e){
			e.getStackTrace();
		}finally {
			
			if(pstmt!=null)try {pstmt.close();}catch(Exception e) {}
			if(rs!=null)try {rs.close();}catch(Exception e) {}
			if(conn!=null)try {conn.close();}catch(Exception e) {}
			
		}

		return emp;
	}
	
	//부서 번호 조회
	public List<Emp> getDeptnoList(int deptno) {
		
		List<Emp> emplist = new ArrayList<Emp>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//POOL 연결 객체 얻어오기
			String sql = "select empno, ename, job, mgr, hiredate, sal, nvl(comm, 0) comm, deptno from Emp where deptno = ?";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			System.out.println("rs: "+ rs.next());
			
			if (rs.next()) {
	            do {
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
	            } while (rs.next());
	        } else {
	            System.out.println("데이터가 없습니다.");
	        }

		}catch (Exception e){
			e.getStackTrace();
		}finally {
			
			if(pstmt!=null)try {pstmt.close();}catch(Exception e) {}
			if(rs!=null)try {rs.close();}catch(Exception e) {}
			if(conn!=null)try {conn.close();}catch(Exception e) {}
			
		}
		
		return emplist;
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
	
	//job리스트 받아오기
	public List<String> selectJobList(){
		
		List<String> joblist = new ArrayList<String>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//POOL 연결 객체 얻어오기
			String sql = "SELECT DISTINCT JOB FROM EMP";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	            do {
	            	joblist.add(rs.getString("job"));
	            } while (rs.next());
	        } else {
	            System.out.println("데이터가 없습니다.");
	        }

		}catch (Exception e){
			e.getStackTrace();
		}finally {
			
			if(pstmt!=null)try {pstmt.close();}catch(Exception e) {}
			if(rs!=null)try {rs.close();}catch(Exception e) {}
			if(conn!=null)try {conn.close();}catch(Exception e) {}
			
		}
		
		return joblist;
		
	}
	
	public List<Integer> selectDeptList(){
		List<Integer> deptList = new ArrayList<Integer>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//POOL 연결 객체 얻어오기
			String sql = "SELECT DEPTNO FROM DEPT";
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
	            do {
	            	int deptno = rs.getInt("deptno");
	            	deptList.add(deptno);
	            	
	            } while (rs.next());
	        } else {
	            System.out.println("데이터가 없습니다.");
	        }

		}catch (Exception e){
			e.getStackTrace();
		}finally {
			
			if(pstmt!=null)try {pstmt.close();}catch(Exception e) {}
			if(rs!=null)try {rs.close();}catch(Exception e) {}
			if(conn!=null)try {conn.close();}catch(Exception e) {}
		}
		
		return deptList;
	}
	
	//deptno 받아오기
//	public Map<Integer, String> selectDeptList(){
//		Map<Integer, String> deptMap = new HashMap<Integer, String>();
//
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		
//		try {
//			//POOL 연결 객체 얻어오기
//			String sql = "SELECT DEPTNO, DNAME FROM DEPT";
//			conn = ds.getConnection();
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			
//			if (rs.next()) {
//	            do {
//	            	int deptno = rs.getInt("deptno");
//	            	String dname = rs.getString("dname");
//	            	deptMap.put(deptno, dname);
//	            	
//	            } while (rs.next());
//	        } else {
//	            System.out.println("데이터가 없습니다.");
//	        }
//
//		}catch (Exception e){
//			e.getStackTrace();
//		}finally {
//			
//			if(pstmt!=null)try {pstmt.close();}catch(Exception e) {}
//			if(rs!=null)try {rs.close();}catch(Exception e) {}
//			if(conn!=null)try {conn.close();}catch(Exception e) {}
//		}
//		
//		return deptMap;
//	}
}
