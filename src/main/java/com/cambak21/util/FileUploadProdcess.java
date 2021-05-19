package com.cambak21.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class FileUploadProdcess {
	private static final Logger logger = LoggerFactory.getLogger(FileUploadProdcess.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileDate) throws IOException {
		logger.info("이미지 파일 업로드");
		
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString() + "_" + originalName; // 'UUID_업로드 파일이름' 형식으로 파일 이름 생성 
		String savePath = calPath(uploadPath); 
		System.out.println("savePath : " + savePath);
		System.out.println("uploadPath : " + uploadPath);
		
		File target = new File(uploadPath + savePath, savedName);
		FileCopyUtils.copy(fileDate, target); // 실제 저장
		
		String ext = originalName.substring(originalName.lastIndexOf(".") + 1); // 확장자
		
		String uploadFileName = null;
		if(MediaConfirm.getMediaType(ext) != null) {
			uploadFileName = makeThumbnail(uploadPath, savePath, savedName); // 이미지 파일이므로 썸네일 생성
		} else {
			uploadFileName = makeIcon(uploadPath, savePath, savedName); // 이미지 파일이 아니므로 파일 이름으로 생성
		}
		
		System.out.println("uploadFileName : " + uploadFileName);
		
		return uploadFileName;
	}
	
	private static String makeIcon(String uploadPath, String savePath, String savedName) {
		String iconName = uploadPath + savePath + File.separator + savedName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	public static String calPath(String uploadPath) {
		logger.info("이미지 파일 폴더명 만들기");
		
		// ************************현재 연/월/일 을 폴더로 만들기 위해 처리
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + (cal.get(Calendar.YEAR) + ""); // "\2021"
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format((cal.get(Calendar.MONTH) + 1)); // "\03"
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE)); // "\04"
		
		makeDir(uploadPath, yearPath, monthPath, datePath); // 폴더 생성 메서드 호출
		
		// ***********************************************************************
		
		return datePath; // "/2021/03/04"
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws IOException {
		logger.info("이미지 파일 썸네일 만들기");
		
		System.out.println(new File(uploadPath + path, fileName));
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100); // 높이 100px 리사이징
		
		String thumbnailName = uploadPath + path + File.separator + "thumb_" + fileName; // 썸네일 이미지의 경로와 이름
		File newThumbFile = new File(thumbnailName);
		
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1); // 확장자명 얻어오기
		
		ImageIO.write(destImg, ext.toLowerCase(), newThumbFile); // 실제 저장
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	private static void makeDir(String uploadPath, String... paths) { 
		logger.info("만든 폴더명으로 폴더 생성");
		// String... paths는 가변인자. 동일한 String 타입의 yearpath, monthPath, datePath의 변수 값을 paths의 배열 값으로 받음
//		for(String s : paths) {
//			System.out.println(s);
//		}
		
		if(new File(uploadPath + paths[paths.length - 1]).exists()) { // 해당 경로에 해당 폴더가 존재한다면, 돌아가
			return;
		}
		
		for(String path : paths) {
			File dirPath = new File(uploadPath + path);
			
			if(!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	// 김태훈>>>>>Resell에서 사용할 파일업로드===========================================================================================
	//썸네일 생성
	private static String ResellmakeThumbnail(String uploadPath, String path, String fileName) throws IOException {
		System.out.println(new File(uploadPath + path, fileName));
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 350);
		String thumbnailName = uploadPath + path + File.separator + "thumb_" + fileName; // 썸네일 이미지의 경로와 이름
		File newThumbFile = new File(thumbnailName);
		
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1); // 확장자명 얻어오기
		
		ImageIO.write(destImg, ext.toLowerCase(), newThumbFile); // 실제 저장
		
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	

	
	//실제 업로드
	public static String ReselluploadFile(String uploadPath, String originalName, byte[] fileDate) throws IOException {
		UUID uuid = UUID.randomUUID();
		
		String savedName = uuid.toString() + "_" + originalName;
		String savePath = calPath(uploadPath);
		
		File target = new File(uploadPath + savePath, savedName);
		FileCopyUtils.copy(fileDate, target); // 실제 저장
		
		String ext = originalName.substring(originalName.lastIndexOf(".") + 1); // 확장자
		
		String uploadFileName = null;
		if(MediaConfirm.getMediaType(ext) != null) {
			uploadFileName = ResellmakeThumbnail(uploadPath, savePath, savedName); // 이미지 파일이므로 썸네일 생성
		} else {
			uploadFileName = makeIcon(uploadPath, savePath, savedName); // 이미지 파일이 아니므로 파일 이름으로 생성
		}
		
		System.out.println("uploadFileName : " + uploadFileName);
		
		return uploadFileName;
	}
}
