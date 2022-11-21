package cn.k2502.config.security.handler;

import cn.k2502.dto.resp.RespBean;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 登录成功的后处理器
 * @author HMB-XS
 * @date 2022年11月21日19:52:17
 **/
@Component
public class HpSysAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws ServletException, IOException {
		// 设置响应格式
		response.setContentType("application/json;charset=UTF-8");
		// 设置成功的返回信息
		response.getWriter().write(new ObjectMapper().writeValueAsString(RespBean.success("登录成功")));
	}
}
