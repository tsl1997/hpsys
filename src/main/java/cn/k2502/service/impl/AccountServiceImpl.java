package cn.k2502.service.impl;

import cn.k2502.dto.req.AccountParams;
import cn.k2502.dto.req.AccountRoleQuery;
import cn.k2502.dto.resp.AccountRoleDto;
import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Account;
import cn.k2502.mapper.AccountMapper;
import cn.k2502.service.IAccountService;
import cn.k2502.service.IPermissionService;
import cn.k2502.utils.AssertUtil;
import cn.k2502.utils.SpringSecurityUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-21
 */
@Service
public class AccountServiceImpl extends ServiceImpl<AccountMapper, Account> implements IAccountService {


	@Override
	public Account login(String username) {
		// 查单条
		Account account = this.baseMapper.selectOne(new QueryWrapper<Account>().eq("user_name", username));
		return account;
	}

	@Autowired
	private PasswordEncoder passwordEncoder;
	@Override
	public void updatePassword(String newPassword, String repeatPassword) {
		// 1：非空校验
		AssertUtil.isTrue(StringUtils.isBlank(newPassword),"新密码不能为空");
		AssertUtil.isTrue(StringUtils.isBlank(repeatPassword),"重复密码不能为空");
		// 2：两次是否一致
		AssertUtil.isTrue(!newPassword.equals(repeatPassword),"确认密码和重复密码不一致");
		// 3：新旧密码不可相同
		Account account = SpringSecurityUtils.getAccount();
		AssertUtil.isTrue(passwordEncoder.matches(newPassword,account.getPassword()),"新密码和原始密码不能相同");
		// 4：密码加密
		account.setPassword(passwordEncoder.encode(newPassword));
		// 5：添加到数据库
		int count = this.baseMapper.updateById(account);
		AssertUtil.isTrue(count != 1,"修改密码失败");
	}

	/**
	 * 修改用户信息 包括图像
	 * @param accountParams 前端传递的用户参数
	 */
	@Override
	public void updatePassword(AccountParams accountParams) {
		AssertUtil.isTrue(accountParams == null,"参数为空");
		String newPassword = accountParams.getNewPassword();
		String repeatPassword = accountParams.getRepeatPassword();
		// 1：非空校验
		AssertUtil.isTrue(StringUtils.isBlank(newPassword),"新密码不能为空");
		AssertUtil.isTrue(StringUtils.isBlank(repeatPassword),"重复密码不能为空");
		// 2：两次是否一致
		AssertUtil.isTrue(!newPassword.equals(repeatPassword),"确认密码和重复密码不一致");
		// 3：新旧密码不可相同
		Account account = SpringSecurityUtils.getAccount();
		AssertUtil.isTrue(passwordEncoder.matches(newPassword,account.getPassword()),"新密码和原始密码不能相同");
		// 4：密码加密
		account.setPassword(passwordEncoder.encode(newPassword));
		if(!StringUtils.isBlank(accountParams.getPhoto())){
			account.setPhoto(accountParams.getPhoto());
		}
		// 5：添加到数据库
		int count = this.baseMapper.updateById(account);
		AssertUtil.isTrue(count != 1,"修改密码失败");
	}

	/**
	 * 查询用户所具有的角色
	 * @param accountRoleQuery 查询条件
	 * @return 角色集合Map
	 */
	@Override
	public Map<String, Object> accountRoleList(AccountRoleQuery accountRoleQuery) {
		IPage<AccountRoleDto> page = new Page<>(accountRoleQuery.getPage(), accountRoleQuery.getLimit());
		page = this.baseMapper.accountRoleList(page, accountRoleQuery);
		Map<String, Object> map = new HashMap<>();
		map.put("total",page.getTotal());
		map.put("list",page.getRecords());
		return map;
	}

	/**
	 * 根据用户id 查询角色
	 * @param id 用户id
	 * @return 角色列表
	 */
	@Override
	public RespBean getRolesByAccountId(Integer id) {
		try {
			List<Integer> list = this.baseMapper.getRolesByAccountId(id);
			return RespBean.success("根据账号查询角色列表成功",list);
		} catch (Exception e) {
			e.printStackTrace();
			return  RespBean.error("根据账号查询角色列表失败");
		}
	}
}
