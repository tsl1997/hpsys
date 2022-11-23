package cn.k2502.config;

import cn.k2502.controller.exception.HpSysPreHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author HMB-XS
 * @date 2022年11月23日19:04:08
 **/
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	@Autowired
	private HpSysPreHandler hpSysPreHandler;

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		// 所有请求均由该提前处理
		registry.addInterceptor(hpSysPreHandler).addPathPatterns("/**");
	}
}
