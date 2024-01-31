import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecomap/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BancosRepository extends BancosBaseRepository{
  final api = "https://api-ecomap.onrender.com/api/bancos";

  @override
  Future<Map<String, dynamic>> getAll() async {
    Map<String, dynamic>? data;
    try {
      final response = await Dio().get(api);
      data = response.data;
    } catch (e) {
      debugPrint(e.toString());
    }
    if(data == null){
      String jsonString = await rootBundle.loadString('assets/json/bancos.json');
      data = jsonDecode(jsonString);
    }
    return data!;   
  }

}