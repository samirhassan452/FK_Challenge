import 'dart:convert' show json;

class JsonCoder {
  static String modelToJson(Map<String, dynamic> data) => json.encode(data);

  static dynamic modelFromJson(String data) => json.decode(data);
}
