package cn.k2502.service;

import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Role;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-12-01
 */
public interface IRoleService extends IService<Role> {
	/**
	 * 查询所有的角色
	 * @return 角色列表
	 */
	RespBean findAll();
}
