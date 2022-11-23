package cn.k2502.controller.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import javax.servlet.http.HttpServletRequest;

/**
 * ControllerAdvice 提供多种指定规则方式，默认不写则是所有的Controller
 * @author HMB-XS
 * @date 2022年11月23日18:25:53
 **/
@ControllerAdvice
public class GlobalExceptionControllerAdvice {

	/**
	 * 默认处理所有异常
	 * @param e 异常
	 * @param request 请求对象
	 * @return
	 */
	@ExceptionHandler(value = Exception.class)
	public Object globalExceptionHandler(Exception e, HttpServletRequest request) {
		Boolean isNew = (Boolean) request.getAttribute("isNew");
		// 如果,响应的是视图
		if(isNew){
			request.setAttribute("message","系统异常");
			return  "error";
		}
		// 否则，响应的是JSON
		ModelAndView mv = new ModelAndView(new MappingJackson2JsonView());
		mv.addObject("code",500);
		mv.addObject("message",e.getMessage());
		return  mv;
	}
}
