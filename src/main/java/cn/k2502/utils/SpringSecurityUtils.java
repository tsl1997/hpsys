package cn.k2502.utils;

import cn.k2502.pojo.Account;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * @author HMB-XS
 * @date 2022年11月22日13:06:43
 **/
public class SpringSecurityUtils {
	/**
	 * 获取Account对象
	 */
	public static Account getAccount(){
		return (Account)SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
	}
}
