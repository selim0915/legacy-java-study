package dao;

import java.util.List;

import dto.EmpDto;
import dto.EmpChartDto;

public interface EmpDao {
	public EmpDto getEmpList(String id);
	public List<EmpDto> getEmpListAll();
	public List<EmpDto> getEmpListLike(int intValue);
	public Integer AddEmpMember(EmpDto empdto);
	public int updateEmp(EmpDto empdto);
	public int updateFakeEmp(String empno);
	public int deleteEmp(int empno);
	public int totalEmpMemberCount();
	public List<EmpChartDto> hiredateTable();
	public String hiredateChart();
	public String salChart();
	public String isCheckByEmpno(String empnoStr);
}
  