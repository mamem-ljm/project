package poly.util;

import java.security.MessageDigest;


public class StringUtil {
	// sha256을 적용한 string을 return 한다.
	public static String applySha256(String input) {
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-256");
			// Applies sha256 to our input,
			byte[] hash = digest.digest(input.getBytes("UTF-8"));
			StringBuffer hexString = new StringBuffer(); // This will contain hash as hexidecimal

			for (int i = 0; i < hash.length; i++) {
				String hex = Integer.toHexString(0xff & hash[i]);

				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			
			hash = null;

			return hexString.toString();

		} catch (Exception e) {

			throw new RuntimeException(e);

		}
	}
	
}
