package cn.k2502.service;

import cn.k2502.dto.req.EmployeeQuery;
import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Employee;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

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

	/**
	 * 查询员工--根据条件
	 * @param employeeQuery 查询条件
	 * @return 用户列表
	 */
	Map<String,Object> employeeList(EmployeeQuery employeeQuery);

	/**
	 * 添加员工
	 * @param employee 员工信息
	 * @return 添加结果
	 */
	RespBean addEmployee(Employee employee);

	/**
	 * 查询员工信息
	 * @param id 员工id
	 * @return 员工信息
	 */
	RespBean findOne(Integer id);

	/**
	 * 修改员工信息
	 * @param employee 员工对象
	 * @return 结果F/T
	 */
	RespBean updateEmployee(Employee employee);

	/**
	 * 根据员工id删除对应员工
	 * @param id 员工id
	 * @return 结果
	 */
	RespBean delete(Integer id);
}
