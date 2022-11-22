package cn.k2502.config;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClient;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/*
 * @author HMB-XS
 * @date 2022年11月22日18:32:45
 **/
@Configuration
@PropertySource(value = "classpath:aliyun.properties")
@ConfigurationProperties(prefix="aliyun")
@Data
public class AliOSSConfig {
	private String endpoint;
	private String backetName;
	private String urlPrefix;
	private String accessKeyId;
	private String accessKeySecret;

	@Bean
	public OSS ossClient(){
		return new OSSClient(endpoint,accessKeyId,accessKeySecret);
	}
}
