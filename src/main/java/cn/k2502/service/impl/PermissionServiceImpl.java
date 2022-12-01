package cn.k2502.service.impl;

import cn.k2502.pojo.Permission;
import cn.k2502.mapper.PermissionMapper;
import cn.k2502.service.IPermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-12-01
 */
@Service
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements IPermissionService {

	@Override
	public List<String> findAuthorityByUsername(String userName) {
		return this.baseMapper.findAuthorityByUsername(userName);
	}
}
