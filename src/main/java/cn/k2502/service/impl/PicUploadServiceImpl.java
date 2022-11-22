package cn.k2502.service.impl;

import cn.hutool.core.date.DateTime;
import cn.k2502.config.AliOSSConfig;
import cn.k2502.dto.resp.RespBean;
import cn.k2502.service.PicUploadService;
import com.aliyun.oss.OSS;
import org.apache.commons.lang3.RandomUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.IOException;

/**
 * @author HMB-XS
 * @date 2022年11月22日18:48:54
 **/
@Service
public class PicUploadServiceImpl implements PicUploadService {
	@Autowired
	private OSS ossClient;
	@Autowired
	private AliOSSConfig aliOSSConfig;
	@Override
	public RespBean uploadPic(MultipartFile uploadFile)  {
		// 获取文件名
		String fileName = uploadFile.getOriginalFilename();
		String filePath = getPath(fileName);
		try {
			// 上传到OSS
			ossClient.putObject(aliOSSConfig.getBacketName(),filePath,
					new ByteArrayInputStream(uploadFile.getBytes()));
			return  RespBean.success("图片上传成功！",aliOSSConfig.getUrlPrefix()+"/"+filePath);
		} catch (IOException e) {
			e.printStackTrace();
			return RespBean.error("图片上传失败");
		}
	}

	/**
	 * 生成图片的路径和图片名
	 * @param fileName 文件名
	 * @return 图片路径
	 */
	public String getPath(String fileName) {
		DateTime dateTime = new DateTime();
		return  "images/" + dateTime.toString("yyyy") + "/" + dateTime.toString("MM")
				+ "/" + dateTime.toString("dd") + "/" + System.currentTimeMillis() + RandomUtils.nextInt(1000,9999)
				+ "." + StringUtils.substringAfterLast(fileName,".");
	}
}
