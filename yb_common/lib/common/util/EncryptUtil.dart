import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

/// @author yangbang
/// @create 2019/12/18
/// @Describe 解密工具

class EncryptUtil {

  //公钥
  static const _publicKeyString = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC279pKKc7AxEH4DWNq92DeaTFGz7M2gg6dcqbhAIsn2eah1MLWz3j4uAshU0P4QDV/JjUSBL5y/qHv/DQdE8ibFSrnq7Y1jl4VThAzaF2NHxhnjDZkpnmIyijkv/v5PA+c6eSinDQ3zDdUaKwW5cR1ipBu1x/TwPgVxeUZ4CMvWwIDAQAB";
  //
  static const TextKey =          "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCGc3yJGslSFVk0u6jwO-749vC1Q_Ru2hROjvHPDAMHVHp3yj_93PkvelNqFeV0qDL0b5PUaTiy3T4ufEh8NRFhcA_Tp_ySRCOhiRZu2Ky34kruKIZ6SiNV0INc4LvpRSp0yIUuV5ioy0he2JcAroUfoNeyBHe4wnhWWLjZjo47vQIDAQAB";
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
