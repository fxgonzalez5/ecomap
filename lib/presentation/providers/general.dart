
import 'package:ecomap/domain/domain.dart';
import 'package:flutter/material.dart';

class GeneralProvider with ChangeNotifier{
  Map<String, dynamic> provincias = {};
  final ProvinciaBaseRepository _provinciasRepository;

  GeneralProvider(this._provinciasRepository);

  getAllJsonProvincias() async{
    provincias = await _provinciasRepository.getAll();
  }

  List<Map<String,String>> getProvincias(){
    return provincias.keys
      .toList()
      .map((x)=>{"label": provincias[x]["provincia"] as String, "value": x})
      .toList();
  }

  List<Map<String,String>> getCantones(String? provincia){
    if(provincia == null) return [];
    return (provincias[provincia]["cantones"] as Map<String, dynamic>).keys
      .toList()
      .map((x)=>{"label": provincias[provincia]["cantones"][x]["canton"] as String, "value": x})
      .toList();
  }
  
  List<Map<String,String>> getParroquias(String?provincia, String? canton){
    if(provincia == null || canton == null) return [];
    return (provincias[provincia]["cantones"][canton]["parroquias"] as Map<String, dynamic>).keys
      .toList()
      .map((x)=>{"label": provincias[provincia]["cantones"][canton]["parroquias"][x] as String, "value": x})
      .toList();
  }
}