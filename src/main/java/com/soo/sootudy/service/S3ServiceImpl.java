package com.soo.sootudy.service;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Optional;
import java.util.UUID;

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
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.amazonaws.util.IOUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
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
	                .withCredentials(new AWSStaticCredentialsProvider(credentials))
	                .build();
	    }

	
	
	private static String bucket="soojae";
	 
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
		
		public void fileUpload(String bucketName, String fileName, byte[] fileData) throws FileNotFoundException {

			String filePath = (fileName).replace(File.separatorChar, '/'); // 파일 구별자를 `/`로 설정(\->/) 이게 기존에 / 였어도 넘어오면서 \로 바뀌는 거같다.
			ObjectMetadata metaData = new ObjectMetadata();

			metaData.setContentLength(fileData.length);   //메타데이터 설정 -->원래는 128kB까지 업로드 가능했으나 파일크기만큼 버퍼를 설정시켰다.
		    ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(fileData); //파일 넣음

		    s3Client.putObject(bucketName, filePath, byteArrayInputStream, metaData);

		}
//		@Override
//		public String uploadFile(String uploadPath, String originalName, byte[] byteData) {
//			String bucketName = "almombucket";
//			//랜덤의 uid 를 만들어준다.
//			UUID uid = UUID.randomUUID();
//
//			//savedName : 570d570a-7af1-4afe-8ed5-391d660084b7_g.JPG 같은 형식으로 만들어준다.
//			String savedName = "/"+uid.toString() + "_" + originalName;
//
//			log.info("업로드 경로 : "+uploadPath);
//			//\2017\12\27 같은 형태로 저장해준다.
//			String savedPath = calcPath(uploadPath);
//
//			String uploadedFileName = null;
//
//			uploadedFileName = (savedPath + savedName).replace(File.separatorChar, '/');
//			//S3Util 의 fileUpload 메서드로 파일을 업로드한다.
//			s3Client.fileUpload(bucketName, uploadPath+uploadedFileName, byteData);
//
//
//			log.info(uploadedFileName);
//
//			return uploadedFileName;
//		}
		@Override
		public String uploadFile(String uploadpath, String originalFilename, byte[] byteData) {
			// TODO Auto-generated method stub
			return null;
		}
	
	

	}

