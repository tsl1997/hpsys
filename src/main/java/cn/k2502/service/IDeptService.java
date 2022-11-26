package cn.k2502.service;

import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Dept;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-23
 */
public interface IDeptService extends IService<Dept> {

	RespBean getDeptList();

	/**
	 *  查询所有的部门信息
	 * @return 部门信息
	 */
	RespBean findAll();

	/**
	 * 检验部门名称是否存在
	 * @param deptName 部门名称
	 * @return
	 */
	RespBean checkDeptName(String deptName);

	/**
	 * 添加部门
	 * @param dept 部门对象
	 * @return
	 */
	RespBean saveDept(Dept dept);

	/**
	 *  修改部门
	 * @param dept 部门对象
	 * @return
	 */
	RespBean updateDept(Dept dept);

	/**
	 * 删除部门
	 * @param id 部门id
	 * @return 结果
	 */
	RespBean deleteDept(Integer id);

}
