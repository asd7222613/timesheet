package com.max.common;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;

public class MD5Util {
	
	private static final String salt = "timesheet";

	/**
	 * 返回加密后的密码
	 * @param password 用户密码
	 * @return
	 */
	public static String shaToHex(String password) {
		byte[] data = Base64.encodeBase64(salt.getBytes());
		String newPassword = DigestUtils.sha256Hex(password + new String(data));
		return newPassword;
	}
	
	public static void main(String[] args) {
		String password1 = "123456";
		String password2 = "123456";
		
		System.out.println(MD5Util.shaToHex(password1));
		System.out.println(MD5Util.shaToHex(password2));
	}
}
