package com.soo.sootudy.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.soo.sootudy.service.S3Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
//@Controller
public class UploadControllerS3 {
	
    private S3Service s3Service;

    @GetMapping("/upl")
    public String index() {
        return "index";
    }

//    @PostMapping("/uploadh")
//    @ResponseBody
//    public String upload(@RequestParam("data") MultipartFile multipartFile) throws IOException {
//        return s3Uploader.upload(multipartFile, "static");
//    }
    
    @ResponseBody
	@RequestMapping(value = "/uploadh", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String uploadAjaxCertificate(MultipartFile file) throws Exception {

		log.info("자격증");
		log.info("originalName: " + file.getOriginalFilename());
		String uploadpath = "almom/certificate";

		ResponseEntity<String> img_path = new ResponseEntity<>(
				s3Service.uploadFile(uploadpath, file.getOriginalFilename(), file.getBytes()),
				HttpStatus.CREATED);
		String certificatePath = (String) img_path.getBody();

		return certificatePath;
	
    }
}
