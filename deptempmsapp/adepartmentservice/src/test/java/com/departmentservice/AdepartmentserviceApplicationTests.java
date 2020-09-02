package com.departmentservice;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.web.client.RestTemplate;

import com.departmentservice.dao.DepartmentDao;
import com.departmentservice.dao.DepartmentRepo;
import com.departmentservice.model.Department;
import com.departmentservice.model.Employee;
import com.departmentservice.model.Employees;
import com.departmentservice.service.EmployeeService;

@RunWith(SpringRunner.class)
@SpringBootTest
class AdepartmentserviceApplicationTests {

	@Autowired
	private DepartmentDao deptDao;

	@Autowired
	private EmployeeService employeeService;

	@Mock
	RestTemplate restTemplate;

	@MockBean
	DepartmentRepo deptRepo;

	/*
	 * @LocalServerPort private int port;
	 */

	@SuppressWarnings("unused")
	@Test
	public void saveDeptTest() {
		Department dep2 = new Department(3, "support", "chhennai");

		if (dep2 == null) {
			assertNotNull("object is null", dep2);
		} else {
			when(deptRepo.save(dep2)).thenReturn(dep2);
			assertEquals(dep2, deptDao.createDept(dep2));
		}
	}

	@Test
	public void getAllDeptTest() {

		when(deptRepo.findAll())
				.thenReturn(Stream.of(new Department(1, "training", "pune"), new Department(2, "HR", "palakkad"))
						.collect(Collectors.toList()));
		if (deptDao.readAllDept() == null) {
			assertNotNull("list values should not be empty", deptDao.readAllDept());
		} else {

			Assert.assertEquals(2, deptDao.readAllDept().size());
		}
	}

	@SuppressWarnings("unused")
	@Test
	public void deleteDeptTest() {

		Department dep = new Department(5, "sales", "pune");

		if (dep == null) {
			assertNotNull("object is null", dep);
		} else {
			deptDao.delteDept(dep.getDeptId());
			verify(deptRepo, times(1)).deleteByDeptId(dep.getDeptId());

		}
	}

	@SuppressWarnings("unused")
	@Test
	public void updateDeptTest() {
		Department df = new Department(5, "support", "chennai");

		if (df == null) {
			assertNotNull("null values for the object", df);
		} else {
			df.setDeptLoc("Pune");
			when(deptRepo.save(df)).thenReturn(df);
			assertEquals(true, deptDao.updateDept(df));
		}
	}

	@SuppressWarnings("unused")
	@Test
	public void createEmpChkCon() {

		Employee emp2 = new Employee(26, "kiraan", "ksh@gmail.com", "1996-02-26", 894315697, 26953.56f, "ibm", 10);

		//emp2 = null;
		if (emp2 == null) {
			assertNull("object is null", emp2);
		} else {

			when(restTemplate.postForObject("http://employee-service/employee/saveEmp/" + emp2.getDeptEmpFk(), emp2,
					Employee.class)).thenReturn(emp2);
			assertEquals(emp2,employeeService.createEmpServ(emp2));
		}

	}

	@Test
	public void readEmpFromDeptId() {
		Employee emp2 = new Employee(26, "kiraan", "ksh@gmail.com", "1996-02-26", 894315697, 26953.56f, "ibm", 1);
		Employee emp4 = new Employee(29, "Kumar", "kum@gmail.com", "1990-08-26", 894315697, 36953.56f, "infomatica", 1);

		List<Employee> lis = new ArrayList<>();
		lis.add(emp2);
		lis.add(emp4);
		Employees empl = new Employees();
		empl.setEmployees(lis);
		if (empl.getEmployees().isEmpty()) {
			assertNull("List is Empty");
		} else {
			when(restTemplate.getForObject("http://employee-service/employee/listEmp/" + 1, Employees.class))
					.thenReturn(empl);

			assertEquals(2, empl.getEmployees().size());

		}

	}

	@SuppressWarnings("unused")
	@Test
	public void updateEmpCheck() {
		Employee emp2 = new Employee(26, "kumar", "kumar@gmail.com", "1996-02-26", 7523180001L, 56953.56f, "cts", 1);

		if (emp2 == null) {
			assertNull("object is null", emp2);
		} else {
			verify(restTemplate, times(0)).put("http://employee-service/employee/updateEmp/" + emp2.getEmpId(), emp2);
			assertTrue(employeeService.updateEmpServ(emp2));

		}
	}

	@Test
	public void deleteEmpDeptIdCheck() {

		int deptId = 26;
		int empId = 1;

		if (deptId < 1 && empId < 1) {
			assertNull("Values are not accepted");
		} else {

			verify(restTemplate, times(0)).delete("http://employee-service/employee/deleteEmp/" + 26 + "/" + 1);

			assertTrue(employeeService.deleteEmpFromDeptServ(26, 1));
		}
	}

	@Test
	public void deleteEmpCheck() {

		int deptId = 1;
		if (deptId == 0) {
			assertNull("value not accepted");
		} else {
			verify(restTemplate, times(0)).delete("http://employee-service/employee/deleteEmp/" + 1);

			assertTrue(employeeService.deleteEmpByDeptId(1));
		}
	}

}
