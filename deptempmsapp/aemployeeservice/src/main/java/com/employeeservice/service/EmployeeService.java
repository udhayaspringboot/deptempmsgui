package com.employeeservice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.employeeservice.model.Employee;

@Service
public interface EmployeeService {
	
	 //Create Employee With Associate Department id
    Employee createEmpServ(Employee employee);
    //Update employee details with in department
    boolean updateEmpServ(Employee employee);
    // Get all employees based on department id
    List<Employee> readEmpFromDeptServ(int empId);
    //delete employee in department
    boolean deleteEmpFromDeptServ(int deptId,int empId);
    
	boolean deleteEmpsFromDeptServ(int deptEmpFk);

}
