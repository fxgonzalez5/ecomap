
import 'package:ecomap/domain/domain.dart';
import 'package:flutter/material.dart';

class SocioBosqueProvider with ChangeNotifier{
  final SocioBosqueBaseRepository _repository;
  List<SocioBosque> _listForms = List.empty();
  List<SocioBosque> _listFormFilter = List.empty();
  List<SocioBosque> get listForm => _listFormFilter;
  SocioBosque? _current;
  SocioBosque? get current => _current;
  
  SocioBosqueProvider(this._repository);

  //Form
  final fechaRegistroController = TextEditingController();
  String? fechaRegistro;
  final tipoSocioController = TextEditingController();
  String? _tipoCapitulo;
  String? get tipoCapitulo => _tipoCapitulo;
  set tipoCapitulo(String? value){
    _tipoCapitulo = value;
    notifyListeners();
  }
  final rucDatosGeneralesController = TextEditingController();
  final representanteDatosGeneralesControler = TextEditingController();
  final registroDatosGeneralesController = TextEditingController();
  final fechaPersonaJuidicaDatosGeneralesController = TextEditingController();
  String? fechaPersonaJuidicaDatosGenerales;
  final etniaDatosGeneralesController = TextEditingController();
  bool? _vivenEnElPredioDatosGenerales;
  bool? get vivenEnElPredioDatosGenerales => _vivenEnElPredioDatosGenerales;
  set vivenEnElPredioDatosGenerales(bool? value){
    _vivenEnElPredioDatosGenerales = value;
    notifyListeners();
  }
  final direccionNotificacionController = TextEditingController();
  final provinciaNotificacionController = TextEditingController();
  String? _provincia = null;
  String? get provincia => _provincia;
  set provincia(String? value){
    _provincia = value;
    notifyListeners();
  }
  final cantonNotificacionController = TextEditingController();
  String? _canton = null;
  String? get canton => _canton;
  set canton(String? value){
    _canton = value;
    notifyListeners();
  }
  final parroquiaNotificacionController = TextEditingController();
  String? _parroquia = null;
  String? get parroquia => _parroquia;
  set parroquia(String? value){
    _parroquia = parroquia;
    notifyListeners();
  }
  final comunidadNotificacionController = TextEditingController();
  final convencionalNotificacionController = TextEditingController();
  final celularNotificacionController = TextEditingController();
  final emailNotificacionController = TextEditingController();
  final nombreContactoController = TextEditingController();
  final cargoContactoController = TextEditingController();
  final telefonoContactoController = TextEditingController();
  String? _tipoCuenta;
  String? get tipoCuenta => _tipoCuenta;
  set tipoCuenta(String? value){
    _tipoCuenta = value;
    notifyListeners();
  }
  final institucionCuentaController = TextEditingController();
  String? institucionCuenta;
  final numeroCuentaController = TextEditingController();
  final beneficiariosSEController = TextEditingController();
  final familiasSEController = TextEditingController();
  final menoresSEController = TextEditingController();
  final hombresSEController = TextEditingController();
  final mujeresSEController = TextEditingController();
  bool? _discapacitadosSE;
  bool? get discapacitadosSE => _discapacitadosSE;
  set discapacitadosSE(bool? value){
    _discapacitadosSE = value;
    notifyListeners();
  }
  final cantidadDiscapacitadosSEController = TextEditingController();
  final nombreActividad = TextEditingController();
  final descripcionActividad = TextEditingController();
  List<SocioActividad> _actividadesSE = [];
  List<SocioActividad> get actividadesSE => _actividadesSE;
  final promedioIngresoSE = TextEditingController();
  final latitudUbicacion = TextEditingController();
  final longitudUbicacion = TextEditingController();
  final superficieUbicacion = TextEditingController();
  final superficieConservarUbicacion = TextEditingController();
  final descripcionUbicacion = TextEditingController();
  final norteLindero = TextEditingController();
  final surLindero = TextEditingController();
  final esteLindero = TextEditingController();
  final oesteLindero = TextEditingController();
  final numeroRP = TextEditingController();
  final fechaRPController = TextEditingController();
  String? fechaRP;
  String? _formaAP;
  String? get formaAP => _formaAP;
  set formaAP(String? value){
    _formaAP = value;
    notifyListeners();
  }
  final fechaAPController = TextEditingController();
  String? fechaAP;
  final institucionAPController = TextEditingController();
  final observacionesAPContoller = TextEditingController();

  Future<void> getAll() async{
    try {
      _listForms = await _repository.getAll();
      _listFormFilter = _listForms;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  submitForm(BuildContext context){
    if(_current == null){
      crear(context);
    }else{
      update(context);
    }
  }

  crear(BuildContext context) async{
    try {
      
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  update(BuildContext context) async{
    try {
      
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  agregarActidad(){
    _actividadesSE.add(SocioActividad(nombre: nombreActividad.text, descripcion: descripcionActividad.text));
    nombreActividad.clear();
    descripcionActividad.clear();
    notifyListeners();
  }

  eliminarActividad(SocioActividad actividad){
    _actividadesSE.remove(actividad);
    notifyListeners();
  }

  cleanData(){
    
  }
}