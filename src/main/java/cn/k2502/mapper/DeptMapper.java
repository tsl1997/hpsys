package cn.k2502.mapper;

import cn.k2502.dto.resp.DeptNode;
import cn.k2502.pojo.Dept;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import java.util.List;


/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-23
 */
public interface DeptMapper extends BaseMapper<Dept> {
	List<DeptNode> getDeptNodes();
}
