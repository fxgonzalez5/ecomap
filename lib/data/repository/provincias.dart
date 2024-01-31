
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecomap/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProvinciasRepository extends ProvinciaBaseRepository{
  final api = "https://api-ecomap.onrender.com/api/provincias";
  
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
      String jsonString = await rootBundle.loadString('assets/json/provincias.json');
      data = jsonDecode(jsonString);
    }
    return data!;
  }

}