package cn.k2502.dto.req;

import lombok.Data;

/**
 * 用户查询条件类
 * @author HMB-XS
 * @date 2022年11月28日20:57:48
 **/
@Data
public class EmployeeQuery {
	private String empName;
	private String deptId;
	private String empNum;
	private Integer page;
	private Integer limit;
}
