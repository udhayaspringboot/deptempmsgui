package com.deptempservice;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.doReturn;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.delete;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.put;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.boot.web.server.LocalServerPort;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.result.MockMvcResultHandlers;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.web.client.RestTemplate;

import com.deptempservice.controller.DeptEmpController;
import com.deptempservice.model.Department;
import com.deptempservice.model.Departments;
import com.deptempservice.model.Employee;
import com.deptempservice.model.Employees;
import com.deptempservice.service.DeptEmpService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RunWith(SpringRunner.class)
//@WebMvcTest(controllers = DeptEmpController.class)

//@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT)
@WebMvcTest(DeptEmpController.class)
public class DeptempserviceApplicationTests {

	@Autowired
	private MockMvc mockMvc;

	ObjectMapper objMap = new ObjectMapper();

	@Mock
	RestTemplate restTemplate;
	

	/*
	 * @Before public void sampleFields() { Department dept = new
	 * Department(21,"Technical","Pune"); Department dept1 = new
	 * Department(22,"Admin","Chennai"); Department dept2 = new
	 * Department(23,"Support","Banglore"); Department dept3 = new
	 * Department(24,"Development","Hydrabad"); List<Department> lisDept =new
	 * ArrayList<Department>(); lisDept.add(dept); lisDept.add(dept1);
	 * lisDept.add(dept2); lisDept.add(dept3);
	 * 
	 * Departments depts = new Departments(); depts.setDepartments(lisDept);
	 * Employee emp = new Employee(26, "kiraan", "ksh@gmail.com", "1996-02-26",
	 * 8943156970L, 26953.56f, "ibm", dept.getDeptId()); Employee emp1 = new
	 * Employee(27, "kumar", "kumar@gmail.com", "1997-07-29", 7894561233L,
	 * 75369.56f, "cts", dept1.getDeptId()); Employee emp2 = new Employee(28,
	 * "Rajesh", "rajesh@gmail.com", "1996-02-26", 74125896306L, 95623.56f,
	 * "infosis", dept3.getDeptId()); Employee emp3 = new Employee(29, "mukesh",
	 * "mukesh@gmail.com", "1989-12-16", 8523697416L, 32569.56f, "hcl",
	 * dept2.getDeptId()); List<Employee> lisEmp =new ArrayList<Employee>();
	 * lisEmp.add(emp); lisEmp.add(emp1); lisEmp.add(emp2); lisEmp.add(emp3);
	 * Employees empls = new Employees(); empls.setEmployees(lisEmp);
	 * 
	 * 
	 * 
	 * }
	 */
	@Test
	public void createDeptChk() {
		Department dept = new Department(21, "Technical", "Pune");

		try {

			// given(restTemplate.postForObject("http://localhost:8800/department/listDept/",dept,
			// Department.class)
			// given(deptEmpController.addDepartment(dept, request, response,
			// page)).willReturn(allEmployees);
			// when(deptEmpController.saveServ(dept)).thenReturn(dept);

			// when(restTemplate.postForObject("http://localhost:8800/department/saveDept",
			// dept, Department.class)).thenReturn(dept);

			/*
			 * mockMvc.perform( MockMvcRequestBuilders .post("/savedept")
			 * .content(objMap.writeValueAsString(dept))
			 * .contentType(MediaType.APPLICATION_JSON) .accept(MediaType.APPLICATION_JSON))
			 * .andExpect(status().isCreated()).andReturn();
			 */
			// when(deptEmpService.saveSev(dept)).thenReturn(dept);
			
			  when(restTemplate.postForObject("http://localhost:8800/department/saveDept",
			  dept, Department.class)) .thenReturn(dept);
			 
			mockMvc.perform(post("/savedept").sessionAttr("submitDoneDept", "done" ).flashAttr("deptpage", dept)).andExpect(status().isOk())
					.andExpect(MockMvcResultMatchers.redirectedUrl("/homeserv"));

			// verify(restTemplate,times(0)).postForObject("http://localhost:8800/department/saveDept",
			// dept,
			// Department.class);
			// mockMvc.perform(post("/savedept")).flashAttr("deptpage", dept));

		} catch (Exception e) {
			// TODO Auto-generated catch block

		}
	}
	
