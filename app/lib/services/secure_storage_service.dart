
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  Future<void> delete({String key}) {
    return FlutterSecureStorage().delete(key: key);
  }

  Future<String> read({String key}) async {
    try
    {
      return await FlutterSecureStorage().read(key: key);
    }
    catch (e)
    {
      //HACK: PlatformException(error, Unsupported value: javax.crypto.BadPaddingException: error:1e000065:Cipher functions:OPENSSL_internal:BAD_DECRYPT
      return null;
    }
  }

  Future<void> write({String key, String value}) {
    return FlutterSecureStorage().write(key: key, value: value);
  }
}
