package cn.k2502.service.impl;

import cn.k2502.dto.resp.DeptNode;
import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Dept;
import cn.k2502.mapper.DeptMapper;
import cn.k2502.service.IDeptService;
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
public class DeptServiceImpl extends ServiceImpl<DeptMapper, Dept> implements IDeptService {

	@Override
	public RespBean getDeptList() {
		try {
			List<DeptNode> list = this.baseMapper.getDeptNodes();
			return RespBean.success("查询部门成功",list);
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("查询部门失败");
		}
	}
}
