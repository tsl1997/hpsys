package cn.k2502.controller;


import cn.k2502.dto.resp.RespBean;
import cn.k2502.service.ITitleCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-29
 */
@RestController
@RequestMapping("/title-category")
public class TitleCategoryController {
	@Autowired
	private ITitleCategoryService titleCategoryService;

	/**
	 * 查询职位列表
	 * @return 职位列表
	 */
	@GetMapping("/findAll")
	public RespBean findAll() {
		return titleCategoryService.findAll();
	}

}

