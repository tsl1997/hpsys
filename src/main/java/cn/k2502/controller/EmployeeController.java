package cn.k2502.controller;


import cn.k2502.dto.req.EmployeeQuery;
import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Employee;
import cn.k2502.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-23
 */
@RestController
@RequestMapping("/employee")
public class EmployeeController {

	@Autowired
	private IEmployeeService employeeService;

	/**
	 * 查询所有的员工
	 * @return 员工列表
	 */
	@GetMapping("/findAll")
	public RespBean findAll() {
		return employeeService.findAll();
	}

	/**
	 * 员工信息查询
	 * @param employeeQuery 擦护心条件类
	 * @return 员工集合
	 */
	@PostMapping("/list")
	public Map<String,Object> employeeList(@RequestBody EmployeeQuery employeeQuery) {
		return  employeeService.employeeList(employeeQuery);
	}

	/**
	 * 添加员工
	 * @param employee 员工信息
	 * @return 添加结果
	 */
	@PostMapping("/add")
	public RespBean add(@RequestBody Employee employee){
		return employeeService.addEmployee(employee);
	}
}

