package cn.k2502.controller;


import cn.k2502.dto.req.AccountParams;
import cn.k2502.dto.req.AccountRoleQuery;
import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Account;
import cn.k2502.service.IAccountService;
import cn.k2502.utils.SpringSecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-21
 */
@RestController
@RequestMapping("/account")
public class AccountController {

	@GetMapping("/getUser")
	public RespBean getUser(){
		try {
			// 可以从SpringSecurity中获取用户对象
			Account account = SpringSecurityUtils.getAccount();
			return RespBean.success("获取用户对象成功",account);
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("获取用户对象失败");
		}
	}

	@Autowired
	private IAccountService accountService;

	@RequestMapping("/updatePassword")
	public RespBean updatePassword(@RequestBody AccountParams accountParams){
		// 定义全局统一异常管理 注释此处代码
		/*try {
			// 修改密码
			accountService.updatePassword(accountParams);
			return RespBean.success("修改成功");
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error(e.getMessage());
		}*/

		accountService.updatePassword(accountParams);
		return RespBean.success("修改成功");
	}

	/**
	 * 查询用户所具备的角色
	 * @param accountRoleQuery 查询条件类
	 * @return 结果集合
	 */
	@PostMapping("/accountRoleList")
	public Map<String,Object> accountRoleList(@RequestBody AccountRoleQuery accountRoleQuery){
		return accountService.accountRoleList(accountRoleQuery);
	}

}

