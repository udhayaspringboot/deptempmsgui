package com.departmentservice.dao;

import org.springframework.data.repository.CrudRepository;

import com.departmentservice.model.Department;

public interface DepartmentRepo extends CrudRepository<Department, Integer>{

	void deleteByDeptId(int deptId);

}
