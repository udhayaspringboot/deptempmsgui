package com.departmentservice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.departmentservice.dao.DepartmentDao;
import com.departmentservice.model.Department;
@Service

public class DepartmentServiceImpl implements DepartmentService {

	@Autowired
	DepartmentDao deptDao;
	@Override
	public Department createDeptServ(Department dept) {
		
		
	return deptDao.createDept(dept);
		
	}

	@Override
	public boolean updateDeptServ(Department dept) {
		deptDao.updateDept(dept);
		return true;
	}

	@Override
	public List<Department> readAllDeptServ() {
		
		return deptDao.readAllDept();
	}

	@Override
	public boolean delteDeptServ(int depIds) {
		deptDao.delteDept(depIds);
		return true;
	}

}
