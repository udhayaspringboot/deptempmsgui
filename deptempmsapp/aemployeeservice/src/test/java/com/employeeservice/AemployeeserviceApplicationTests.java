package com.employeeservice;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.context.junit4.SpringRunner;
import com.employeeservice.dao.EmployeeDao;
import com.employeeservice.dao.EmployeeRepo;
import com.employeeservice.model.Employee;
@RunWith(SpringRunner.class)
@SpringBootTest
class AemployeeserviceApplicationTests {
	
	
	@Autowired
	EmployeeDao empDao;
	@MockBean
	EmployeeRepo empRepo;
	

	@Test
	public void createEmpTest() {
		
		
			Employee emp2 = new Employee(26, "kiraan", "ksh@gmail.com", "1996-02-26", 894315697, 26953.56f, "ibm", 1);
		Employee emp4 = new Employee(29, "Kumar", "kum@gmail.com", "1990-08-26", 894315697, 36953.56f, "infomatica",
				2);

		when(empRepo.save(emp2)).thenReturn(emp2);
		//when(empRepo.save(emp4)).thenReturn(emp4);
		//assertEquals(emp4, empDao.createEmp(emp4));
		assertEquals(emp2, empDao.createEmp(emp2));
		}
	
	@Test
	public void getEmpFromDeptTest() {
		int id = 1;
		
		if(id==0)
		{
			assertNotNull("id value is zero ", id);
		}else
		{
		when(empRepo.findByDeptEmpFk(id)).thenReturn(Stream
				.of(new Employee(1, "Udhay", "29-05-1989", "udhaya2cse@gmail.com", 9876542310L, 98562.26f, "HCl", 1),
						new Employee(2, "Raj", "19-09-1995", "raj@gmail.com", 9986542310L, 98562.26f, "Infosys", 2))
				.collect(Collectors.toList()));
		Assert.assertEquals(2, empDao.readEmpFromDept(id).size());}
	}
	@Test
	public void updateEmpTest() {
		
		
		Employee emp2 = new Employee(26, "kiraan", "ksh@gmail.com", "1996-02-26", 894315697, 26953.56f, "ibm", 2);

		emp2.setCompanyName("IBM");

		when(empRepo.save(emp2)).thenReturn(emp2);
		assertEquals(true, empDao.updateEmp(emp2));
		}
	@Test
	public void DeleteEmpTest() {
		int deptId = 2;
		int empId = 1;
if(deptId ==0 || empId==0)
{
	assertNotNull("ids are null values", deptId );
	
}else {
		empDao.deleteEmpFromDept(empId,deptId );
		verify(empRepo, times(1)).deleteByEmpIdAndDeptEmpFk(empId, deptId);
	}}
}
