package com.soo.sootudy.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.soo.sootudy.service.S3Service;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class SampleUploadController {

	@Autowired
	private S3Service s3Uploader;
	
	 @GetMapping("/u")
	    public String index() {
	        return "index";
	    }

	 
	 	@GetMapping("/bucketC")
	 	public void create() {
	 		s3Uploader.create();
	 	}
	 
	    @PostMapping("/uploadu")
	    @ResponseBody
	    public String upload(@RequestParam("data") MultipartFile multipartFile) throws IOException {
	        return s3Uploader.upload(multipartFile, "static");
	    }
	    
	    @RequestMapping(value = "/download", method = RequestMethod.GET)
	    public ResponseEntity<byte[]> download(@RequestParam String key) throws IOException {
	        return s3Uploader.download(key);
	    }
}
	    
