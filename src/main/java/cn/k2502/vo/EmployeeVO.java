package cn.k2502.vo;

import cn.k2502.pojo.Employee;
import lombok.Data;

/**
 * @author HMB-XS
 * @date 2022年11月28日20:42:20
 **/
@Data
public class EmployeeVO extends Employee {
	/**
	 * 登录名
	 */
	private String userName;
	/**
	 * 部门编号
	 */
	private String deptNum;
	/**
	 * 部门名称
	 */
	private String deptName;
	/**
	 * 职位名称
	 */
	private String titleName;
	/**
	 * 职位状态
	 */
	private String empStatus;
}
