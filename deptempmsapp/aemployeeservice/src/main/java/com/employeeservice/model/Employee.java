package com.employeeservice.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="EMPL_TB")
public class Employee {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name="emp_id")
	private int empId;
	@Column(name="emp_name")
	
	
	private String empName;
	@Column(name="dob")

	
	private String dateOfBirth;
	@Column(name="mail_id")
	
	private String mailId;
	@Column(name="mobile_no")
	
	private long mobileNo;
	@Column(name="salary")
	
	private float salary;
	
	@Column(name="company_name")
	
	private String companyName;
	@Column(name="dept_emp_fk")
	
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
