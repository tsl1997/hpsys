package cn.k2502.mapper;

import cn.k2502.dto.req.EmployeeQuery;
import cn.k2502.pojo.Employee;
import cn.k2502.vo.EmployeeVO;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-23
 */
public interface EmployeeMapper extends BaseMapper<Employee> {
	/**
	 * 用户信息查询
	 * @param employeeQuery 擦护心条件
	 * @return 用户列表
	 */
	IPage<EmployeeVO> getEmployeesList(IPage page,@Param("employeeQuery") EmployeeQuery employeeQuery);

}
