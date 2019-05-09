package poly.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

public class kakao_restapi {
	Gson gson = new Gson();
	/*
	 * public enum HttpMethodType { POST, GET, DELETE }
	 * 
	 * private static final String API_SERVER_HOST = "https://kapi.kakao.com";
	 * 
	 * private static final String USER_SIGNUP_PATH = "/v1/user/signup"; private
	 * static final String USER_UNLINK_PATH = "/v1/user/unlink"; private static
	 * final String USER_LOGOUT_PATH = "/v1/user/logout"; private static final
	 * String USER_ME_PATH = "/v2/user/me"; private static final String
	 * USER_UPDATE_PROFILE_PATH = "/v1/user/update_profile"; private static final
	 * String USER_IDS_PATH = "/v1/user/ids";
	 * 
	 * private static final String STORY_PROFILE_PATH = "/v1/api/story/profile";
	 * private static final String STORY_ISSTORYUSER_PATH =
	 * "/v1/api/story/isstoryuser"; private static final String STORY_MYSTORIES_PATH
	 * = "/v1/api/story/mystories"; private static final String STORY_MYSTORY_PATH =
	 * "/v1/api/story/mystory"; private static final String
	 * STORY_DELETE_MYSTORY_PATH = "/v1/api/story/delete/mystory"; private static
	 * final String STORY_POST_NOTE_PATH = "/v1/api/story/post/note"; private static
	 * final String STORY_UPLOAD_MULTI_PATH = "/v1/api/story/upload/multi"; private
	 * static final String STORY_POST_PHOTO_PATH = "/v1/api/story/post/photo";
	 * private static final String STORY_LINKINFO_PATH = "/v1/api/story/linkinfo";
	 * private static final String STORY_POST_LINK_PATH = "/v1/api/story/post/link";
	 * 
	 * private static final String TALK_PROFILE_PATH = "/v1/api/talk/profile";
	 * 
	 * private static final String PUSH_REGISTER_PATH = "/v1/push/register"; private
	 * static final String PUSH_TOKENS_PATH = "/v1/push/tokens"; private static
	 * final String PUSH_DEREGISTER_PATH = "/v1/push/deregister"; private static
	 * final String PUSH_SEND_PATH = "/v1/push/send";
	 * 
	 * private static final ObjectMapper JACKSON_OBJECT_MAPPER = new ObjectMapper();
	 * // private static final Gson GSON = new Gson(); private static final String
	 * PROPERTIES_PARAM_NAME = "properties";
	 * 
	 * private static final List<String> adminApiPaths = new ArrayList<String>();
	 * 
	 * static { adminApiPaths.add(USER_IDS_PATH);
	 * adminApiPaths.add(PUSH_REGISTER_PATH); adminApiPaths.add(PUSH_TOKENS_PATH);
	 * adminApiPaths.add(PUSH_DEREGISTER_PATH); adminApiPaths.add(PUSH_SEND_PATH); }
	 * 
	 * private String accessToken; private String adminKey;
	 * 
	 * public void setAccessToken(final String accessToken) { this.accessToken =
	 * accessToken; }
	 * 
	 * public void setAdminKey(final String adminKey) { this.adminKey = adminKey; }
	 * 
	 * /////////////////////////////////////////////////////////////// // User
	 * Management ///////////////////////////////////////////////////////////////
	 * 
	 * public String signup() { return request(HttpMethodType.POST,
	 * USER_SIGNUP_PATH); }
	 * 
	 * public String signup(final Map<String, String> params) { return
	 * request(HttpMethodType.POST, USER_SIGNUP_PATH, PROPERTIES_PARAM_NAME + "=" +
	 * gson.toJson(params)); }
	 * 
	 * public String unlink() { return request(HttpMethodType.POST,
	 * USER_UNLINK_PATH); }
	 * 
	 * public String logout() { return request(HttpMethodType.POST,
	 * USER_LOGOUT_PATH); }
	 * 
	 * public String me() { return request(USER_ME_PATH); }
	 * 
	 * public String updatProfile(final Map<String, String> params) { return
	 * request(HttpMethodType.POST, USER_UPDATE_PROFILE_PATH, PROPERTIES_PARAM_NAME
	 * + "=" + gson.toJson(params)); }
	 * 
	 * public String getUserIds() { return request(USER_IDS_PATH); }
	 * 
	 * public String getUserIds(final Map<String, String> params) { return
	 * request(HttpMethodType.GET, USER_IDS_PATH, gson.toJson(params)); }
	 * 
	 * 
	 * 
	 * public String storyProfile() { return request(STORY_PROFILE_PATH); }
	 * 
	 * public String profile(String id) { return req(HttpMethodType.POST,
	 * USER_ME_PATH,id); }
	 * 
	 * public String req(final HttpMethodType httpmethod, final String
	 * apiPath,String id) { return request(httpmethod, apiPath, id); }
	 * 
	 * public String request(final String apiPath) { return
	 * request(HttpMethodType.GET, apiPath, null); }
	 * 
	 * public String request(final HttpMethodType httpMethod, final String apiPath)
	 * { return request(httpMethod, apiPath, null); }
	 * 
	 * public String request(HttpMethodType httpMethod, final String apiPath, final
	 * String params) {
	 * 
	 * String requestUrl = API_SERVER_HOST + apiPath; if (httpMethod == null) {
	 * httpMethod = HttpMethodType.GET; } if (params != null && params.length() > 0
	 * && (httpMethod == HttpMethodType.GET || httpMethod == HttpMethodType.DELETE))
	 * { requestUrl += params; }
	 * 
	 * HttpsURLConnection conn; OutputStreamWriter writer = null; BufferedReader
	 * reader = null; InputStreamReader isr = null;
	 * 
	 * try { final URL url = new URL(requestUrl); conn = (HttpsURLConnection)
	 * url.openConnection(); conn.setRequestMethod(httpMethod.toString());
	 * 
	 * if (adminApiPaths.contains(apiPath)) {
	 * conn.setRequestProperty("Authorization", "KakaoAK " + this.adminKey); } else
	 * { conn.setRequestProperty("Authorization", "Bearer " + this.accessToken); }
	 * 
	 * conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	 * conn.setRequestProperty("charset", "utf-8");
	 * 
	 * if (params != null && params.length() > 0 && httpMethod ==
	 * HttpMethodType.POST) { conn.setDoOutput(true); writer = new
	 * OutputStreamWriter(conn.getOutputStream()); writer.write(params);
	 * writer.flush(); }
	 * 
	 * final int responseCode = conn.getResponseCode();
	 * System.out.println(String.format("\nSending '%s' request to URL : %s",
	 * httpMethod, requestUrl)); System.out.println("Response Code : " +
	 * responseCode); if (responseCode == 200) isr = new
	 * InputStreamReader(conn.getInputStream()); else isr = new
	 * InputStreamReader(conn.getErrorStream());
	 * 
	 * reader = new BufferedReader(isr); final StringBuffer buffer = new
	 * StringBuffer(); String line; while ((line = reader.readLine()) != null) {
	 * buffer.append(line); } System.out.println(buffer.toString()); return
	 * buffer.toString();
	 * 
	 * } catch (IOException e) { e.printStackTrace(); } finally { if (writer !=
	 * null) try { writer.close(); } catch (Exception ignore) { } if (reader !=
	 * null) try { reader.close(); } catch (Exception ignore) { } if (isr != null)
	 * try { isr.close(); } catch (Exception ignore) { } }
	 * 
	 * return null; }
	 * 
	 * public String urlEncodeUTF8(String s) { try { return URLEncoder.encode(s,
	 * "UTF-8"); } catch (UnsupportedEncodingException e) { throw new
	 * UnsupportedOperationException(e); } }
	 */

	public static JsonNode getKakaoUserInfo(String accessToken) {

		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);

		// add header
		post.addHeader("Authorization", "Bearer " + accessToken);

		JsonNode returnNode = null;

		try {
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();

			System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
			System.out.println("Response Code : " + responseCode);

			// JSON 형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}

		return returnNode;
	}
}
