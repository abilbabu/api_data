import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomescreenController with ChangeNotifier {
  var Catfact;
  bool isLoading = false;

  Future<void> getFact() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://catfact.ninja/fact");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        print("data fetched");
        print(response.body);

        var convertedjson = jsonDecode(response.body);
        Catfact = convertedjson["fact"];
        log(convertedjson["fact"].toString());
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
