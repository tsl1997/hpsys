package cn.k2502.service;

import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Employee;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-23
 */
public interface IEmployeeService extends IService<Employee> {
	/**
	 *  查询所有的员工
	 * @return 员工信息列表
	 */
	RespBean findAll();
}
