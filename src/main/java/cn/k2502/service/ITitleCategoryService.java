package cn.k2502.service;

import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.TitleCategory;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-29
 */
public interface ITitleCategoryService extends IService<TitleCategory> {
	/**
	 * 查询所有的职位
	 * @return 职位信息列表
	 */
	RespBean findAll();
}
