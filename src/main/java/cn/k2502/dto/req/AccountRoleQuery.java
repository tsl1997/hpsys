package cn.k2502.dto.req;

import lombok.Data;

/**
 * @author HMB-XS
 * @date 2022年11月30日18:49:59
 **/
@Data
public class AccountRoleQuery extends BaseQuery {
	private String roleId; // 角色id
	private String empName; // 员工名称
	private String empNum; // 员工工号
}
