package cn.k2502.service.impl;

import cn.k2502.dto.resp.RespBean;
import cn.k2502.pojo.TitleCategory;
import cn.k2502.mapper.TitleCategoryMapper;
import cn.k2502.service.ITitleCategoryService;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-29
 */
@Service
public class TitleCategoryServiceImpl extends ServiceImpl<TitleCategoryMapper, TitleCategory> implements ITitleCategoryService {

	/**
	 * 查询职位列表
	 * @return 职位列表
	 */
	@Override
	public RespBean findAll() {
		try {
			List<TitleCategory> list = this.baseMapper.selectList(new QueryWrapper<TitleCategory>());
			return RespBean.success("查询职位列表成功",list);
		} catch (Exception e) {
			e.printStackTrace();
			return RespBean.error("查询职位列表失败");
		}
	}
}
