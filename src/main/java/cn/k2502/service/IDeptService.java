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

}
