package cn.k2502.controller;


import cn.k2502.dto.resp.RespBean;
import cn.k2502.service.IAccountRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestParam;
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
@RequestMapping("/account-role")
public class AccountRoleController {
	@Autowired
	private IAccountRoleService accountRoleService;

	@GetMapping("/addRole")
	public RespBean addRole(@RequestParam Integer accountId,
							@RequestParam Integer roleId) {
		return accountRoleService.addRole(accountId, roleId);
	}

	@GetMapping("/delRole")
	public RespBean delRole(@RequestParam Integer accountId,
							@RequestParam Integer roleId) {
		return accountRoleService.delRole(accountId, roleId);
	}


}

