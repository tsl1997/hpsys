package cn.k2502.controller;


import cn.k2502.dto.resp.RespBean;
import cn.k2502.service.IRoleService;
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
 * @since 2022-12-01
 */
@RestController
@RequestMapping("/role")
public class RoleController {

	@Autowired
	private IRoleService roleService;

	/**
	 * 查询所有的角色
	 * @return 角色列表
	 */
	@GetMapping("/findAll")
	public RespBean findAll() {
		return  roleService.findAll();
	}

}

