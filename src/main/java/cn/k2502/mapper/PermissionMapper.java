package cn.k2502.mapper;

import cn.k2502.pojo.Permission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author HMB-XS
 * @since 2022-12-01
 */
public interface PermissionMapper extends BaseMapper<Permission> {
	List<String> findAuthorityByUsername(String userName);
}
