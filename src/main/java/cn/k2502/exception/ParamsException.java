package cn.k2502.exception;

/**
 * 自定义异常类
 * @author HMB-XS
 * @date 2022年11月22日15:10:14
 **/
public class ParamsException extends RuntimeException{
	public ParamsException(String message) {
		super(message);
	}
}
