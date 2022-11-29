package cn.k2502.service.impl;

import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.EmployeeStatus;
import cn.k2502.mapper.EmployeeStatusMapper;
import cn.k2502.service.IEmployeeStatusService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-29
 */
@Service
public class EmployeeStatusServiceImpl extends ServiceImpl<EmployeeStatusMapper, EmployeeStatus> implements IEmployeeStatusService {

	/**
	 * 查询所有的职位状态
	 * @return 成功/失败
	 */
	@Override
	public RespBean findAll() {
		try {
			List<EmployeeStatus> list = this.baseMapper.selectList(new QueryWrapper<EmployeeStatus>());
			return RespBean.success("查询职位状态成功",list);
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("查询职位状态失败");
		}
	}
}
