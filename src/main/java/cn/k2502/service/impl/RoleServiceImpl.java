package cn.k2502.service.impl;

import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Role;
import cn.k2502.mapper.RoleMapper;
import cn.k2502.service.IRoleService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
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
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements IRoleService {

	/**
	 * 查询所有的角色
	 * @return 角色列表
	 */
	@Override
	public RespBean findAll() {
		try {
			List<Role> roles = this.baseMapper.selectList(new QueryWrapper<Role>());
			return RespBean.success("查询角色列表成功",roles);
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("查询角色列表失败");
		}
	}
}
