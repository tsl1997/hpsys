package cn.k2502.controller;


import cn.k2502.dto.req.EmployeeQuery;
import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Employee;
import cn.k2502.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
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
	@PreAuthorize("hasAuthority('6010')")
	public RespBean findAll() {
		return employeeService.findAll();
	}

	/**
	 * 员工信息查询
	 * @param employeeQuery 查询条件类
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

	/**
	 * 根据id查询员工
	 * @param id 员工id
	 * @return 员工对象
	 */
	@GetMapping("/findOne")
	public RespBean findOne(@RequestParam Integer id){
		return employeeService.findOne(id);
	}

	/**
	 * 修改员工信息
	 * @param employee 员工对象
	 * @return 修改结果
	 */
	@PostMapping("/update")
	public RespBean update(@RequestBody Employee employee){
		return employeeService.updateEmployee(employee);
	}

	/**
	 * 根据id 删除员工
	 * @param id 员工id
	 * @return 删除结果
	 */
	@GetMapping("/delete")
	public RespBean delete(@RequestParam Integer id){
		return employeeService.delete(id);
	}
}

