package com.employeeservice.model;

import java.util.List;

public class Employees {
	
	private List<Employee> employees;

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public Employees(List<Employee> employees) {
		super();
		this.employees = employees;
	}

	public Employees() {
		super();
	}
	

}
