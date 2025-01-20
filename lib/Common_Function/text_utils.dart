import 'dart:convert';

class TextUtils {
  static final Codec<String, String> stringToBase64 = utf8.fuse(base64);

  static String encodeBase64(String input) => stringToBase64.encode(input);

  static String decodeBase64(String encoded) => stringToBase64.decode(encoded);

  static Map<String, dynamic> perseJSON(String data) =>
      const JsonDecoder().convert(data);
}
