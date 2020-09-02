package com.deptempservice.controller;

import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.web.client.RestTemplate;

import com.deptempservice.model.Department;
import com.deptempservice.model.Departments;
import com.deptempservice.model.Employee;
import com.deptempservice.model.Employees;
import com.fasterxml.jackson.databind.ObjectMapper;

@RunWith(SpringRunner.class)
@WebMvcTest(DeptEmpController.class)
public class DeptEmpTest {
	
	
	@MockBean
	private DeptEmpController deptController;

	@Autowired
	private MockMvc mockMvc;

	@Mock
	private RestTemplate restTemplate;
	
	@Autowired
	ObjectMapper objMap;
	
	@Test
	public void createDept() throws Exception {
		Department department = new Department(1, "Admin","pune");
		/*
		 * Mockito.when(
		 * restTemplate.postForObject("http://localhost:8800/department/saveDept",
		 * department, Department.class)) .thenReturn(department);
		 */
		String req = objMap.writeValueAsString(department);
		mockMvc.perform(
				MockMvcRequestBuilders.post("/savedept").content(req))
				.andExpect(MockMvcResultMatchers.status().isOk());
		
	}

	
	@Test
	public void getDeptVals() throws Exception {
		List<Department> dept = new ArrayList<Department>();
		
		dept.add(new Department(2,"Training","Chennai"));
		dept.add(new Department(3,"HR","kochi"));
		
		Departments lst = new Departments();
		lst.setDepartments(dept);
		
		Mockito.when(restTemplate.getForObject("http://localhost:8800/department/listDept", Departments.class))
				.thenReturn(lst);
		String req = objMap.writeValueAsString(lst);
		mockMvc.perform(
				MockMvcRequestBuilders.get("/listDept").content(req).contentType(MediaType.APPLICATION_JSON_VALUE));
		Assert.assertEquals(2, lst.getDepartments().size());
	}

	@Test
	public void updateDept() throws Exception {
		Department department = new Department(3, "HR","Kochi");
		department.setDeptLoc("kollam");
		verify(restTemplate,times(0)).put("http://localhost:8800/department/updateDept/"+department.getDeptId(), department);
		String req = objMap.writeValueAsString(department);
		mockMvc.perform(
				MockMvcRequestBuilders.post("/updatedept/3").content(req).contentType(MediaType.APPLICATION_JSON_VALUE))
				.andExpect(MockMvcResultMatchers.status().isOk());
		

	}

	@Test
	public void deleteDept() throws Exception {
		Department department = new Department(3,"HR","kollam");
		
		verify(restTemplate,times(0)).delete("http://localhost:8800/department/deleteDept/"+department.getDeptId());
		String req = objMap.writeValueAsString(department);
		mockMvc.perform(
				MockMvcRequestBuilders.get("/deletedept/3").contentType(MediaType.APPLICATION_JSON_VALUE))
				.andExpect(MockMvcResultMatchers.status().isOk());

	}
	
	@Test
	public void saveEmployee() throws Exception {
		Employee emp2 = new Employee(26, "kiraan", "ksh@gmail.com", "1996-02-26", 894315697, 26953.56f, "ibm", 1);

		Mockito.when(restTemplate.postForObject("http://localhost:8800/department/employee/saveEmp", emp2, Employee.class))
				.thenReturn(emp2);
		String req = objMap.writeValueAsString(emp2);
		mockMvc.perform(
				MockMvcRequestBuilders.post("/saveemployee").content(req).contentType(MediaType.APPLICATION_JSON_VALUE))
				.andExpect(MockMvcResultMatchers.status().isOk());
	}

	@Test
	public void getEmployees() throws Exception {
		List<Employee> emp = new ArrayList<Employee>();
		emp.add(new Employee(26, "kiraan", "ksh@gmail.com", "1996-02-26", 894315697, 26953.56f, "ibm", 1)

		);
		emp.add(new Employee(27, "krishna", "krish@gmail.com", "1986-12-16", 7412589630L, 45692.23f, "cts", 1)

		);
		
		Employees lst = new Employees();
		lst.setEmployees(emp);
		
		Mockito.when(restTemplate.getForObject("http://localhost:8800/department/employee/listEmp/"+1, Employees.class))
		.thenReturn(lst);
		String req = objMap.writeValueAsString(lst);
		mockMvc.perform(
		MockMvcRequestBuilders.get("/homeserv").content(req).contentType(MediaType.APPLICATION_JSON_VALUE));
		Assert.assertEquals(2, lst.getEmployees().size());
	}

	@Test
	public void updateEmployee() throws Exception {
		Employee employee = new Employee(26, "kiraan", "ksh@gmail.com", "1996-02-26", 894315697, 26953.56f, "ibm", 1);
		verify(restTemplate, times(0)).put("http://localhost:8800/department/employee/updateEmp/1", employee);
		String req = objMap.writeValueAsString(employee);
		mockMvc.perform(
				MockMvcRequestBuilders.post("/updateemployee/26").content(req).contentType(MediaType.APPLICATION_JSON_VALUE))
				.andExpect(MockMvcResultMatchers.status().isOk());

	}

	@Test
	public void deleteEmployee() throws Exception {
		Employee employee =new Employee(26, "kiraan", "ksh@gmail.com", "1996-02-26", 894315697, 26953.56f, "ibm", 1);
		verify(restTemplate,times(0)).delete("http://localhost:8800/department/deleteEmp/26/1");
		String req = objMap.writeValueAsString(employee);
		mockMvc.perform(
				MockMvcRequestBuilders.get("/deleteemployee/26/1").content(req).contentType(MediaType.APPLICATION_JSON_VALUE))
				.andExpect(MockMvcResultMatchers.status().isOk());

	}
	
}
