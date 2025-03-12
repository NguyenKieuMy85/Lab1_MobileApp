import 'dart:convert';
import 'package:http/http.dart' as http;

class SentimentService {
  static const String _apiUrl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent';
  static const String _apiKey =
      'AIzaSyBblUURrDN452gBEmdc-9o5ez6H81Rdb6I'; // Replace with actual API key

  static Future<String> analyzeSentiment(String text) async {
    final response = await http.post(
      Uri.parse("$_apiUrl?key=$_apiKey"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {
                "text":
                    "Analyze the sentiment of this sentence: \"$text\". Return only 'positive', 'negative', or 'neutral'.",
              },
            ],
          },
        ],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data.containsKey('candidates') && data['candidates'].isNotEmpty) {
        final sentiment = data['candidates'][0]['content'];
        return "Sentiment: $sentiment";
      } else {
        return "Error: Invalid API response format.";
      }
    } else {
      return "Error: API request failed (${response.statusCode}).";
    }
  }
}
