package cn.k2502.dto.req;

import lombok.Data;

/**
 * 用户密码修改参数
 * @author HMB-XS
 * @date 2022年11月22日19:05:42
 **/
@Data
public class AccountParams {
	private String newPassword;
	private String repeatPassword;
	private String photo;
}
