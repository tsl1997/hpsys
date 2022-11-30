package cn.k2502.dto.req;

import lombok.Data;

/**
 * @author HMB-XS
 * @date 2022年11月30日18:56:26
 **/
@Data
public class BaseQuery {
	private Integer page;
	private Integer limit;
}
