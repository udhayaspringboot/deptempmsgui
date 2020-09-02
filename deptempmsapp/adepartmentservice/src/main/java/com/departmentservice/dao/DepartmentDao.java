package com.departmentservice.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.departmentservice.model.Department;


@Repository
public interface DepartmentDao {
	//create a department
		Department createDept(Department dept);
		//update a department
		boolean updateDept(Department dept);
		//Get All Department
	    List<Department> readAllDept();
	    //delete department with all associated employees
	    boolean delteDept(int deptId);
}
