package cn.k2502.service.impl;

import cn.k2502.pojo.Account;
import cn.k2502.mapper.AccountMapper;
import cn.k2502.service.IAccountService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
}
