import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Uint8List> generateImg(String title) async {
  var headers = {
    'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYTU0ZTY0NjUtMzUxYy00MzQ3LWIxNGYtZTVhZGIwZTc4Y2Q3IiwidHlwZSI6ImFwaV90b2tlbiJ9.2B6Rhrfjn9KkOGXt1cI92f2DWsOGYA0l-pl0-Aze_SQ',
    'Content-Type': 'application/json',
  };

  var url = Uri.parse('https://api.edenai.run/v2/image/generation');
  var payload = {
    'providers': 'openai',
    'text': title,
    'resolution': '512x512',
    'fallback_providers': '',
  };
  try {
    // get image from cache
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(title)) {
      return base64.decode(prefs.getString(title)!);
    } else {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(payload),
      );
      var result = json.decode(response.body);
      print(result['openai']['items'][0]);
      final bytes = base64.decode((result['openai']['items'][0])['image']);
      prefs.setString(title, base64.encode(bytes));
      return bytes;
    }
  } catch (e) {
    throw Error();
  }
}
