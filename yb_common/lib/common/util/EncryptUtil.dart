import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

/// @author yangbang
/// @create 2019/12/18
/// @Describe 解密工具

class EncryptUtil {

  //公钥
  static const _publicKeyString = "";
  
  //密钥
  static const _privateKeyString = "";


  static Future<String> rsaEncode (String base64PlainText, {String publicKey=_publicKeyString}) async{
    var parser = RSAKeyParser();
    String rsaPublic = "-----BEGIN PUBLIC KEY-----\n$publicKey\n-----END PUBLIC KEY-----";
    RSAPublicKey rsaPublicKey = parser.parse(rsaPublic);
    // String rsaTxt =  await crypto.DYFCryptoProvider.rsaEncrypt(plainText, key);
    return Encrypter(RSA(publicKey: rsaPublicKey)).encrypt(base64PlainText).base64;
  }


  //base64PlainText base64处理的密文
  /*static Future<String> rsaDecode (String base64PlainText, {String privateKey=_privateKeyString}) async{
    var parser = RSAKeyParser();
    String rsaPublic = "-----BEGIN PRIVATE KEY-----\n$privateKey\n-----END PRIVATE KEY-----";
    RSAPrivateKey rsaPrivateKey = parser.parse(rsaPublic);
    // String rsaTxt =  await crypto.DYFCryptoProvider.rsaEncrypt(plainText, key);
    return Encrypter(RSA(privateKey: rsaPrivateKey)).decrypt64(base64PlainText);
  }*/


  static String urlEncode(String component){
    return Uri.encodeComponent(component);
  }

  static String urlDecode(String component){
    return Uri.decodeComponent(component);
  }



}
