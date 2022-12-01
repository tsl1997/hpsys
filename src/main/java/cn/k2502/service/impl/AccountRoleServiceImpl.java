package cn.k2502.service.impl;

import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.AccountRole;
import cn.k2502.mapper.AccountRoleMapper;
import cn.k2502.service.IAccountRoleService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-12-01
 */
@Service
public class AccountRoleServiceImpl extends ServiceImpl<AccountRoleMapper, AccountRole> implements IAccountRoleService {

	@Override
	public RespBean addRole(Integer accountId, Integer roleId) {
		try {
			AccountRole accountRole = new AccountRole();
			accountRole.setAccountId(accountId);
			accountRole.setRoleId(roleId);
			this.baseMapper.insert(accountRole);
			return RespBean.success("添加角色成功");
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("添加角色失败");
		}
	}

	@Override
	public RespBean delRole(Integer accountId, Integer roleId) {
		try {
			this.baseMapper.delete(new QueryWrapper<AccountRole>()
					.eq("account_id",accountId).eq("role_id",roleId));
			return RespBean.success("删除角色成功");
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("删除角色失败");
		}
	}
}
