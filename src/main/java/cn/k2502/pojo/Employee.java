package cn.k2502.pojo;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.time.LocalDate;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;
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
@TableName("t_employee")
@ApiModel(value="Employee对象", description="")
public class Employee implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "雇员id")
      @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "员工工号")
    private String empNum;

    @ApiModelProperty(value = "雇员名称")
    private String empName;

    @ApiModelProperty(value = "性别")
    private String gender;

    @ApiModelProperty(value = "出生日期")
    private LocalDate birthday;

    @ApiModelProperty(value = "工作地点")
    private String location;

    @ApiModelProperty(value = "入职时间")
    private LocalDateTime onBoardDate;

    @ApiModelProperty(value = "手机号")
    private String mobile;

    @ApiModelProperty(value = "qq")
    private String qq;

    @ApiModelProperty(value = "邮箱")
    private String email;

    @ApiModelProperty(value = "微信")
    private String weixin;

    @ApiModelProperty(value = "所在部门")
    private Integer deptId;

    @ApiModelProperty(value = "职位类别")
    private Integer titleCategoryId;

    @ApiModelProperty(value = "职位")
    private Integer titleId;

    @ApiModelProperty(value = "职位状态")
    private Integer employStatusId;

    @ApiModelProperty(value = "毕业院校")
    private String graduateSchool;

    @ApiModelProperty(value = "学历")
    private String education;

    @ApiModelProperty(value = "0:未转正;1:已转正")
    private String formalStatus;


}
