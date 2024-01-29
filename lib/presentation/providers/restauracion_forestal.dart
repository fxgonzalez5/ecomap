import 'dart:io';
import 'package:ecomap/domain/domain.dart';
import 'package:ecomap/presentation/screens/home/home_screen.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:open_file/open_file.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:typed_data';
import 'package:printing/printing.dart';

class RestauracionForestalProvider with ChangeNotifier{
  final RestauracionForestalBaseRepository _restauracionForestalRepository;
  List<RestauracionForestal> _listRestauracion = List.empty();
  List<RestauracionForestal> _listRestauracionFilter = List.empty();
  List<RestauracionForestal> get listRestauracion => _listRestauracionFilter;
  RestauracionForestal? _currentRestauracionForestal;
  RestauracionForestal? get currentRestauracionForestal => _currentRestauracionForestal;
  String? _pathPDF;
  String? get pathPDF => _pathPDF;

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
    notifyListeners();
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
  String? _informeImagenURL;
  String? get informeImagenURL => _informeImagenURL;
  set informeImagenURL(String? value){
    _informeImagenURL = value;
    notifyListeners();
  }

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
      _listRestauracionFilter = _listRestauracion;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }finally{
      
    }
  }

  navigateToEdit(BuildContext context, RestauracionForestal restauracion){
    _currentRestauracionForestal = restauracion;
    codigoFichaController.text = restauracion.beneficiario.codigoFicha ?? '';
    cedulaController.text = restauracion.beneficiario.cedula ?? '';
    nombreController.text = restauracion.beneficiario.nombre ?? '';
    fechaController.text = restauracion.detalle.fechaLanzamiento == null ? '':restauracion.detalle.fechaLanzamiento.toString().split(' ')[0];
    fechaLanzamiento = fechaController.text == '' ? null : fechaController.text;
    equipoGPSController.text = restauracion.detalle.equipoGPS ?? '';
    provincia = restauracion.ubicacion.provincia;
    canton = restauracion.ubicacion.canton;
    parroquia = restauracion.ubicacion.canton;
    observacionesController.text = restauracion.ubicacion.observaciones ?? '';
    cantidadController.text = restauracion.potenciacion.cantidad?.toString() ?? '';
    actividadesController.text = restauracion.potenciacion.actividades ?? '';
    provinciaController.text = restauracion.ubicacion.provincia ?? '';
    provincia = restauracion.ubicacion.provincia;
    cantonController.text = restauracion.ubicacion.canton ?? '';
    canton = restauracion.ubicacion.canton;
    parroquiaController.text = restauracion.ubicacion.parroquia ?? '';
    parroquia = restauracion.ubicacion.parroquia;
    informeImagenURL = restauracion.potenciacion.informeImagenURL;
    context.pushNamed(FormRestauracionForestalBeneficiarioScreen.name);
  }

  navigateToReportDetalle(BuildContext context, RestauracionForestal restauracion){
    _currentRestauracionForestal = restauracion;
    context.pushNamed(ReportRestauracionForestalDetalleScreen.name);
  }

  restauracionFilter(String nombreBeneficiario){
    if(nombreBeneficiario.isEmpty){
      _listRestauracionFilter = _listRestauracion;
    }else{
      _listRestauracionFilter = _listRestauracion.where((x) => x.beneficiario.nombre != null && x.beneficiario.nombre!.toLowerCase().contains(nombreBeneficiario.toLowerCase())).toList();
    }
    notifyListeners();
  }

  submitForm(BuildContext context){
    if(_currentRestauracionForestal == null){
      crear(context);
    }else{
      update(context);
    }
  }

  crear(BuildContext context) async{
    try {
      isLoading = true;
      final currentPosition = await getLocation();
      final restauracion = RestauracionForestal(
        fechaRegistro: DateTime.now().toUtc(),  
        beneficiario: RestauracionBeneficiario(
          codigoFicha: codigoFichaController.text.isEmpty ? null : codigoFichaController.text,
          cedula: cedulaController.text.isEmpty ? null : cedulaController.text,
          nombre: nombreController.text.isEmpty ? null : nombreController.text,
        ), 
        detalle: RestauracionDetalle(
          equipoGPS: equipoGPSController.text.isEmpty ? null : equipoGPSController.text,
          fechaLanzamiento: fechaLanzamiento == null ? null : DateTime.parse(fechaLanzamiento!).toUtc()
        ), 
        ubicacion: RestauracionUbicacion(
          provincia: provincia,
          canton: canton,
          parroquia: parroquia,
          latitud: currentPosition?.latitude,
          longitud: currentPosition?.longitude,
          observaciones: observacionesController.text.isEmpty ? null : observacionesController.text

        ), 
        potenciacion: RestauracionPotenciacionViveros(
          cantidad: cantidadController.text.isEmpty ? null : int.tryParse(cantidadController.text),
          actividades: actividadesController.text.isEmpty ? null : actividadesController.text,
          informeImagenURL: informeImagenURL
        )
      );
      await _restauracionForestalRepository.create(restauracion);
      context.goNamed(HomeScreen.name);
      context.pushNamed(VisualizationRestauracionForestalScreen.name);
      cleanData();
    } catch (e) {
      debugPrint(e.toString());
    }finally{
      isLoading = false;
    }
  }

  update(BuildContext context) async{
    try {
      isLoading = true;
      final restauracion = RestauracionForestal(
        id: _currentRestauracionForestal!.id,
        fechaRegistro: _currentRestauracionForestal!.fechaRegistro,
        beneficiario: RestauracionBeneficiario(
          codigoFicha: codigoFichaController.text.isEmpty ? null : codigoFichaController.text,
          cedula: cedulaController.text.isEmpty ? null : cedulaController.text,
          nombre: nombreController.text.isEmpty ? null : nombreController.text,
        ), 
        detalle: RestauracionDetalle(
          equipoGPS: equipoGPSController.text.isEmpty ? null : equipoGPSController.text,
          fechaLanzamiento: fechaLanzamiento == null ? null : DateTime.parse(fechaLanzamiento!).toUtc()
        ), 
        ubicacion: RestauracionUbicacion(
          provincia: provincia,
          canton: canton,
          parroquia: parroquia,
          observaciones: observacionesController.text.isEmpty ? null : observacionesController.text

        ), 
        potenciacion: RestauracionPotenciacionViveros(
          cantidad: cantidadController.text.isEmpty ? null : int.tryParse(cantidadController.text),
          actividades: actividadesController.text.isEmpty ? null : actividadesController.text,
          informeImagenURL: informeImagenURL
        )
      );
      await _restauracionForestalRepository.update(restauracion);
      context.goNamed(HomeScreen.name);
      context.pushNamed(VisualizationRestauracionForestalScreen.name);
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
    _currentRestauracionForestal = null;
  }

  generateAndSavePDF(BuildContext context, Map<String, String> data) async {
    final pdf = pw.Document();
    final font = await PdfGoogleFonts.nunitoExtraLight();
    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          _buildTableRow("Nombre","Detalle",
              color: PdfColors.blueGrey, 
              font: font),
          ...data.keys.map((x) => _buildTableRow(x,data[x].toString(),font: font)).toList()
        ],
      ),
    );

    final output = await getExternalStorageDirectory();
    _pathPDF = "${output!.path}/reporte.pdf";
    final file = File(_pathPDF!);
    final path = await pdf.save();
    await file.writeAsBytes(path);
    await OpenFile.open(_pathPDF);
  }

  pw.Container _buildTableRow(String nombre, String detalle, {PdfColor? color, required pw.Font font}){

    return pw.Container(
      decoration: pw.BoxDecoration(
        color: color,
      ),
      child: pw.Row(
        children: [
          pw.Expanded(
            child: pw.Padding(
              padding: pw.EdgeInsets.all(8.0),
              child: pw.Text(
                nombre,
                style: pw.TextStyle(color: color != null ? PdfColors.white : null, font: font),
              ),
            ),
          ),
          pw.Expanded(
            child: pw.Padding(
              padding: pw.EdgeInsets.all(8.0),
              child: pw.Text(
                detalle,
                style: pw.TextStyle(color: color != null ? PdfColors.white : null, font: font),
              ),
            ),
          )
        ]
      ),
    );
  }
}