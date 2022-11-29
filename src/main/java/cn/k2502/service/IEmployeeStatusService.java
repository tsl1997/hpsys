package cn.k2502.service;

import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.EmployeeStatus;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-29
 */
public interface IEmployeeStatusService extends IService<EmployeeStatus> {
	/**
	 * 查询所有的职位状态
	 * @return 成功/失败
	 */
	RespBean findAll();
}
