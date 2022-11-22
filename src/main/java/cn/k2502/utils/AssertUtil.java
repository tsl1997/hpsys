package cn.k2502.utils;

import cn.k2502.exception.ParamsException;

/**
 * @author HMB-XS
 * @date 2022年11月22日15:13:01
 **/
public class AssertUtil {
	public static void isTrue(Boolean flag,String msg){
		if(flag){
			throw new ParamsException(msg);
		}
	}
}
