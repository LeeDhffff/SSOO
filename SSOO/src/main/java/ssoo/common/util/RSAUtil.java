package ssoo.common.util;

import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;

public class RSAUtil {
	 
    private KeyPairGenerator generator;
    private KeyFactory keyFactory;
    private KeyPair keyPair;
    private Cipher cipher;
 
    public RSAUtil() {
    	
        try {
            generator = KeyPairGenerator.getInstance("RSA");
            generator.initialize(1024);
            keyFactory = KeyFactory.getInstance("RSA");
            cipher = Cipher.getInstance("RSA");
        } catch (Exception e) {
            e.getMessage();
        }
    }
    
    private final static int KEY_SIZE = 2048;
    private static Cipher mCipher = null;
    
    public static void init() {
      if (mCipher == null) {
        try {
          mCipher = Cipher.getInstance("RSA");
        } catch (NoSuchAlgorithmException | NoSuchPaddingException e) {
          e.printStackTrace();
        }
      }
    }
    /**
     * 새로운 키값을 가진 RSA 생성
     * @return
     */
    public HashMap<String, Object> createRSA() {
    	
    	HashMap<String, Object> returnMap = new HashMap<String,Object>();
        
        try {
            keyPair = generator.generateKeyPair();
 
            PublicKey publicKey = keyPair.getPublic();
            PrivateKey privateKey = keyPair.getPrivate();
 
            RSAPublicKeySpec publicSpec = keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
            String modulus = publicSpec.getModulus().toString(16);
            String exponent = publicSpec.getPublicExponent().toString(16);
            
            returnMap.put("privateKey", privateKey);
            returnMap.put("publicKey", publicKey);
            returnMap.put("modulus", modulus);
            returnMap.put("exponent", exponent);
            
        } catch (Exception e) {
            e.getMessage();
        }
        
        return returnMap;
    }
    
    /**
     * 개인키를 이용한 RSA 복호화
     * @param privateKey (session에 저장된 PrivateKey)
     * @param encryptedText (암호화된 문자열)
     * @return
     * @throws Exception
     */
    public String getDecryptText(PrivateKey privateKey, String encryptedText) throws Exception {
    	init();
    	System.out.println("복호 시작"+encryptedText);
        cipher.init(Cipher.DECRYPT_MODE, privateKey);
        System.out.println("복호"+hexToByteArray(encryptedText));
        byte[] decryptedBytes = cipher.doFinal(hexToByteArray(encryptedText));
        System.out.println("복호 끝");
        return new String(decryptedBytes, "UTF-8");
    }
 
    /**
     * 공개키를 이용한 RSA 암호화
     * @param publicKey (session에 저장된 publicKey)
     * @param plainText (암호화할 문자열)
     * @return
     * @throws Exception
     */
    public String getEncryptText(PublicKey publicKey, String plainText) throws Exception {
        cipher.init(Cipher.ENCRYPT_MODE, publicKey);
        byte[] EncryptedBytes = cipher.doFinal(plainText.getBytes());
        
        return new String(EncryptedBytes, "UTF-8");
    }
    
    /**
     * 16진수 문자열을 byte 배열로 변환
     * @param hex
     * @return
     */
    private byte[] hexToByteArray(String hex) {
    	System.out.println("변환"+hex);
        if (hex == null || hex.length() % 2 != 0) {
            return new byte[] {};
        }
        System.out.println("변환2");
        byte[] bytes = new byte[hex.length() / 2];
        for (int i = 0; i < hex.length(); i += 2) {
            byte value = (byte) Integer.parseInt(hex.substring(i, i + 2), 16);
            bytes[(int) Math.floor(i / 2)] = value;
        }
        System.out.println("변환3" + bytes);
        return bytes;
        
    }
    
    /**
     * sha256 암호화
     * @param msg
     * @return sha256 암호화 메세지 반환
     * @throws Exception
     */
    public String sha256(String msg) throws Exception {
	    MessageDigest md = MessageDigest.getInstance("SHA-256");
	    md.update(msg.getBytes());
	    StringBuilder builder = new StringBuilder();
	    for (byte b: md.digest()) {
	    	builder.append(String.format("%02x", b));
		}
	    
	    return builder.toString();
	}
    
}
