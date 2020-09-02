package com.employeeservice.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.employeeservice.model.Employee;
@Repository
public interface EmployeeDao {
	
	 Employee createEmp(Employee employee);
	    //Update employee details with in department
	    boolean updateEmp(Employee employee);
	    // Get all employees based on department id
	    List<Employee> readEmpFromDept(int empId);
	    //delete employee in department
	    boolean deleteEmpFromDept(int deptId,int empId);
		
	    boolean deleteEmpsFromDept(int deptEmpFk);

}
