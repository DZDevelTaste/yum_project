package ant.yum.vo;

public class OrderVo {

	private int No;
	private String Date;
	private int Expenses;
	private String Desc;
	private int userNo;
	private int orderstateNo;
	private int patientNo;
	
	
	public int getNo() {
		return No;
	}


	public void setNo(int no) {
		No = no;
	}


	public String getDate() {
		return Date;
	}


	public void setDate(String date) {
		Date = date;
	}


	public int getExpenses() {
		return Expenses;
	}


	public void setExpenses(int expenses) {
		Expenses = expenses;
	}


	public String getDesc() {
		return Desc;
	}


	public void setDesc(String desc) {
		Desc = desc;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getOrderstateNo() {
		return orderstateNo;
	}


	public void setOrderstateNo(int orderstateNo) {
		this.orderstateNo = orderstateNo;
	}


	public int getPatientNo() {
		return patientNo;
	}


	public void setPatientNo(int patientNo) {
		this.patientNo = patientNo;
	}


	@Override
	public String toString() {
		return "OrderVo [No=" + No + ", Date=" + Date + ", Expenses=" + Expenses + ", Desc=" + Desc + ", userNo="
				+ userNo + ", orderstateNo=" + orderstateNo + ", patientNo=" + patientNo + "]";
	}
}
