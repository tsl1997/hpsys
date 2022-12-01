package cn.k2502.service;

import cn.k2502.pojo.Permission;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-12-01
 */
public interface IPermissionService extends IService<Permission> {

	List<String> findAuthorityByUsername(String userName);

}
