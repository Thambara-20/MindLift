import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Uint8List> generateImg(String title) async {
  var headers = {
    'accept': 'application/json',
    'content-type': 'application/json',
    'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYTU0ZTY0NjUtMzUxYy00MzQ3LWIxNGYtZTVhZGIwZTc4Y2Q3IiwidHlwZSI6ImFwaV90b2tlbiJ9.2B6Rhrfjn9KkOGXt1cI92f2DWsOGYA0l-pl0-Aze_SQ',
  };

  var url = Uri.parse('https://api.edenai.run/v2/image/generation');
  var payload = {
    'response_as_dict': true,
    'attributes_as_list': false,
    'show_original_response': false,
    'num_images': 2,
    'providers': 'deepai,stabilityai,openai,replicate,amazon',
    'text': 'Calm environment',
    'resolution': '512x512',
  };

  try {
    // Get image from cache
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(title)) {
      print('Image from cache');
      return base64.decode(prefs.getString(title)!);
    } else {
      var response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(payload),
      );
      var result = json.decode(response.body);
      print('Image generated ${result}');
      
      // Assuming we use the first image from the result
      final bytes = base64.decode((result['replicate']['items'][0])['image']);
      print('Image generated ${bytes}');
      
      // Save the image to cache
      prefs.setString(title, base64.encode(bytes));
      return bytes;
    }
  } catch (e) {
    print('Error: $e');
    throw Error();
  }
}
