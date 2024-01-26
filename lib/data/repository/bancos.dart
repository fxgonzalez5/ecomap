import 'dart:convert';

import 'package:ecomap/domain/domain.dart';
import 'package:flutter/services.dart';

class BancosRepository extends BancosBaseRepository{
  @override
  Future<Map<String, dynamic>> getAll() async {
    String jsonString = await rootBundle.loadString('assets/json/bancos.json');
    return jsonDecode(jsonString);
  }

}