package cn.k2502.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_dept")
@ApiModel(value="Dept对象", description="")
@NoArgsConstructor
public class Dept implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "部门id")
      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "部门编号")
    private String deptNum;

    @ApiModelProperty(value = "部门名称")
    private String deptName;

    @ApiModelProperty(value = "上级部门id")
    private Integer parentId;

    @ApiModelProperty(value = "部门层级")
    private Integer level;

    @ApiModelProperty(value = "部门经理")
    private Integer managerId;

    @ApiModelProperty(value = "创建时间")
    private LocalDateTime createTime;

    @ApiModelProperty(value = "更新时间")
    private LocalDateTime updateTime;

    @ApiModelProperty(value = "0：删除   1 : 正常使用   2：禁用")
    private Integer status;


}
