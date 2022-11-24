package cn.k2502.service.impl;

import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Employee;
import cn.k2502.mapper.EmployeeMapper;
import cn.k2502.service.IEmployeeService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-23
 */
@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements IEmployeeService {

	/**
	 * 查询所有的员工信息
	 * @return 员工信息
	 */
	@Override
	public RespBean findAll() {
		try {
			List<Employee> list = this.baseMapper.selectList(new QueryWrapper<Employee>());
			return RespBean.success("员工列表查询成功",list);
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("员工列表查询失败");
		}
	}
}
