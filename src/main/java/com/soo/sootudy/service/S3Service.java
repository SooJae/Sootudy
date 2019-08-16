package com.soo.sootudy.service;

import java.io.File;
import java.io.IOException;
import java.util.Optional;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.model.Bucket;

public interface S3Service {

	public String upload(MultipartFile multipartFile, String dirName) throws IOException;

	public String upload(File uploadFile, String dirName);

	public String putS3(File uploadFile, String fileName);

	public void removeNewFile(File targetFile);

	public Optional<File> convert(MultipartFile file) throws IOException;

	public ResponseEntity<byte[]> download(String key) throws IOException;

	public void create();

	
	
	
}
