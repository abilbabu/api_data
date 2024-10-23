import 'dart:convert';
// import 'dart:developer';

import 'package:api_data/model/home_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomescreenController with ChangeNotifier {
  // var Catfact;
  HomeModel? respObj;
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
        // Catfact = convertedjson["fact"];
        // log(convertedjson["fact"].toString());

         respObj=HomeModel(
          fact: convertedjson["fact"],
          length: convertedjson["length"]
        );

        
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