	@Test
	public void getDeptVals()
	{
		List<Department> lis= new ArrayList<>();
		lis.add(new Department(30,"development","chennai"));
		lis.add( new Department(31,"Technical","pune"));
	
Departments depts = new Departments();
depts.setDepartments(lis);

//when().thenReturn(depts);

doReturn(depts).when(restTemplate).getForObject("http://gateway-service/department/listDept",
		Departments.class);
		
try {
	mockMvc.perform(get("/homeserv")).andExpect(status().isOk());
	
	
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

	}

	@Test
	public void saveEmp() {
		Employee emp2 = new Employee(26, "kiraan", "ksh@gmail.com", "1996-02-26", 894315697, 26953.56f, "ibm", 1);

		try {
			
			  when(restTemplate.postForObject(
			  "http://gateway-service/department/employee/saveEmp/"+emp2.getDeptEmpFk(), emp2, Employee.class))
			  .thenReturn(emp2);
			 
			List<Department> lisDept = new ArrayList<>();
			lisDept.add(new Department(1,"Admin","pune"));
			lisDept.add(new Department(3,"HR","chennai"));
			MockHttpSession scf = new MockHttpSession();
			mockMvc.perform(post("/saveemployee").session(scf).sessionAttr("lisdept", 
					lisDept).flashAttr("emppage", emp2))
			.andExpect(status().isOk())
					.andExpect(MockMvcResultMatchers.redirectedUrl("/listEmp?deptId=" + emp2.getDeptEmpFk()));

		}

		catch (Exception e) {
			
			
			

		}
	}
}

/*
 * @Test public void getDept() { try {
 * mockMvc.perform(get("/homeserv").flashAttr("deptpage",
 * "")).andExpect(status().isOk()) .andExpect(view().name("home3"))
 * .andDo(MockMvcResultHandlers.print()); } catch (Exception e) { // TODO
 * Auto-generated catch block e.printStackTrace(); } }
 */

/*
 * @Test public void getDept() { Department dept1 = new
 * Department(22,"Admin","Chennai"); Department dept2 = new
 * Department(23,"Support","Banglore"); Department dept3 = new
 * Department(24,"Development","Hydrabad"); List<Department> lisDept =new
 * ArrayList<Department>(); lisDept.add(dept1); lisDept.add(dept2);
 * lisDept.add(dept3); Departments dept = new Departments();
 * dept.setDepartments(lisDept);
 * 
 * 
 * 
 * try { when(deptEmpController.getDeptVal()) .thenReturn(dept);
 * //given(restTemplate.getForObject("http://localhost:8800/department/listDept"
 * ,Departments.class);
 * mockMvc.perform(get("/homeserv")).andExpect(status().isOk());
 * 
 * 
 * } catch (Exception e) { // TODO Auto-generated catch block
 * e.printStackTrace(); } }
 * 
 * @SuppressWarnings("unused")
 * 
 * @Test public void updateDeptTest() { Department df = new Department(5,
 * "support", "chennai");
 * 
 * df.setDeptLoc("Pune");
 * 
 * //when(deptEmpController.putDept(df.getDeptId(), df));
 * verify(deptEmpController,times(0)).putDept(df.getDeptId(), df);
 * //assertEquals(true, deptDao.updateDept(df)); try {
 * mockMvc.perform(put("/updatedept/5")).andExpect(status().isOk()); } catch
 * (Exception e) { // TODO Auto-generated catch block e.printStackTrace(); } }
 * 
 * @SuppressWarnings("unused")
 * 
 * @Test public void deleDeptTest() { Department df = new Department(5,
 * "support", "chennai");
 * 
 * 
 * 
 * //when(deptEmpController.putDept(df.getDeptId(), df));
 * verify(deptEmpController,times(0)).deleDept(df.getDeptId());
 * //assertEquals(true, deptDao.updateDept(df)); try {
 * mockMvc.perform(delete("/deledept/5")).andExpect(status().isOk()); } catch
 * (Exception e) { // TODO Auto-generated catch block e.printStackTrace(); } }
 * 
 * @Test public void addEmployeeChk() { Employee emp2 = new Employee(26,
 * "kiraan", "ksh@gmail.com", "1996-02-26", 894315697, 26953.56f, "ibm", 1);
 * Employee emp4 = new Employee(29, "Kumar", "kum@gmail.com", "1990-08-26",
 * 894315697, 36953.56f, "infomatica", 2);
 * 
 * 
 * 
 * try { when(restTemplate.postForObject(
 * "http://localhost:8800/department/employee/saveEmp/"+emp2.getEmpId(), emp2,
 * Employee.class)); mockMvc.perform(post("/saveempchk").
 * contentType(MediaType.APPLICATION_JSON).content(objMap.writeValueAsString(
 * emp2))) .andExpect(status().isCreated()).andReturn(); } catch (Exception e) {
 * // TODO Auto-generated catch block e.printStackTrace(); } }
 */
