package cn.k2502.controller;


import cn.k2502.dto.resp.RespBean;
import cn.k2502.service.IEmployeeStatusService;
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
 * @since 2022-11-29
 */
@RestController
@RequestMapping("/employee-status")
public class EmployeeStatusController {
	@Autowired
	private IEmployeeStatusService employeeStatusService;

	/**
	 * 查询所有的职位状态
	 * @return 成功/失败
	 */
	@GetMapping("/findAll")
	public RespBean findAll() {
		return employeeStatusService.findAll();
	}

}

