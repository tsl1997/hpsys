package cn.k2502.mapper;

import cn.k2502.dto.req.AccountRoleQuery;
import cn.k2502.dto.req.EmployeeQuery;
import cn.k2502.dto.resp.AccountRoleDto;
import cn.k2502.pojo.Account;
import cn.k2502.vo.EmployeeVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-21
 */
public interface AccountMapper extends BaseMapper<Account> {
	IPage<AccountRoleDto> accountRoleList(IPage page, @Param("accountRoleQuery")AccountRoleQuery accountRoleQuery);
}
