
import 'dart:convert';

import 'package:ecomap/domain/domain.dart';
import 'package:flutter/services.dart';

class ProvinciasRepository extends ProvinciaBaseRepository{
  @override
  Future<Map<String, dynamic>> getAll() async {
    String jsonString = await rootBundle.loadString('assets/json/provincias.json');
    return jsonDecode(jsonString);
  }

}