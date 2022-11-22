package cn.k2502.service;

import cn.k2502.dto.resp.RespBean;
import org.springframework.web.multipart.MultipartFile;

/**
 * @author HMB-XS
 * @date 2022年11月22日18:44:26
 **/
public interface PicUploadService {
	/**
	 * 上传图片到阿里云OSS
	 * @param uploadFile 上传文件
	 * @return RespBean对象
	 */
	RespBean uploadPic(MultipartFile uploadFile);
}
