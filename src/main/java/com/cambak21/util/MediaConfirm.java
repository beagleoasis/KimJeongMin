package com.cambak21.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaConfirm {
	private static Map<String, MediaType> mediaMap;
	
	static {
		// 스테틱 멤버 변수 초기화 블럭
		mediaMap = new HashMap<String, MediaType>();
		mediaMap.put("jpg", MediaType.IMAGE_JPEG);
		mediaMap.put("jpeg", MediaType.IMAGE_JPEG);
		mediaMap.put("gif", MediaType.IMAGE_GIF);
		mediaMap.put("png", MediaType.IMAGE_PNG);
	}
	
	public static MediaType getMediaType(String ext) {
		return mediaMap.get(ext.toLowerCase());
	}
}
