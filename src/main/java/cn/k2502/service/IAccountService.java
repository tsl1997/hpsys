package cn.k2502.service;

import cn.k2502.dto.req.AccountParams;
import cn.k2502.dto.req.AccountRoleQuery;
import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Account;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-21
 */
public interface IAccountService extends IService<Account> {
	/**
	 * 登录业务
	 * 根据用户名查询用户对象
	 * @param username
	 * @return
	 */
	Account login(String username);

	/**
	 * 修改密码
	 * @param newPassword		新密码
	 * @param repeatPassword	重复密码
	 */
	void updatePassword(String newPassword,String repeatPassword);

	/**
	 * 修改用户信息 包括图片
	 * @param accountParams 前端传递的用户参数
	 */
	void updatePassword(AccountParams accountParams);

	/**
	 * 查询用户所具有的角色
	 * @param accountRoleQuery 查询条件
	 * @return 用户角色集合
	 */
	Map<String,Object> accountRoleList(AccountRoleQuery accountRoleQuery);

	/**
	 * 根据用户id 查询角色
	 * @param id 用户id
	 * @return 角色列表
	 */
	RespBean getRolesByAccountId(Integer id);
}
