package cn.k2502.generator;


import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.InjectionConfig;
import com.baomidou.mybatisplus.generator.config.*;
import com.baomidou.mybatisplus.generator.config.po.TableInfo;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

import java.util.ArrayList;

/**
 * MyBatisPlus的逆向工程
 * @author HMB-XS
 * @date 2022年11月21日16:04:39
 **/
public class CodeGen {
	public static void main(String[] args) {
		// 1：创建代码生成器对象
		AutoGenerator mpg = new AutoGenerator();
		// 2：全局配置
		GlobalConfig gc = new GlobalConfig();
		// 2.1：获取项目目录
		String projectPath = System.getProperty("user.dir");
		// 2.2：设置输出目录
		gc.setOutputDir(projectPath + "/src/main/java");
		// 2.3：设置作者
		gc.setAuthor("HMB-XS");
		// 2.4：打开输出目录
		gc.setOpen(false);
		// 2.5：XML开启生成BaseResultMap
		gc.setBaseResultMap(true);
		// 2.6：开启列列表
		gc.setBaseColumnList(true);
		// 2.7：实体类添加Swagger2注解
		gc.setSwagger2(true);
		// 3：将全局配置放入代码生成器中
		mpg.setGlobalConfig(gc);

		// 4：数据源配置  连接数据库
		DataSourceConfig dsc = new DataSourceConfig();
		dsc.setUrl("jdbc:mysql://localhost:3306/hp?userUnicode=true&characterEncoding=utf-8&useSSL=false&serverTimezone=Asia/Shanghai");
		dsc.setDriverName("com.mysql.jdbc.Driver");
		dsc.setUsername("root");
		dsc.setPassword("root");
		mpg.setDataSource(dsc);

		// 5：包配置
		PackageConfig pc = new PackageConfig();
		pc.setParent("cn.k2502")
				.setEntity("pojo")
				.setMapper("mapper")
				.setService("service")
				.setServiceImpl("service.impl")
				.setController("controller");
		mpg.setPackageInfo(pc);

		// 6：自定义配置
		InjectionConfig cfg = new InjectionConfig() {
			@Override
			public void initMap() {

			}
		};

		// 6.1：自定义输出配置
		ArrayList<FileOutConfig> focList = new ArrayList<>();
		// 自定义配置会优先输出
		focList.add(new FileOutConfig() {
			@Override
			public String outputFile(TableInfo tableInfo) {
				// 自定义输出文件名
				// 如果entity设置前后缀，此处xml的名字应该随着变化
				return projectPath + "/src/main/resources/mapper/" + tableInfo.getEntityName() +"Mapper.xml";
			}
		});
		cfg.setFileOutConfigList(focList);
		mpg.setCfg(cfg);

		// 6.2：配置策略
		StrategyConfig strategyConfig = new StrategyConfig();
		// 表映射到实体的命名策略
		strategyConfig.setNaming(NamingStrategy.underline_to_camel);
		// 表字段映射到实体的命名策略
		strategyConfig.setColumnNaming(NamingStrategy.underline_to_camel);
		// lombok模型 实体类上回有lombok注解
		strategyConfig.setEntityLombokModel(true);
		// controller 里面生成@RestController注解
		strategyConfig.setRestControllerStyle(true);
		// 输入表名  可变数组参数
		strategyConfig.setInclude(table.split(","));
		strategyConfig.setControllerMappingHyphenStyle(true);
		// 表前缀
		strategyConfig.setTablePrefix("t_");
		mpg.setStrategy(strategyConfig);
		// 7：执行代码生成器
		mpg.execute();
	}
	// 表名  多表用,分割开来
	public static String table = "t_account";
}
