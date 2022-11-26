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

import javax.annotation.Resource;
import java.util.ArrayList;
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
			Integer parentId = dept.getParentId();
			if(parentId == 0){
				dept.setLevel(1);
			}else{
				Dept parentDept = this.baseMapper.selectById(parentId);
				if(parentDept.getLevel() == 3){
					return RespBean.error("不能继续往三级分类下添加分类");
				}
				dept.setLevel(parentDept.getLevel()+1);
			}
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

	@Override
	public RespBean deleteDept(Integer id) {
		try {
			// 创建一个集合，用来存储要删除的id
			ArrayList<Integer> ids = new ArrayList<>();
			ids.add(id);
			// 查询要删除的id将id放入集合中
			this.getDeleteIds(ids,id);
			// 删除
			this.baseMapper.deleteBatchIds(ids);
			return RespBean.success("删除成功");
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("删除失败");
		}
	}

	private void getDeleteIds(ArrayList<Integer> ids, Integer id) {
		// 查询二级分类
		List<Dept> twoList = this.baseMapper.selectList(new QueryWrapper<Dept>().eq("parent_id", id));
		// 遍历二级分类，将二级分类的id作为父id
		for (Dept dept : twoList) {
			Integer twoId = dept.getId();
			// 放入刀集合中
			ids.add(twoId);
			// 把二级分类的每个id，查询下以及分类
			this.getDeleteIds(ids,twoId);
		}
	}
}
