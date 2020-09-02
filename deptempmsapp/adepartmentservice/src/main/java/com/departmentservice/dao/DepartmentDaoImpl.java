package com.departmentservice.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.departmentservice.model.Department;
@Repository
@Transactional
public class DepartmentDaoImpl implements DepartmentDao {

	@Autowired
	DepartmentRepo deptRepo;
	@Override
	public Department createDept(Department dept) {
		
		return deptRepo.save(dept);
	}

	@Override
	public boolean updateDept(Department dept) {
		deptRepo.save(dept);
		return true;
	}

	@Override
	public List<Department> readAllDept() {
		List<Department> lisDept = (List<Department>) deptRepo.findAll();
		return lisDept;
	}

	@Override
	public boolean delteDept(int deptId) {
		deptRepo.deleteByDeptId(deptId);
		return false;
	}

}
