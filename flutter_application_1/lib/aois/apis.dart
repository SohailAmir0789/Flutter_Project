import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';
import 'dart:developer'; // For logging

import 'package:flutter_application_1/helper/global.dart';

class APIs {
  static final model =
      GenerativeModel(model: "gemini-2.0-flash", apiKey: apikey);

  static Future<String> getAnswer(String question) async {
    final content = [Content.text(question)];
    final response = await model.generateContent(content);
    try {
      final content = [Content.text(question)];
      final response = await model.generateContent(content);

      if (response.text != null) {
        return (response.text!); // Print Gemini AI's response
      } else {
        return ("Error: No response from Gemini AI");
      }
    } catch (e) {
      log("API Error: $e");
    }

    return response.text!;
  }
}
