package cn.k2502.config.security.handler;

import cn.k2502.dto.resp.RespBean;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 登录失败的后处理器
 * @author HMB-XS
 * @date 2022年11月21日20:07:34
 **/
@Component
public class HpSysAuthenticationFailedHandler extends SimpleUrlAuthenticationFailureHandler {
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
		// 设置响应格式
		response.setContentType("application/json;charset=UTF-8");
		// 设置成功的返回信息
		response.getWriter().write(new ObjectMapper().writeValueAsString(RespBean.error("用户名或密码错误")));
	}
}
