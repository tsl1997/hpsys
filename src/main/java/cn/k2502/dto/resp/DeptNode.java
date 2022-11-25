package cn.k2502.dto.resp;

import cn.k2502.pojo.Dept;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @author HMB-XS
 * @date 2022年11月23日21:51:05
 **/
@Data
@NoArgsConstructor
@AllArgsConstructor
public class DeptNode extends Dept {
	private List<DeptNode> children;
}
