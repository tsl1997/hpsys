package cn.k2502.controller;


import cn.k2502.dto.resp.RespBean;
import cn.k2502.service.IEmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

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

}

