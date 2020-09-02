package com.deptempservice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.deptempservice.model.Department;
import com.deptempservice.model.Departments;
import com.deptempservice.model.Employee;
import com.deptempservice.model.Employees;
import com.deptempservice.model.User;
import com.deptempservice.service.DeptEmpService;

@RestController
public class DeptEmpController {

	@Autowired
	RestTemplate restTemplate;

	
	@RequestMapping("/login")

	public ModelAndView startCont() {

		// log.info("login page");

		return new ModelAndView("login");
	}

	@RequestMapping("/usercheck")
	public ModelAndView loginCheck(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("usercheck");

		String uname = request.getParameter("userName");
		String pass = request.getParameter("password");
		System.out.println("uname " + uname);
		System.out.println("usercheck" + uname);
		// userDetServ.loadUserByUsername(uname);

		User user = new User();
		user.setUserName(uname);
		user.setPassword(pass);
		restTemplate.postForObject("http://gateway-service/login", user, User.class);

		ModelAndView mdv = new ModelAndView("login");
		/*
		 * if (uname.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("admin123#")) {
		 * HttpSession sess = request.getSession(); sess.setAttribute("unam", "admin");
		 * return new ModelAndView("redirect:/homeserv");
		 * 
		 * } else { String message = "UserName and Password didnt match";
		 * request.getSession().setAttribute("message", message);
		 */
		return new ModelAndView("redirect:/homeserv");
//		}

	}

	@GetMapping("/listDept")

	public ModelAndView getDeptVals(HttpServletRequest request, HttpServletResponse response) {
		/*
		 * Departments departments =
		 * restTemplate.getForObject("http://gateway-service/department/listDept",
		 * Departments.class);
		 * 
		 * return departments;
		 */

		HttpSession sessd = request.getSession();

		Departments departments = getDeptVal();

		System.out.println("departments " + departments.getDepartments().get(0).getDeptName());
		List<Department> lisDep = new ArrayList<>();
		for (int i = 0; i < departments.getDepartments().size(); i++) {
			lisDep.add(departments.getDepartments().get(i));
		}

		sessd.setAttribute("lisDept", lisDep);
		ModelAndView mdv = new ModelAndView("first");
		mdv.addObject("lisDept", lisDep);

		return mdv;

	}

	@RequestMapping("/homeserv")
	public ModelAndView homePage(@ModelAttribute("deptpage") Department det, HttpServletRequest request,
			HttpServletResponse response, /* Pageable pageable */@RequestParam(required = false) Integer page) {
		System.out.println("entering to homeserv");
		HttpSession sess = request.getSession();

		Departments departments = restTemplate.getForObject("http://gateway-service/department/listDept",
				Departments.class);
		
		System.out.println("departments " + departments.getDepartments().get(0).getDeptName());
		List<Department> ldeptj = new ArrayList<>();

		for (int i = 0; i < departments.getDepartments().size(); i++) {

			ldeptj.add(departments.getDepartments().get(i));
		}

		int size = ldeptj.size();

		ModelAndView mdc = new ModelAndView("home3");

		sess.setAttribute("ldeptj", ldeptj);

		mdc.addObject("size", size);
		mdc.addObject("deptlv", ldeptj);
		mdc.addObject("hoser", "hseval");
		return mdc;

	}

	public Departments getDeptVal() {
		return null;
	}

	@RequestMapping("/regDept")
	public ModelAndView addDepartment(@ModelAttribute("deptpage") Department dept, HttpServletRequest request,
			HttpServletResponse response, /* Pageable pageable */@RequestParam(required = false) Integer page)
			throws ServletException, IOException {

		HttpSession sed = request.getSession();

		List<Department> ldepty = (List<Department>) sed.getAttribute("ldeptj");

		ModelAndView mvn = new ModelAndView("home3");

		mvn.addObject("loggedInUser", sed.getAttribute("loggedInUser"));
		mvn.addObject("adddept", "regdept");

		mvn.addObject("deptlv", ldepty);
		mvn.addObject("hoser", "hseval");
		request.setAttribute("deptva", 0);
		return mvn;

	}

