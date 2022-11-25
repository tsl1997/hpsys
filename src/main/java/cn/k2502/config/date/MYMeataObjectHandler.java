package cn.k2502.config.date;

import com.baomidou.mybatisplus.core.handlers.MetaObjectHandler;
import org.apache.ibatis.reflection.MetaObject;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;

/**
 * @author HMB-XS
 * @date 2022年11月25日08:56:11
 **/
@Component
public class MYMeataObjectHandler implements MetaObjectHandler {
	@Override
	public void insertFill(MetaObject metaObject) {
		this.setFieldValByName("createTime", LocalDateTime.now(),metaObject);
		this.setFieldValByName("updateTime", LocalDateTime.now(),metaObject);
	}

	@Override
	public void updateFill(MetaObject metaObject) {
		this.setFieldValByName("updateTime", LocalDateTime.now(),metaObject);
	}
}
