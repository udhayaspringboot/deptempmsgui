package com.employeeservice.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.employeeservice.dao.EmployeeDao;
import com.employeeservice.model.Employee;
@Service
@Transactional
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeDao empDao;
	@Override
	public Employee createEmpServ(Employee employee) {
		
		return empDao.createEmp(employee);
	}

	@Override
	public boolean updateEmpServ(Employee employee) {
		empDao.updateEmp(employee);
		return true;
	}

	@Override
	public List<Employee> readEmpFromDeptServ(int empId) {
		List<Employee> lisEmp = empDao.readEmpFromDept(empId);
		return lisEmp;
	}

	@Override
	public boolean deleteEmpFromDeptServ(int deptId, int empId) {
		empDao.deleteEmpFromDept(deptId, empId);
		return true;
	}

	@Override
	public boolean deleteEmpsFromDeptServ(int deptEmpFk) {
		empDao.deleteEmpsFromDept(deptEmpFk);
		return true;
	}

}
