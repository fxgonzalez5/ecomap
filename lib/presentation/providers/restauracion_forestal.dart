import 'package:ecomap/domain/domain.dart';
import 'package:ecomap/presentation/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class RestauracionForestalProvider with ChangeNotifier{
  final RestauracionForestalBaseRepository _restauracionForestalRepository;
  List<RestauracionForestal> _listRestauracion = List.empty();
  List<RestauracionForestal> get listRestauracion => _listRestauracion;


  //Form
  final codigoFichaController = TextEditingController();
  final cedulaController = TextEditingController();
  final nombreController = TextEditingController();
  final fechaController = TextEditingController();
  String? fechaLanzamiento = null;
  final equipoGPSController = TextEditingController();
  final provinciaController = TextEditingController();
  String? _provincia = null;
  String? get provincia => _provincia;
  set provincia(String? value){
    _provincia = value;
  }
  final cantonController = TextEditingController();
  String? _canton = null;
  String? get canton => _canton;
  set canton(String? value){
    _canton = value;
    notifyListeners();
  }
  final parroquiaController = TextEditingController();
  String? _parroquia = null;
  String? get parroquia => _parroquia;
  set parroquia(String? value){
    _parroquia = parroquia;
    notifyListeners();
  }
  final observacionesController = TextEditingController();
  final cantidadController = TextEditingController();
  final actividadesController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading; 
  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

  RestauracionForestalProvider(this._restauracionForestalRepository);

  Future<void> getAll() async{
    try {
      _listRestauracion = await _restauracionForestalRepository.getAll();
      notifyListeners();
    } catch (e) {
      print('Error');
      debugPrint(e.toString());
    }finally{
      
    }
  }

  crear(BuildContext context) async{
    try {
      
      isLoading = true;
      final currentPosition = await getLocation();
      final restauracion = RestauracionForestal(
        beneficiario: RestauracionBeneficiario(
          codigoFicha: codigoFichaController.text.isEmpty ? null : codigoFichaController.text,
          cedula: cedulaController.text.isEmpty ? null : cedulaController.text,
          nombre: nombreController.text.isEmpty ? null : nombreController.text,
        ), 
        detalle: RestauracionDetalle(
          equipoGPS: equipoGPSController.text.isEmpty ? null : equipoGPSController.text,
          fechaLanzamiento: fechaLanzamiento == null ? null : DateTime.parse(fechaLanzamiento!)
        ), 
        ubicacion: RestauracionUbicacion(
          provincia: provincia ?? null,
          canton: canton ?? null,
          parroquia: parroquia ?? null,
          latitud: currentPosition?.latitude,
          longitud: currentPosition?.longitude,
          observaciones: observacionesController.text.isEmpty ? null : observacionesController.text

        ), 
        potenciacion: RestauracionPotenciacionViveros(
          cantidad: cantidadController.text.isEmpty ? null : int.tryParse(cantidadController.text),
          actividades: actividadesController.text.isEmpty ? null : actividadesController.text,
          informeImagenURL: null
        )
      );
      await _restauracionForestalRepository.create(restauracion);
      context.goNamed(HomeScreen.name);
      cleanData();
    } catch (e) {
      debugPrint(e.toString());
    }finally{
      isLoading = false;
    }
  }

  Future<Position?> getLocation() async{
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return null;
    }
    return await Geolocator.getCurrentPosition();
  }

  cleanData(){
    codigoFichaController.clear();
    cedulaController.clear();
    nombreController.clear();
    fechaController.clear();
    fechaLanzamiento = null;
    equipoGPSController.clear();
    provinciaController.clear();
    _provincia = null;
    cantonController.clear();
    _canton = null;
    parroquiaController.clear();
    _parroquia = null;
    observacionesController.clear();
    cantidadController.clear();
    actividadesController.clear();
  }
}