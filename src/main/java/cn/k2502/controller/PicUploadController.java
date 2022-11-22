package cn.k2502.controller;

import cn.k2502.dto.resp.RespBean;
import cn.k2502.service.PicUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;

/**
 * @author HMB-XS
 * @date 2022年11月22日18:59:08
 **/
@RestController
@RequestMapping("/pic")
public class PicUploadController {
	@Autowired
	private PicUploadService picUploadService;

	@PostMapping("/upload")
	public RespBean uploadPic(MultipartFile  file){
		return  picUploadService.uploadPic(file);
	}
}
