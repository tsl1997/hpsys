package cn.k2502.controller;


import cn.k2502.dto.resp.RespBean;
import cn.k2502.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
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
@RequestMapping("/dept")
public class DeptController {

	@Autowired
	private IDeptService deptService;

	@RequestMapping("/findDeptList")
	public RespBean findDeptList() {
		return deptService.getDeptList();
	}

}

