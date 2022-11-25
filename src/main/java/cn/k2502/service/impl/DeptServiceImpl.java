package cn.k2502.service.impl;

import cn.k2502.dto.resp.DeptNode;
import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Dept;
import cn.k2502.mapper.DeptMapper;
import cn.k2502.service.IDeptService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
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

	/**
	 * 查询所有的部门信息
	 * @return 部门信息
	 */
	@Override
	public RespBean findAll() {
		try {
			List<Dept> list = this.baseMapper.selectList(new QueryWrapper<Dept>());
			Dept dept = new Dept();
			dept.setId(0); // 设置顶级部门
			dept.setDeptName("宏鹏集团-HMB");
			list.add(0,dept); // 设置第一位
			return RespBean.success("部门列表查询成功",list);
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("部门列表查询失败");
		}
	}

	@Override
	public RespBean checkDeptName(String deptName) {
		try {
			Dept dept = this.baseMapper.selectOne(new QueryWrapper<Dept>().eq("dept_name", deptName));
			if(dept != null){ //部门名称已经存在
				return RespBean.success("部门名称已经存在",true);
			}
			return RespBean.success("部门名称不存在",false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return RespBean.error("根据部门名称查询失败");
	}

	@Override
	public RespBean saveDept(Dept dept) {
		try {
			this.baseMapper.insert(dept);
			return RespBean.success("添加部门成功");
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("添加部门失败");
		}
	}

	/**
	 * 根据ID 修改部门信息
	 * @param dept 部门对象
	 * @return 成功/失败
	 */
	@Override
	public RespBean updateDept(Dept dept) {
		try {
			this.baseMapper.updateById(dept);
			return RespBean.success("修改部门成功");
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("修改部门失败");
		}
	}
}
