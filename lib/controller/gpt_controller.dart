import 'dart:convert';
import 'package:chat_gpt/model/message_model.dart';
import 'package:http/http.dart' as http;

Future<String> generateResponse(String input) async {
  String token = "Bearer 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";

  var response = await http.post(
      Uri.parse(
          "https://api.openai.com/v1/engines/text-davinci-003/completions"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
      body: jsonEncode({
        "prompt": input,
        "temperature": 0.5,
        "max_tokens": 50,
        "top_p": 1,
        "frequency_penalty": 0,
        "presence_penalty": 0
      }));
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
    String text = data["choices"][0]["text"].toString().trim();
    return text;
  } else {
    throw Exception("Failed to generate response: ${response.statusCode}");
  }
}
