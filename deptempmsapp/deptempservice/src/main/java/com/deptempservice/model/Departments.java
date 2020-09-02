package com.deptempservice.model;
import java.util.List;
public class Departments {
	
	
	private List<Department> departments;

	public List<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}

	public Departments(List<Department> departments) {
		super();
		this.departments = departments;
	}

	public Departments() {
		super();
	}
	
	

}
