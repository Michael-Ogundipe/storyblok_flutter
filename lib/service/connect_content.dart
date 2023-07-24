import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'package:storyblok_flutter/model/content.dart';

class ConnectContent {
  Future<Storyblok> content() async {
    try {
      const cv = 1689914137;
      const token = 'qLkKDJHZAeWnrjQmNUrI7gtt';
      const version = 'published';

      const String apiUrl =
          "https://api.storyblok.com/v2/cdn/stories/header-text?cv=$cv&token=$token&version=$version";

      Map<String, String> headers = {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      final response = await http.get(Uri.parse(apiUrl), headers: headers);
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        return Storyblok.fromJson(result);
      } else {
        throw Exception('Failed to load data');
      }
    } on SocketException {
      throw Exception("An error occurred: No network connection");
    }
  }
}
