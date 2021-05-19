package com.cambak21.util;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class BoardCsFileUpload {
	private static final Logger logger = LoggerFactory.getLogger(BoardCsFileUpload.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileDate) throws IOException {
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString() + "_" + originalName;
		String savePath = calPath(uploadPath);
		
		String ext = originalName.substring(originalName.lastIndexOf(".") + 1); // 확장자
		
		String uploadFileName = null;
		// 이미지 파일이면 실제 저장하고 해당 경로 반환
		if(MediaConfirm.getMediaType(ext) != null) {
			File target = new File(uploadPath + savePath, savedName);
			FileCopyUtils.copy(fileDate, target); // 실제 저장
			uploadFileName = savePath + "\\" + savedName; // 이미지 파일이므로 썸네일 생성
		} else {
			// 이미지 파일이 아니면 ...
			uploadFileName = "-1"; // 이미지 파일이 아니므로 -1 반환
		}
		
		return uploadFileName;
	}
	
	public static String calPath(String uploadPath) {
		// ************************현재 연/월/일 을 폴더로 만들기 위해 처리
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + (cal.get(Calendar.YEAR) + ""); // "\2021"
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format((cal.get(Calendar.MONTH) + 1)); // "\03"
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE)); // "\04"
		
		makeDir(uploadPath, yearPath, monthPath, datePath); // 폴더 생성 메서드 호출
		
		logger.info(datePath);
		// ***********************************************************************
		
		return datePath; // "/2021/03/04"
	}
	
	private static void makeDir(String uploadPath, String... paths) { 

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
	
	
}
