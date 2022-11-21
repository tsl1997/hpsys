package cn.k2502.service;

import cn.k2502.pojo.Account;
import com.baomidou.mybatisplus.extension.service.IService;

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

}
