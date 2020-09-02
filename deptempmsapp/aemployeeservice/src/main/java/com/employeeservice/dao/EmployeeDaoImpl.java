package com.employeeservice.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.employeeservice.model.Employee;
@Repository
@Transactional
public class EmployeeDaoImpl implements EmployeeDao {

	@Autowired
	EmployeeRepo empRepo;
	@Override
	public Employee createEmp(Employee employee) {
		
		return empRepo.save(employee);
	}

	@Override
	public boolean updateEmp(Employee employee) {
		empRepo.save(employee);
		return true;
	}

	@Override
	public List<Employee> readEmpFromDept(int deptEmpFk) {
		List<Employee> lisEmp = (List<Employee>) empRepo.findByDeptEmpFk(deptEmpFk);
		return lisEmp;
	}

	@Override
	public boolean deleteEmpFromDept(int empId, int deptEmpFk) {
		System.out.println("employee id "+empId + "dept id  "+deptEmpFk);
		empRepo.deleteByEmpIdAndDeptEmpFk(empId,deptEmpFk);
		return true;
	}

	@Override
	public boolean deleteEmpsFromDept(int deptEmpFk) {
		empRepo.deleteByDeptEmpFk(deptEmpFk);
		return false;
	}

}
