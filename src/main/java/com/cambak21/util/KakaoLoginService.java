package com.cambak21.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class KakaoLoginService {
	
	public static String getUserKakaoID(String authorize_code, String requestUri) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			HttpsURLConnection con = (HttpsURLConnection)url.openConnection();
			
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			
			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=b3f3cf086449d274d79c8ab8a463ea84");
			sb.append("&redirect_uri=http://goot6.cafe24.com/" + requestUri);
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();
			
			// 결과 코드가 200이라면 성공
			int responseCode = con.getResponseCode();
			System.out.println("응답코드 : " + responseCode);
			
			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = "";
            String result = "";
			
            while ((line = br.readLine()) != null) {
            	result += line;
            }
            System.out.println("response body : " + result);
            
            // Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();            
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String userKakaoId = getUserId(access_Token);
		System.out.println(userKakaoId);
		
		return userKakaoId;
	}
	
	
	public static String getUserId(String access_Token) {
	    // 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        String userKakaoId = "";
        
		try {
			URL url = new URL(reqURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			
			// 요청에 필요한 Header에 포함될 내용
			con.setRequestProperty("Authorization", "Bearer " + access_Token);
			
			int responseCode = con.getResponseCode();
			System.out.println("getUserResponseCode : " + responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			String line = "";
            String result = "";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			
			System.out.println("UserInfoResponseBody : " + result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
            userKakaoId = element.getAsJsonObject().get("id").getAsString();
			
			br.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userKakaoId;
	}
	
	
}
