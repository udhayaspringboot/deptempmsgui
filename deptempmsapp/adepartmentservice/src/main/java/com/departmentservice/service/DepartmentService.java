package com.departmentservice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.departmentservice.model.Department;
@Service
public interface DepartmentService {
	//create a department
			Department createDeptServ(Department dept);
			//update a department
			boolean updateDeptServ(Department dept);
			//Get All Department
		    List<Department> readAllDeptServ();
		    //delete department with all associated employees
		    boolean delteDeptServ(int depIds);

}
