import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> generateResponse(String input) async {
  String token = "Bearer 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";
  String prompt = """
    {
      "prompt" : "$input",
      "temperature" : 0.5,
      "max_tokens" : 50,
      "top_p" : 1,
      "frequency_penalty" : 0,
      "presence_penalty" : 0
    }
  """;

  var response = await http.post(
      Uri.parse("https://api.openai.com/v1/engines/davinci-codex/completions"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": token,
      },
      body: prompt);
  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
    String text = data["choices"][0]["text"].toString().trim();
    return text;
  } else {
    throw Exception("Failed to generate response: ${response.statusCode}");
  }
}
