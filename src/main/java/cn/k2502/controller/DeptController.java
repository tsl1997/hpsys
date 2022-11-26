package cn.k2502.controller;


import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.Dept;
import cn.k2502.service.IDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-23
 */
@RestController
@RequestMapping("/dept")
public class DeptController {

	@Autowired
	private IDeptService deptService;

	@RequestMapping("/findDeptList")
	public RespBean findDeptList() {
		return deptService.getDeptList();
	}

	/**
	 * 查询所有部门信息
	 * @return 部门信息
	 */
	@RequestMapping("/findAll")
	public RespBean findAll() {
		return deptService.findAll();
	}

	/**
	 * 查询部门名称是否存在
	 * @param deptName 部门名称
	 * @return True/False
	 */
	@GetMapping("/checkDeptName")
	public RespBean checkDeptName(@RequestParam String deptName) {
		return deptService.checkDeptName(deptName);
	}

	/**
	 * 添加部门
	 * @param dept 部门对象
	 * @return
	 */
	@PostMapping("/save")
	public RespBean save(@RequestBody Dept dept) {
		return deptService.saveDept(dept);
	}

	/**
	 * 修改部门信息 （根据部门id）
	 * @param dept 部门对象
	 * @return 成功/失败
	 */
	@PostMapping("/update")
	public RespBean updateDept(@RequestBody Dept dept) {
		return deptService.updateDept(dept);
	}

	/**
	 * 删除部门 及其下属部门
	 * @param id 删除部门的id
	 * @return 成功/失败
	 */
	@GetMapping("/delete")
	public RespBean delete(@RequestParam Integer id) {
		return deptService.deleteDept(id);
	}

}

