package com.soo.sootudy.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.annotation.PropertySources;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.GetObjectRequest;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.util.IOUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@PropertySources({
	@PropertySource( value = "classpath:/application.properties", ignoreResourceNotFound = true ),
//	window
    @PropertySource( value = "file:c:/dev/config.properties", ignoreResourceNotFound = true ),
// linux
    @PropertySource( value = "file:${catalina.home}/config/application.properties", ignoreResourceNotFound = true)
})
public class S3ServiceImpl implements S3Service{

	
	 private AmazonS3 s3Client;
	
	 @Value("${spring.aws.credentials.accessKey}")
	 private String accessKey;
	    
	 @Value("${spring.aws.credentials.secretKey}")
	 private String secretKey;
	 
	 @Value("${spring.aws.s3.region}")
	 private String region;
	 
//   
	 
	 @PostConstruct
	    private void initializeAmazon() {
	        AWSCredentials credentials = new BasicAWSCredentials(this.accessKey, this.secretKey);
	        this.s3Client = AmazonS3ClientBuilder.standard()
	        		.withRegion(Regions.AP_NORTHEAST_2)
//	                .withRegion(region)
//	                .withRegion(Regions.fromName(region))
	                .withCredentials(new AWSStaticCredentialsProvider(credentials))
	                .build();
	    }
//	public S3ServiceImpl() {
//		 AWSCredentials awsCredentials = new BasicAWSCredentials(accessKey, secretKey);
//		 amazonS3Client = AmazonS3ClientBuilder
//	            .standard()
//	            .withCredentials(new AWSStaticCredentialsProvider(awsCredentials))
//	            .withRegion(Regions.AP_NORTHEAST_2)
//	            .withForceGlobalBucketAccessEnabled(true)
//	            .build();
//
//	 }
	

	
	
	private static String bucket="soojae3";
	 
	 	@Override
		public String upload(MultipartFile multipartFile, String dirName) throws IOException {
	        File uploadFile = convert(multipartFile)
	                .orElseThrow(() -> new IllegalArgumentException("MultipartFile -> File로 전환이 실패했습니다."));

	        return upload(uploadFile, dirName);
	    }
	 	@Override
	 	public ResponseEntity<byte[]> download(String key) throws IOException {
            GetObjectRequest getObjectRequest = new GetObjectRequest(bucket, key);
            S3Object s3Object = s3Client.getObject(getObjectRequest);
            S3ObjectInputStream objectInputStream = s3Object.getObjectContent();
            byte[] bytes = IOUtils.toByteArray(objectInputStream);
            String fileName = URLEncoder.encode(key, "UTF-8").replaceAll("\\+", "%20");
            HttpHeaders httpHeaders = new HttpHeaders();
            httpHeaders.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            httpHeaders.setContentLength(bytes.length);
            httpHeaders.setContentDispositionFormData("attachment", fileName);
            return new ResponseEntity<>(bytes, httpHeaders, HttpStatus.OK);
      }
	 	
	 	@Override
	 	public String upload(File uploadFile, String dirName) {
	    	//dirName : S3에 생성된 디렉토리
	        String fileName = dirName + "/" + uploadFile.getName();
	        String uploadImageUrl = putS3(uploadFile, fileName);
	        removeNewFile(uploadFile);
	        return uploadImageUrl;
	    }
	 	@Override
	 	public String putS3(File uploadFile, String fileName) {
	 		s3Client.putObject(new PutObjectRequest(bucket, fileName, uploadFile).withCannedAcl(CannedAccessControlList.PublicRead));
	        log.info(" amazonS3Client.getUrl(globalPropertySource.getBucket(), fileName).toString()"+ s3Client.getUrl(bucket, fileName).toString());
	        return s3Client.getUrl(bucket, fileName).toString();
	    }
	 	@Override
	 	public void removeNewFile(File targetFile) {
	        if (targetFile.delete()) {
	            log.info("파일이 삭제되었습니다.");
	        } else {
	            log.info("파일이 삭제되지 못했습니다.");
	        }
	    }
	 	@Override
	 	public Optional<File> convert(MultipartFile file) throws IOException {
	        File convertFile = new File(file.getOriginalFilename());
	        if(convertFile.createNewFile()) {
	            try (FileOutputStream fos = new FileOutputStream(convertFile)) {
	                fos.write(file.getBytes());
	            }
	            return Optional.of(convertFile);
	        }

	        return Optional.empty();
	    }
		@Override
		public void create() {
			// TODO Auto-generated method stub
			s3Client.createBucket(bucket);
		}
	}

