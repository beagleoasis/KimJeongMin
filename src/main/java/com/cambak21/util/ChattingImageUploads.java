package com.cambak21.util;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class ChattingImageUploads {
	private static final Logger logger = LoggerFactory.getLogger(ChattingImageUploads.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileDate) throws IOException {
		UUID uuid = UUID.randomUUID();
		
		
		String ext = originalName.substring(originalName.lastIndexOf(".") + 1); // 확장자
		
		String uploadFileName = uuid.toString() + "." + ext;
		
		// 이미지 파일이면 실제 저장하고 해당 경로 반환
		if(MediaConfirm.getMediaType(ext) != null) {
			File target = new File(uploadPath, uploadFileName);
			FileCopyUtils.copy(fileDate, target); // 실제 저장
		} else {
			// 이미지 파일이 아니면 ...
			uploadFileName = "-1"; // 이미지 파일이 아니므로 -1 반환
		}
		
		return uploadFileName;
	}
}
