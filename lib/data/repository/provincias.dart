
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecomap/domain/domain.dart';
import 'package:flutter/services.dart';

class ProvinciasRepository extends ProvinciaBaseRepository{
  final API = "https://api-ecomap.onrender.com/api/provincias";
  
  @override
  Future<Map<String, dynamic>> getAll() async {
    Map<String, dynamic>? data;
    try {
      final response = await Dio().get(API);
      data = response.data;
    } catch (e) {
      print(e.toString());
    }
    if(data == null){
      String jsonString = await rootBundle.loadString('assets/json/provincias.json');
      data = jsonDecode(jsonString);
    }
    return data!;
  }

}