package com.cambak21.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Base64.Decoder;

import org.apache.commons.io.output.ByteArrayOutputStream;

public class ImgBase64Encoding {
	public static void main(String[] args) throws UnsupportedEncodingException { 
	String target = "C:\\lecture\\python\\img\\autumn1.jpg"; byte[] targetBytes = target.getBytes("UTF-8");
	// Base64 인코딩 /////////////////////////////////////////////////// 
	Encoder encoder = Base64.getEncoder(); // Encoder#encode(byte[] src) :: 바이트배열로 반환
	byte[] encodedBytes = encoder.encode(targetBytes); System.out.println(new String(encodedBytes)); 
	// Encoder#encodeToString(byte[] src) :: 문자열로 반환 
	String encodedString = encoder.encodeToString(targetBytes); System.out.println(encodedString); 
	// Base64 디코딩 /////////////////////////////////////////////////// 
	Decoder decoder = Base64.getDecoder();
	// Decoder#decode(bytes[] src) 
	byte[] decodedBytes1 = decoder.decode(encodedBytes); 
	// Decoder#decode(String src) 
	byte[] decodedBytes2 = decoder.decode(encodedString);
	// 디코딩한 문자열을 표시 
	String decodedString = new String(decodedBytes1, "UTF-8");
	System.out.println(decodedString); System.out.println(new String(decodedBytes2, "UTF-8")); 
	}


//	public static void main(String[] args) throws Exception{
//		System.out.println("테스트");
//		// TODO Auto-generated method stub
//		byte[] imageByte = extractBytes("E:\\html");
//		byte[] baseIncodingbytes = encodingBase64(imageByte);
//		System.out.println("원본 데이터 : C:/lecture/python/img/autumn1.jpg");
//		System.out.println("인코딩 : "+baseIncodingbytes);
//		byte[] binary = Base64.getDecoder().decode(baseIncodingbytes);
//		System.out.println("디코딩 : "+binary);
//	}
//	@SuppressWarnings("resource")
//	private static byte[] extractBytes(String imageName) throws IOException{
//		File imgPath = new File(imageName);
//		FileInputStream fis = null;
//		ByteArrayOutputStream baos = new ByteArrayOutputStream();
//		
//		fis = new FileInputStream(imgPath);
//		
//		int len = 0;
//		
//		byte[] buf = new byte[1024];
//		while((len=fis.read(buf)) != -1) {
//			baos.write(buf,0,len);
//		}
//		byte[] fileArray = baos.toByteArray();
//		
//		return fileArray;
//		
//		
//	}
//
//	private static byte[] encodingBase64(byte[] targetBytes) {
//		Encoder encoder = Base64.getEncoder();
//		return encoder.encode(targetBytes);
//	}
//	public static void main(String[] args) { 
//		System.out.println("테스트");
//		base64(); 
//		
//	} 
//	public static void base64() { String text = "C:\\lecture\\python\\img\\autumn1.jpg"; byte[] targetBytes = text.getBytes(); 
//	// Base64 인코딩 /////////////////////////////////////////////////// 
//	Encoder encoder = Base64.getEncoder(); byte[] encodedBytes = encoder.encode(targetBytes);
//	// Base64 디코딩 ///////////////////////////////////////////////////
//	Decoder decoder = Base64.getDecoder(); byte[] decodedBytes = decoder.decode(encodedBytes); 
//	System.out.println("인코딩 전 : " + text); 
//	System.out.println("인코딩 text : " + new String(encodedBytes));
//	System.out.println("디코딩 text : " + new String(decodedBytes)); }

}

