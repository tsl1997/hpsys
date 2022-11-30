package cn.k2502.dto.resp;

import lombok.Data;

/**
 * @author HMB-XS
 * @date 2022年11月30日19:37:44
 **/
@Data
public class AccountRoleDto {
	private Integer aid; // 账户id
	private String userName; // 用户名--登录名
	private String empNum; // 员工工号
	private String empName; // 员工姓名
	private String depNum; // 部门编号
	private String title; // 职位
}
