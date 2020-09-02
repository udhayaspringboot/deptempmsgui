package com.departmentservice.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.departmentservice.model.Employee;
import com.departmentservice.model.Employees;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import com.netflix.ribbon.proxy.annotation.Hystrix;
@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	RestTemplate restTemplate;
	
	@Override
	@HystrixCommand(fallbackMethod = "createFallBackEmp")
	public Employee createEmpServ(Employee employee) {
		// TODO Auto-generated method stub
		
		//Employees emp = restTemplate.getForObject("", Employees.class);
		System.out.println("value "+employee.getEmpName());
		Employee emp =restTemplate.postForObject("http://employee-service/employee/saveEmp/"+employee.getDeptEmpFk(), employee, Employee.class);
		
		System.out.println("emp values for test "+emp.getEmpName());
		return employee;
		
	}

	@Override
	@HystrixCommand(fallbackMethod = "updateFallBackEmp")
	public boolean updateEmpServ(Employee employee) {
		// TODO Auto-generated method stub
		
		restTemplate.put("http://employee-service/employee/updateEmp/"+employee.getEmpId(), employee);
		return true;
	}

	@Override
	@HystrixCommand(fallbackMethod = "readFallBackEmp")
	public Employees readEmpFromDeptServ(int deptId) {
		Employees emp = restTemplate.getForObject("http://employee-service/employee/listEmp/"+deptId, Employees.class);
		return emp;
	}

	@Override
	@HystrixCommand(fallbackMethod = "deleteFallBackEmp")
	public boolean deleteEmpFromDeptServ(int empId, int deptId) {
		restTemplate.delete("http://employee-service/employee/deleteEmp/"+empId+"/"+deptId);
		
		return true;
	}

	@Override
	@HystrixCommand(fallbackMethod = "deleteEmpFallBackEmp")
	public boolean deleteEmpByDeptId(int deptId) {
		restTemplate.delete("http://employee-service/employee/deleteEmp/"+deptId);
		
		return true;
	}

	
	
	  public Employee createFallBackEmp(Employee employee) {
	  
		/*
		 * Employee emp2 = new Employee(01, "default name", "default mail id",
		 * "default dob", 0000000011, 12.000f, "default company", 0); employee = emp2;
		 */
		  employee.setEmpId(01);
		  employee.setEmpName("default name");
		  employee.setMailId("default mail id");
		  employee.setDateOfBirth("default dob");
		  employee.setMobileNo(0000000011);
		  employee.setSalary( 12.000f);
		  employee.setCompanyName("default company");
		  employee.setDeptEmpFk(0);
	  return employee; 
	  
	  }
	  public boolean updateFallBackEmp(Employee employee) {
		  
		  //Employee emp2 = new Employee(01, "default name", "default mail id", "default dob", 0000000011, 12.000f, "default company", 0);
			
	  return true; 
	  
	  }
	  public Employees readFallBackEmp(int deptId)
	  {
		  Employees emps = new Employees();
		 List< Employee >emp = new ArrayList<>();
		  emp.add(new Employee(01, "default name", "default mail id", "default dob", 
				  0000000011, 12.000f, "default company", 0)
			 );
		  emps.setEmployees(emp);
		return emps;
		  
	  }
	  
	  public boolean deleteFallBackEmp(int empId, int deptId) 
	  {
		  return true;
	  }
	  public boolean deleteEmpFallBackEmp(int deptId) 
	  {
		  return true;
	  }
}
