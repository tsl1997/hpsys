package cn.k2502.service.impl;

import cn.k2502.dto.req.EmployeeQuery;
import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Employee;
import cn.k2502.mapper.EmployeeMapper;
import cn.k2502.service.IEmployeeService;
import cn.k2502.vo.EmployeeVO;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	/**
	 * 查询用户——根据条件
	 * @param employeeQuery 查询条件
	 * @return 用户列表
	 */
	@Override
	public Map<String, Object> employeeList(EmployeeQuery employeeQuery) {
		IPage<EmployeeVO> page = new Page<>(employeeQuery.getPage(), employeeQuery.getLimit());
		HashMap<String, Object> map = new HashMap<>();
		page = this.baseMapper.getEmployeesList(page, employeeQuery);
		map.put("total",page.getTotal()); // 总的信息条数
		map.put("list",page.getRecords()); // 一页数据
		return map;
	}
}
