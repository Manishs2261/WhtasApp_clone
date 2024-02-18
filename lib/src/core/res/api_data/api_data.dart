import 'dart:convert';
import 'dart:developer';

import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../../utils/api_key/api_key.dart';


class Apis {
  static Future<String> getAnswer(String question) async {
    try {
      final res = await post(Uri.parse('https://api.edenai.run/v2/text/generation'),
          headers: {
            HttpHeaders.contentTypeHeader: ' application/json',
            HttpHeaders.authorizationHeader: 'Bearer $apiKey'
          },
          body: jsonEncode({
            "providers": "openai",
            "text": question,
            "max_tokens": 50,
            "temperature": 0,
            "fallback_providers": ""
          }));

      final data = await jsonDecode(res.body);

      log('res: ${res.body} + ${res.statusCode}');
      print(data['openai']['generated_text']);
      print(data['generated_text']);

      return data['openai']['generated_text'];
    } catch (e) {
      log("Error: $e");
      return "some this worng";
    }
  }

  static Future generateImage() async {
    var url = Uri.parse('https://api.edenai.run/v2/image/generation');
    var headers = {
      'authorization': 'Bearer $apiKey',
      'Content-Type': 'application/json',
    };
    var body = json.encode({
      'providers': 'openai',
      'text': 'a red flying balloon.',
      'resolution': '512x512',
      'fallback_providers': '',
      "num_images": 1
    });

    try {
      var response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print(json.decode(response.body));
        final data = await jsonDecode(response.body);
        print(data['openai']['items'].runtimeType);
        return data['openai']['items'];

      } else {
        print('Request failed with status: ${response.statusCode}');
        return "not image";
      }
    } catch (error) {
      print('Request failed with error: $error');
      return "not image";
    }
  }
}
