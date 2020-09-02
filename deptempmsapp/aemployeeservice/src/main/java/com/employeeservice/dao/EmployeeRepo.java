package com.employeeservice.dao;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.employeeservice.model.Employee;

public interface EmployeeRepo extends CrudRepository<Employee, Integer> {

	@Modifying
	@Query(value="delete from empl_tb where emp_id =?1 and dept_emp_fk=?2",nativeQuery = true)
	void deleteByEmpIdAndDeptEmpFk(int empId, int deptEmpFk);

	List<Employee> findByDeptEmpFk(int deptEmpFk);

	@Modifying
	@Query(value="delete from empl_tb where dept_emp_fk=?1",nativeQuery = true)
	void deleteByDeptEmpFk(int deptEmpFk);

}