	@PostMapping("/savedept")
	public ModelAndView saveDept(@ModelAttribute("deptpage") Department dept, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession sez = request.getSession();
		/*
		 * if (errors.hasErrors()) { ModelAndView mvs = new ModelAndView("home3");
		 * mvs.addObject("loggedInUser", sez.getAttribute("loggedInUser"));
		 * mvs.addObject("adddept", "regdept"); mvs.addObject("deptlv",
		 * sez.getAttribute("ldeptj")); mvs.addObject("hoser", "hseval"); return mvs; }
		 * else {
		 */

		System.out.println("value at save dept" + dept.getDeptName());
		Department bool = restTemplate.postForObject("http://gateway-service/department/saveDept", dept,
				Department.class);
		HttpSession sem = request.getSession();
		sem.setAttribute("submitDoneDept", "done");
		return new ModelAndView("redirect:homeserv");

	}

	@RequestMapping("/editdepartment")
	public ModelAndView editDepartment(@ModelAttribute("deptpage") Department dept, @RequestParam("depId") int deptId,
			HttpServletRequest request, HttpServletResponse response, @RequestParam(required = false) Integer page) {

		HttpSession cvb = request.getSession();
		System.out.println("page is " + page);
		List<Department> ldpl = (List<Department>) cvb.getAttribute("ldeptj");

		ModelAndView mch = new ModelAndView("home3");

		mch.addObject("loggedInUser", cvb.getAttribute("loggedInUser"));
		mch.addObject("deptva", deptId);
		mch.addObject("hoser", "hseval");
		mch.addObject("page", page);
		mch.addObject("deptlv", ldpl);
		cvb.setAttribute("sdt", deptId);
		return mch;

	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/updatedept/{deptId}")
	public ModelAndView updateDepartment(@PathVariable("deptId") int deptId,
			@ModelAttribute("deptpage") Department dept, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession sed = request.getSession();
		List<Department> lDep = (List<Department>) sed.getAttribute("ldeptj");

		System.out.println("dept id" + dept.getDeptId() + "name " + dept.getDeptName() + " " + dept.getDeptLoc());
		for (Department department : lDep) {
			if (department.getDeptId() == deptId) {

				putDept(deptId, dept);

				HttpSession sel = request.getSession();
				sel.setAttribute("EditDept", "done");
			}
		}

		return new ModelAndView("redirect:/homeserv");

	}

	public void putDept(int deptId, Department dept) {
		restTemplate.put("http://gateway-service/department/updateDept/" + deptId, dept);
	}

	@RequestMapping("/deledept/{deptId}")
	public ModelAndView deleteDept(@ModelAttribute("deptpage") Department dept, @PathVariable("deptId") int deptId,
			HttpServletRequest request, HttpServletResponse response) {

		System.out.println("deptId for delete at controller" + deptId);

		restTemplate.delete("http://gateway-service/department/deleteDept/" + deptId);

		HttpSession sep = request.getSession();
		sep.setAttribute("deleteDoneDept", "done");
		return new ModelAndView("redirect:/homeserv");

	}

	

	@SuppressWarnings("unchecked")
	@RequestMapping("/home")
	public ModelAndView home(HttpServletRequest request, HttpServletResponse response) {
		int deptId;
		try {
			HttpSession sessi = request.getSession();
			List<Department> ldept = (List<Department>) sessi.getAttribute("ldeptj");
			sessi.setAttribute("lisdept", ldept);

			deptId = ldept.get(0).getDeptId();

		} catch (NullPointerException ne) {
			return new ModelAndView("redirect:/login");
		}

		return new ModelAndView("redirect:listEmp?deptId=" + deptId);

	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/listEmp")
	public ModelAndView listDepartment(@ModelAttribute("emppage") Employee emp, @RequestParam("deptId") int deptId,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession ses = request.getSession();
		System.out.println("get");

		System.out.println("int val " + deptId);
		Employees emps = getEmpVal(deptId);
		List<Employee> ldeptu = new ArrayList<>();
		for (int i = 0; i < emps.getEmployees().size(); i++) {
			ldeptu.add(emps.getEmployees().get(i));
		}
		// deptEmpService.readEmpFromDeptServ(deptId);
		// Department det =deptEmpService.showDeptServ(xt);
		List<Department> lks = (List<Department>) ses.getAttribute("lisdept");

		ses.setAttribute("deIdFromLis", deptId);
		ses.setAttribute("emplvaldept", ldeptu);
		ses.setAttribute("lis", lks);

		ses.setAttribute("val", ldeptu);
		if (ldeptu.isEmpty()) {
			ses.setAttribute("depIdx", deptId);
		}
		System.out.println("values from listemp : ");
		for (Employee employee : ldeptu) {
			System.out.println(employee.getEmpName());
		}
		ModelAndView mdb = new ModelAndView("home3");
		mdb.addObject("loggedInUser", ses.getAttribute("loggedInUser"));
		mdb.addObject("val", ldeptu);
		mdb.addObject("lis", lks);

		// mdb.addObject("dval", xt);
		mdb.addObject("hom", "homep");
		// request.setAttribute("countv", sess.getAttribute("couval"));
		// request.setAttribute("mess", "no data available");
		// request.setAttribute("deptnam", arg1);

		return mdb;
	}

	public Employees getEmpVal(int deptId) {
		return restTemplate.getForObject("http://gateway-service/department/employee/listEmp/" + deptId,
				Employees.class);
	}

	@RequestMapping("/deleteemployee/{empId}/{deptEmpFk}")
	public ModelAndView deleteEmployee(@ModelAttribute("emppage") Employee emp, @PathVariable int empId,
			@PathVariable int deptEmpFk, HttpServletRequest request, HttpServletResponse response) {

		// String [] argf = request.getParameterValues("idsemp");

		// int empId = Integer.parseInt(request.getParameter("empId"));
		// int deptEmpId = Integer.parseInt(request.getParameter("deptId"));
		/*
		 * int yt=0; for (int i = 0; i < argf.length; i++) {
		 * 
		 * 
		 * System.out.println("argf values "+argf[i]); String[] x = argf[i].split(",");
		 * int xt = Integer.parseInt(x[0]); yt = Integer.parseInt(x[1]);
		 * deptEmpService.deleteEmpFromDeptServ(yt,xt);
		 * System.out.println(" x and y "+xt + " val " +yt);
		 */
		// int y = argf[i].charAt(1);
		// System.out.println("x and y value "+x+y);
		// map.put(x,y);
		// }

		// System.out.println("emp id "+empId +"deptid "+deptEmpId);
		System.out.println("dele values " + empId + " " + deptEmpFk);
		restTemplate.delete("http://gateway-service/department/employee/deleteEmp/" + empId + "/" + deptEmpFk);
		System.out.println("deleting at del emplo");
		HttpSession sen = request.getSession();
		sen.setAttribute("deleteDone", "done");
		// response.sendRedirect("listEmp?deptId="+deptempid);
		return new ModelAndView("redirect:/listEmp?deptId=" + deptEmpFk);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/editemployee")
	public ModelAndView editEmployee(@ModelAttribute("emppage") Employee emp, @PathParam("empId") int empId,
			@PathParam("deptId") int deptId, HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		// int empId=Integer.parseInt(request.getParameter("empId"));
		System.out.println("employee id at edit employee is " + empId);
		// int deptId = Integer.parseInt(request.getParameter("deptId"));
		HttpSession sek = request.getSession();
		// Employee emp = (Employee) deptEmpService.readEmployeeServ(empId);
		// Department df = deptEmpService.showDeptServ(emp.getDepartment().getDeptId());
		List<Department> ldpnt = (List<Department>) sek.getAttribute("lisdept");
		String deptName = null;
		for (Department department : ldpnt) {
			if (department.getDeptId() == deptId) {
				deptName = department.getDeptName();
			}
		}
		// System.out.println("edit page value"+emp.getEmpName());

		List<Employee> listFromDept = (List<Employee>) sek.getAttribute("emplvaldept");

		sek.setAttribute("empp", empId);
		ModelAndView mcn = new ModelAndView("home3");
		mcn.addObject("loggedInUser", sek.getAttribute("loggedInUser"));
		mcn.addObject("mainemps", "checktableedit");
		mcn.addObject("empl", empId);
		mcn.addObject("hom", "homep");
		mcn.addObject("addlin", "anemp");
		mcn.addObject("lis", ldpnt);
		mcn.addObject("val", listFromDept);
		mcn.addObject("deptName", deptName);

		return mcn;

	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/updateemployee/{empId}")

	public ModelAndView updateEmployee(@ModelAttribute("emppage") Employee empk, @PathVariable("empId") int empId,
			HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		HttpSession mlk = request.getSession();

		// String idv = request.getParameter("empId");
		// int empId = (int)mlk.getAttribute("empp");
		System.out.println("id val" + empId);
		String empName = empk.getEmpName();
		System.out.println("employee Name" + empName);
		String dob = empk.getDateOfBirth();
		System.out.println("dob " + dob);
		String mailId = empk.getMailId();
		System.out.println("mail Id" + mailId);
		String depsample = request.getParameter("deptEmpName");
		List<Department> lsv = (List<Department>) mlk.getAttribute("lisdept");

		int studeptid = 0;
		for (Department department : lsv) {
			if (department.getDeptName().equals(depsample)) {
				studeptid = department.getDeptId();
			}
		}

		System.out.println("values update employee " + studeptid);
		long mob = empk.getMobileNo();
		float sal = empk.getSalary();
		String comName = empk.getCompanyName();
		// Department dv = new Department();
		// dv.setDeptId(studeptid);
		Employee emp = new Employee();
		emp.setEmpId(empId);
		emp.setEmpName(empName);
		emp.setMailId(mailId);
		emp.setDateOfBirth(dob);
		emp.setDeptEmpFk(studeptid);
		emp.setMobileNo(mob);
		emp.setSalary(sal);
		emp.setCompanyName(comName);

		System.out.println("Values from update employee" + empId + " " + empName + " " + mailId + " " + dob + " "
				+ studeptid + " " + mob + " " + sal + " " + comName);

		System.out.println("values for updating");
		// System.out.println(empId+" "+empName + " "+ mailId+" "+dob+" "+studeptid);
		restTemplate.put("http://gateway-service/department/employee/updateEmp/" + emp.getEmpId(), emp);
		// deptEmpService.updateEmpServ(emp);
		HttpSession sea = request.getSession();
		sea.setAttribute("submitDone", "done");
		// response.sendRedirect("listEmp?deptId="+studeptid);
		return new ModelAndView("redirect:/listEmp?deptId=" + studeptid);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/addemployee")
	public ModelAndView addEmployee(@ModelAttribute("emppage") Employee emp, HttpServletRequest request,
			HttpServletResponse response) {

		HttpSession sef = request.getSession();
		int deptId = (int) sef.getAttribute("deIdFromLis");
		List<Employee> lsty = (List<Employee>) sef.getAttribute("emplvaldept");
		/*
		 * Employees emps = restTemplate.getForObject(
		 * "http://gateway-service/department/employee/listEmp/"+deptId,
		 * Employees.class); List<Employee> lsty = new ArrayList<>(); for(int
		 * i=0;i<emps.getEmployees().size();i++) { lsty.add(emps.getEmployees().get(i));
		 * }
		 */
		List<Department> ldeptval = (List<Department>) sef.getAttribute("lisdept");
		String stg = request.getParameter("empId");
		System.out.println("stg in add emo" + stg);
		ModelAndView mdv = new ModelAndView("home3");
		sef.setAttribute("stg", stg);
		sef.setAttribute("deIdfrom", deptId);
		sef.setAttribute("lstyc", lsty);
		sef.setAttribute("ldvlt", ldeptval);
		if (stg == null) {

			// request.setAttribute("dept",sef.getAttribute("lisvaldept") );
			mdv.addObject("hom", "homep");
			mdv.addObject("valcheck", "regemployee");
			mdv.addObject("lis", ldeptval);
			mdv.addObject("depIdx", deptId);
			mdv.addObject("loggedInUser", sef.getAttribute("loggedInUser"));
			// request.setAttribute("dval",sef.getAttribute("dval"));
			mdv.addObject("empl", 0);
			mdv.addObject("val", lsty);
			return mdv;

		} else {
			int x = Integer.parseInt(stg);
			if (x == 0) {
				mdv.addObject("hom", "homep");
				mdv.addObject("newtab", "ntabl");
				mdv.addObject("depIdx", deptId);
				mdv.addObject("loggedInUser", sef.getAttribute("loggedInUser"));
				mdv.addObject("empl", 0);
				mdv.addObject("val", lsty);
				// return mdv;
			}
			return mdv;
		}

	}

	@SuppressWarnings("unchecked")
	@RequestMapping("/saveemployee")
	public ModelAndView saveEmployee(@ModelAttribute("emppage") Employee emp, 
			HttpServletRequest request, HttpServletResponse response)

	{

		HttpSession scf = request.getSession();
		String stg = (String) scf.getAttribute("stg");
		//int depIdx = (int) scf.getAttribute("deIdfrom");
		System.out.println("stg in saveemp" + stg + "emp val " + emp.getEmpName() + "emp val " + emp.toString());
		/*
		 * System.out.println("error ields "+errors.getObjectName() +
		 * errors.getErrorCount()+" "+errors.toString()); if(errors.hasErrors()) {
		 * ModelAndView mdvl = new ModelAndView("home3");
		 * 
		 * if(stg == null) {
		 * 
		 * //request.setAttribute("dept",sef.getAttribute("lisvaldept") );
		 * mdvl.addObject("hom", "homep"); mdvl.addObject("valcheck", "regemployee");
		 * mdvl.addObject("lis",scf.getAttribute("ldvlt"));
		 * mdvl.addObject("loggedInUser", scf.getAttribute("loggedInUser"));
		 * System.out.println("depIdx "+depIdx);
		 * //request.setAttribute("dval",sef.getAttribute("dval"));
		 * mdvl.addObject("empl", 0); mdvl.addObject("val",scf.getAttribute("lstyc"));
		 * return mdvl;
		 * 
		 * 
		 * } else { int x = Integer.parseInt(stg); if(x==0) {ModelAndView mdvlk = new
		 * ModelAndView("home3");
		 * 
		 * System.out.println("empid 0 executes"); mdvlk.addObject("hom", "homep");
		 * mdvlk.addObject("newtab", "ntabl"); mdvlk.addObject("depIdx",depIdx );
		 * System.out.println("depIdx "+depIdx); mdvlk.addObject("loggedInUser",
		 * scf.getAttribute("loggedInUser")); mdvlk.addObject("empl", 0);
		 * mdvlk.addObject("val",scf.getAttribute("lstyc"));
		 * 
		 * //return mdv; return mdvlk;
		 * 
		 * }
		 * 
		 * }
		 * 
		 * 
		 * }
		 */
		Employee eml = new Employee();

		// int empId = request.getParameter("empId");
		String name = emp.getEmpName();
		String mailId = emp.getMailId();
		String dob = emp.getDateOfBirth();
		long mob = emp.getMobileNo();
		float sal = emp.getSalary();
		String comName = emp.getCompanyName();
		String deptempName = request.getParameter("deptEmpNa");
		List<Department> lsv = (List<Department>) scf.getAttribute("lisdept");
        
		int studeptid = 0;
		for (Department department : lsv) {
			if (department.getDeptName().equals(deptempName)) {
				
				System.out.println("changeval"+department.getDeptId());
				studeptid = department.getDeptId();
			}
		}

		System.out.println("dept id" + studeptid);

		Department df = new Department();
		df.setDeptId(studeptid);
		//eml.setEmpId(0);
		eml.setEmpName(name);
		eml.setMailId(mailId);
		eml.setDateOfBirth(dob);
		eml.setDeptEmpFk(studeptid);
		eml.setCompanyName(comName);
		eml.setMobileNo(mob);
		eml.setSalary(sal);
		System.out.println("values from save employee" + name);
		
		Employee empp = restTemplate.postForObject("http://gateway-service/department/employee/saveEmp/" + eml.getDeptEmpFk(), eml, Employee.class);

		// deptEmpService.createEmpServ(eml);
		HttpSession sem = request.getSession();
		sem.setAttribute("submitDoneEmp", "done");

		return new ModelAndView("redirect:/listEmp?deptId=" + studeptid);
		/*
		 * HttpSession scf = request.getSession(); ModelAndView mdv = new
		 * ModelAndView("home3"); System.out.println(emp.getEmpName());
		 * if(!(errors.hasErrors())) {System.out.println("inside "+emp.getEmpName());
		 * Employee eml = new Employee();
		 * 
		 * //int empId = request.getParameter("empId"); String name = emp.getEmpName();
		 * String mailId = emp.getMailId(); String dob = emp.getDateOfBirth(); long mob
		 * = emp.getMobileNo(); float sal =emp.getSalary(); String comName =
		 * emp.getCompanyName(); String deptempName =request.getParameter("deptEmpNa");
		 * List<Department> lsv = (List<Department>) scf.getAttribute("lisdept");
		 * 
		 * int studeptid = 0; for (Department department : lsv) {
		 * if(department.getDeptName().equals(deptempName)) { studeptid=
		 * department.getDeptId(); } }
		 * 
		 * System.out.println("dept id"+studeptid);
		 * 
		 * Department df = new Department(); df.setDeptId(studeptid); //eml.setEmpId(0);
		 * eml.setEmpName(name); eml.setMailId(mailId); eml.setDateOfBirth(dob);
		 * eml.setDepartment(df);; eml.setCompanyName(comName); eml.setMobileNo(mob);
		 * eml.setSalary(sal); System.out.println("values from save employee"+name);
		 * deptEmpService.createEmpServ(eml); HttpSession sem = request.getSession();
		 * sem.setAttribute("submitDoneEmp","done");
		 * 
		 * return new ModelAndView("redirect:listEmp?deptId="+studeptid); }
		 * 
		 * else
		 * 
		 * { String stg = (String) scf.getAttribute("stg");
		 * System.out.println("stg"+stg); System.out.println("excecuting has error");
		 * 
		 * int x = Integer.parseInt(stg);
		 * 
		 * if(x != 0) { System.out.println("excecutes ne 0");
		 * //request.setAttribute("dept",sef.getAttribute("lisvaldept") );
		 * mdv.addObject("hom", "homep"); mdv.addObject("valcheck", "regemployee");
		 * mdv.addObject("lis",scf.getAttribute("ldvlt")); mdv.addObject("loggedInUser",
		 * scf.getAttribute("loggedInUser"));
		 * //request.setAttribute("dval",sef.getAttribute("dval"));
		 * mdv.addObject("empl", 0); mdv.addObject("val",scf.getAttribute("lstyc"));
		 * return mdv;
		 * 
		 * 
		 * } else { System.out.println("excecutes eq 0"); mdv.addObject("hom", "homep");
		 * mdv.addObject("newtab", "ntabl"); mdv.addObject("depIdx",
		 * scf.getAttribute("depIdx")); mdv.addObject("loggedInUser",
		 * scf.getAttribute("loggedInUser")); mdv.addObject("empl", 0);
		 * mdv.addObject("val",scf.getAttribute("lstyc")); //return mdv; }
		 * 
		 * 
		 * }
		 * 
		 * return mdv;
		 */
	}

	@RequestMapping("/admintab")
	public ModelAndView adminTag(HttpServletRequest request, HttpServletResponse response) {
		HttpSession sacc = request.getSession();
		ModelAndView mdv = new ModelAndView("home3");
		mdv.addObject("loggedInUser", sacc.getAttribute("loggedInUser"));
		mdv.addObject("adtag", "admintag");
		return mdv;
	}

	@RequestMapping("/hrtab")
	public ModelAndView hrTab(HttpServletRequest request, HttpServletResponse response) {
		HttpSession sac = request.getSession();

		ModelAndView mdv = new ModelAndView("home3");
		mdv.addObject("loggedInUser", sac.getAttribute("loggedInUser"));
		mdv.addObject("hrtag", "Hrtag");
		return mdv;
	}

	@RequestMapping("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {

		HttpSession sess = request.getSession();
		sess.removeAttribute("loggedInUser");

		sess.invalidate();

		return new ModelAndView("redirect:/");
	}

	@PostMapping("/saveempchk")
	public String saveEmp(@RequestBody Employee emp, @PathVariable int deptEmpFk) {
		Employee empp = restTemplate.postForObject(
				"http://gateway-service/department/employee/saveEmp/" + emp.getDeptEmpFk(), emp, Employee.class);
		System.out.println("values" + emp.getEmpName());
		return "Dept not found ! so employee creation failed";
	}

}
