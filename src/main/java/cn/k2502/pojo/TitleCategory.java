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

/**
 * <p>
 * 
 * </p>
 *
 * @author HMB-XS
 * @since 2022-11-29
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("t_title_category")
@ApiModel(value="TitleCategory对象", description="")
public class TitleCategory implements Serializable {

    private static final long serialVersionUID = 1L;

      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "职位编号")
    private String titleNum;

    @ApiModelProperty(value = "职位名称")
    private String titleName;

    @ApiModelProperty(value = "上级id")
    private Integer parentId;

    @ApiModelProperty(value = "层级")
    private Integer level;

    private LocalDateTime createTime;

    private LocalDateTime updateTime;

    @ApiModelProperty(value = "0：删除   1 : 正常使用   2：禁用")
    private Integer status;


}
