/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dev.daniesteb.skeleton.empresarial.util;

import lombok.Getter;
import lombok.Setter;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import java.io.Serializable;
import java.security.Key;
import java.util.Base64;

@Named(value = "encryptPassword")
@ViewScoped
public class EncryptPassword implements Serializable {

    @Getter
    @Setter
    private String passwordOriginal;

    @Getter
    @Setter
    private String passwordEncriptada;

    private static final String ALGORITHM = "AES";
    private static final String KEY = "1Hbfh667adfDEJ78";


    public String encrypt(String value) throws Exception {
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(EncryptPassword.ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encryptedByteValue = cipher.doFinal(value.getBytes("UTF-8"));
        String encryptedValue64 = Base64.getEncoder()
                                        .encodeToString(encryptedByteValue);
        return encryptedValue64;

    }

    public String decrypt(String value) throws Exception {
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(EncryptPassword.ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] decryptedValue64 = Base64.getDecoder()
                                        .decode(value);
        byte[] decryptedByteValue = cipher.doFinal(decryptedValue64);
        //cipher.doFinal(decryptedValue64);
        String decryptedValue = new String(decryptedByteValue, "UTF-8");
        return decryptedValue;

    }

    private Key generateKey() throws Exception {
        Key key = new SecretKeySpec(EncryptPassword.KEY.getBytes(), EncryptPassword.ALGORITHM);
        return key;
    }

    public String encrypt2() throws Exception {
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(EncryptPassword.ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte[] encryptedByteValue = cipher.doFinal(passwordOriginal.getBytes("utf-8"));
        String encryptedValue64 = Base64.getEncoder()
                                        .encodeToString(encryptedByteValue);
        return encryptedValue64;

    }

    public String decrypt2() throws Exception {
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(EncryptPassword.ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte[] decryptedValue64 = Base64.getDecoder()
                                        .decode(passwordEncriptada);
        byte[] decryptedByteValue = cipher.doFinal(decryptedValue64);
        String decryptedValue = new String(decryptedByteValue, "utf-8");
        return decryptedValue;

    }

}
