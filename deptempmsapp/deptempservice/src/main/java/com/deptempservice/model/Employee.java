package com.deptempservice.model;

public class Employee {
	private int empId;

	private String empName;

	private String dateOfBirth;

	private String mailId;

	private long mobileNo;

	private float salary;

	private String companyName;

	private int deptEmpFk;

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getMailId() {
		return mailId;
	}

	public void setMailId(String mailId) {
		this.mailId = mailId;
	}

	public long getMobileNo() {
		return mobileNo;
	}

	public void setMobileNo(long mobileNo) {
		this.mobileNo = mobileNo;
	}

	public float getSalary() {
		return salary;
	}

	public void setSalary(float salary) {
		this.salary = salary;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public int getDeptEmpFk() {
		return deptEmpFk;
	}

	public void setDeptEmpFk(int deptEmpFk) {
		this.deptEmpFk = deptEmpFk;
	}

	public Employee(int empId, String empName, String dateOfBirth, String mailId, long mobileNo, float salary,
			String companyName, int deptEmpFk) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.dateOfBirth = dateOfBirth;
		this.mailId = mailId;
		this.mobileNo = mobileNo;
		this.salary = salary;
		this.companyName = companyName;
		this.deptEmpFk = deptEmpFk;
	}

	public Employee() {
		super();
	}
	
	

}
