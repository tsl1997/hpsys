package cn.k2502.service;

import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.AccountRole;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-12-01
 */
public interface IAccountRoleService extends IService<AccountRole> {
	/**
	 * 添加角色
	 * @param accountId 用户id
	 * @param roleId 角色id
	 * @return 结果
	 */
	RespBean addRole(Integer accountId,Integer roleId);
	/**
	 * 删除角色
	 * @param accountId 用户id
	 * @param roleId 角色id
	 * @return 结果
	 */
	RespBean delRole(Integer accountId,Integer roleId);
}
