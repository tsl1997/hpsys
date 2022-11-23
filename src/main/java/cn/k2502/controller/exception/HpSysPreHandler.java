package cn.k2502.controller.exception;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * @author HMB-XS
 * @date 2022年11月23日18:49:17
 **/
@Component
public class HpSysPreHandler implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		if(!(handler instanceof HandlerMethod)){
			return true;
		}
		HandlerMethod handlerMethod = (HandlerMethod) handler;
		// 获取访问的资源
		Method method = handlerMethod.getMethod();
		// 判断方法返回结果
		boolean iString = method.getReturnType().equals(String.class);
		// 判断方法级别是否标记为ResponseBody注解
		boolean isResponseBody = method.isAnnotationPresent(ResponseBody.class);
		// 判断类级别 是否标记RestController注解
		boolean isRestController = handlerMethod.getBeanType().isAnnotationPresent(RestController.class);
		// 判断结果
		boolean isNew = isRestController == true ? false : (iString && isResponseBody);
		request.setAttribute("isNew",isNew);
		return true;
	}
}
