package cn.k2502.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 视图转发
 * @author HMB-XS
 * @date 2022年11月21日15:51:57
 **/
@Controller
public class IndexController {

	@GetMapping("/index")
	public String index(){
		return "index";
	}

	@GetMapping("/main")
	public String main(){
		return "main";
	}


	@GetMapping("/welcome")
	public String welcome(){
		return "welcome";
	}

	@GetMapping("/dept")
	public String dept(){
		return "dept";
	}
}
