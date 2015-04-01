package com.yinyuetai.utils;


import javax.crypto.Cipher;
import javax.crypto.SecretKey;
/**
 * 一个对称加密的例子，使用DES算法实现
 * User: tinyspace(tinyspace@gmail.com)
 * Date: 14-4-3
 * Time: 上午11:27
 */
public class EncodeUtils {

	private static byte[] Security_Private_Key ={77,121,83,101,99,89,89,84};
	/**
	 * Used building output as Hex
	 */
	private static final char[] DIGITS = {
			'0', '1', '2', '3', '4', '5', '6', '7',
			'8', '9', 'a', 'b', 'c', 'd', 'e', 'f'
	};
	/**
	 * Converts an array of characters representing hexidecimal values into an
	 * array of bytes of those same values. The returned array will be half the
	 * length of the passed array, as it takes two characters to represent any
	 * given byte. An exception is thrown if the passed char array has an odd
	 * number of elements.
	 *
	 * @param data An array of characters containing hexidecimal digits
	 * @return A byte array containing binary data decoded from
	 *         the supplied char array.

	 *         is supplied
	 */
	private static byte[] decodeHex(char[] data)  {

		int len = data.length;

		if ((len & 0x01) != 0) {
			return null;
		}

		byte[] out = new byte[len >> 1];

		// two characters form the hex value.
		for (int i = 0, j = 0; j < len; i++) {
			int f = toDigit(data[j], j) << 4;
			j++;
			f = f | toDigit(data[j], j);
			j++;
			out[i] = (byte) (f & 0xFF);
		}

		return out;
	}
	/**
	 * Converts a hexadecimal character to an integer.
	 *
	 * @param ch A character to convert to an integer digit
	 * @param index The index of the character in the source
	 * @return An integer
	 */
	protected static int toDigit(char ch, int index)  {
		int digit = Character.digit(ch, 16);
		if (digit == -1) {
			return -1;
		}
		return digit;
	}
	/**
	 * Converts an array of bytes into an array of characters representing the hexidecimal values of each byte in order.
	 * The returned array will be double the length of the passed array, as it takes two characters to represent any
	 * given byte.
	 *
	 * @param data
	 *                  a byte[] to convert to Hex characters
	 * @return A char[] containing hexidecimal characters
	 */
	private static char[] encodeHex(byte[] data) {

		int l = data.length;

		char[] out = new char[l << 1];

		// two characters form the hex value.
		for (int i = 0, j = 0; i < l; i++) {
			out[j++] = DIGITS[(0xF0 & data[i]) >>> 4 ];
			out[j++] = DIGITS[ 0x0F & data[i] ];
		}

		return out;
	}
	/**
	 * 将指定的数据根据提供的密钥进行加密
	 *
	 * @paraminput需要加密的数据
	 * @paramkey密钥
	 * @returnbyte[]加密后的数据
	 * @throwsException
	 */
	private static byte[] encryptData(byte[] input, byte[] key) throws Exception {
		SecretKey deskey = new javax.crypto.spec.SecretKeySpec(key, "DES");
		Cipher c1 = Cipher.getInstance("DES");
		c1.init(Cipher.ENCRYPT_MODE, deskey);
		byte[] cipherByte = c1.doFinal(input);
		return cipherByte;
	}

	/**
	 * 将给定的已加密的数据通过指定的密钥进行解密
	 *
	 * @paraminput待解密的数据
	 * @paramkey密钥
	 * @returnbyte[]解密后的数据
	 * @throwsException
	 */
	private static byte[] decryptData(byte[] input, byte[] key) throws Exception {
		SecretKey deskey = new javax.crypto.spec.SecretKeySpec(key, "DES");
		Cipher c1 = Cipher.getInstance("DES");
		c1.init(Cipher.DECRYPT_MODE, deskey);
		byte[] clearByte = c1.doFinal(input);
		return clearByte;
	}

	/**
	 * 将指定的数进行加密
	 *
	 * @str需要加密的数据
	 */
	public static String encoder(String str) {
		if (str == null || str.length() == 0) {
			return "";
		}
		try {
			return new String(encodeHex(encryptData(str.getBytes("UTF-8"), Security_Private_Key)));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	/**
	 * 将指定的数进行解密
	 *
	 * @str需要加密的数据
	 */
	public static String decoder(String str) {
		if (str == null || str.length() == 0) {
			return "";
		}
		try {
			return new String(decryptData(decodeHex(str.toCharArray()), Security_Private_Key),"UTF-8");
		} catch (Exception e) {
		}
		return "";
	}
	public static void main(String[] args){

		System.out.println( encoder("a=1&b=2&c=3"));
		System.out.println( decoder(encoder("a=1&b=2&c=3")));

		System.out.println( encoder("是否支持中文加密"));
		System.out.println( decoder(encoder("是否支持中文加密")));
	}
}
