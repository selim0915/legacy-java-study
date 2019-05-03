package kr.or.bit.dto;

public class PicAttach {
	private int empno;
	private String filename;
	
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	@Override
	public String toString() {
		return "PIC_ATTACH [empno=" + empno + ", filename=" + filename + "]";
	}
}
