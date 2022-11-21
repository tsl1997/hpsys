package cn.k2502.dto.resp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author HMB-XS
 * @date 2022年11月21日19:59:18
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class RespBean {
	/**
	 * 响应码 200 成功
	 */
	private int code;
	/**
	 * 描述信息
	 */
	private String message;
	/**
	 * 其他数据
	 */
	private Object data;

	public static RespBean success(){
		return new RespBean(200,"成功",null);
	}

	public static RespBean success(String message){
		return new RespBean(200,message,null);
	}

	public static RespBean success(String message,Object data){
		return new RespBean(200,message,data);
	}

	public static RespBean error(){
		return new RespBean(500,"失败",null);
	}

	public static RespBean  error(String message){
		return new RespBean(500,message,null);
	}

	public static RespBean  error(String message,Object data){
		return new RespBean(500,message,data);
	}
}
