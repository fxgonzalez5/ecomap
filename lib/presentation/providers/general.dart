
import 'package:ecomap/domain/domain.dart';
import 'package:flutter/material.dart';

class GeneralProvider with ChangeNotifier{
  Map<String, dynamic> provincias = {};
  Map<String, dynamic> _bancos = {};
  List<dynamic> get bancos => _bancos['instituciones'] as List<dynamic>;
  final ProvinciaBaseRepository _provinciasRepository;
  final BancosBaseRepository _bancoRepository;

  GeneralProvider(this._provinciasRepository, this._bancoRepository);

  getAllJsonProvincias() async{
    provincias = await _provinciasRepository.getAll();
  }

  getAllJsonInstitucionesBancarias() async{
    _bancos = await _bancoRepository.getAll();
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