package com.departmentservice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.departmentservice.model.Employee;
import com.departmentservice.model.Employees;

@Service
public interface EmployeeService {
	
	 //Create Employee With Associate Department id
    Employee createEmpServ(Employee employee);
    //Update employee details with in department
    boolean updateEmpServ(Employee employee);
    // Get all employees based on department id
   Employees readEmpFromDeptServ(int empId);
    //delete employee in department
    boolean deleteEmpFromDeptServ(int deptId,int empId);
    
    boolean deleteEmpByDeptId(int deptId);

}
