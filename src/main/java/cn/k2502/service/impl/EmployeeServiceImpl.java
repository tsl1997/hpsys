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

	@Override
	public RespBean addEmployee(Employee employee) {
		try {
			employee.setFormalStatus("0"); // 未转正
			this.baseMapper.insert(employee);
			return RespBean.success("添加员工成功");
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("添加员工失败");
		}
	}

	/**
	 * 根据id查询员工信息
	 * @param id 员工id
	 * @return 员工对象
	 */
	@Override
	public RespBean findOne(Integer id) {
		try {
			Employee employee = this.baseMapper.selectById(id);
			return RespBean.success("查询员工信息成功",employee);
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("查询员工信息失败");
		}
	}

	/**
	 * 修改员工信息
	 * @param employee 员工对象
	 * @return 修改结果
	 */
	@Override
	public RespBean updateEmployee(Employee employee) {
		try {
			this.baseMapper.updateById(employee);
			return RespBean.success("修改员工成功");
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("修改员工失败");
		}
	}

	/**
	 * 根据id删除员工
	 * @param id 员工id
	 * @return 结果
	 */
	@Override
	public RespBean delete(Integer id) {
		try {
			this.baseMapper.deleteById(id);
			return RespBean.success("删除员工成功");
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("删除员工失败");
		}
	}
}
