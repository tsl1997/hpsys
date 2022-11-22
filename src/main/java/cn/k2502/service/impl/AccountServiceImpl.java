package cn.k2502.service.impl;

import cn.k2502.pojo.Account;
import cn.k2502.mapper.AccountMapper;
import cn.k2502.service.IAccountService;
import cn.k2502.utils.AssertUtil;
import cn.k2502.utils.SpringSecurityUtils;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

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
		return this.baseMapper.selectOne(new QueryWrapper<Account>().eq("user_name",username));
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
}
