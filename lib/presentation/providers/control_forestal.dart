
import 'dart:io';

import 'package:ecomap/domain/domain.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:ecomap/presentation/screens/visualization/control_forestal.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ControlForestalProvider with ChangeNotifier{
  final ControlForestalBaseRepository _repository;
  List<ControlForestal> _listForms = [];
  List<ControlForestal> _listFormFilter = [];
  List<ControlForestal> get listForm => _listFormFilter;
  ControlForestal? _current;
  ControlForestal? get current => _current;

  ControlForestalProvider(this._repository);

  bool _isLoading = false;
  bool get isLoading => _isLoading; 
  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  } 

  //Form
  final nombrePropietarioController = TextEditingController();
  final provinciaController = TextEditingController();
  String? _provincia;
  String? get provincia => _provincia;
  set provincia(String? value){
    _provincia = value;
    notifyListeners();
  }
  final coordenadasController = TextEditingController();
  double? latitud;
  double? longitud;
  final cantonController = TextEditingController();
  String? _canton;
  String? get canton => _canton;
  set canton(String? value){
    _canton = value;
    notifyListeners();
  }
  final parroquiaController = TextEditingController();
  String? _parroquia;
  String? get parroquia => _parroquia;
  set parroquia(String? value){
    _parroquia = parroquia;
    notifyListeners();
  }
  final convencionalController = TextEditingController();
  final celularController = TextEditingController();
  final emailController = TextEditingController();
  final volumenMaderaRevisadaController = TextEditingController();
  final volumenMaderaRetenidaController = TextEditingController();
  final retencionEspecimenesController = TextEditingController();
  final superficieIncendiosController = TextEditingController();
  final programasController = TextEditingController();
  final propietariosController = TextEditingController();
  final regentesController = TextEditingController();
  final ejecutoresController = TextEditingController();
  final propietariosIndustriasController = TextEditingController();
  final motosierristasController = TextEditingController();
  final transportistasMaderaController = TextEditingController();

  Future<void> getAll() async{
    try {
      _listForms = await _repository.getAll();
      _listFormFilter = _listForms;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  navigateToReportDetalle(BuildContext context, ControlForestal control){
    _current = control;
    context.pushNamed(ReportControlForestalDetalleScreen.name);
  }

  navigateToEdit(BuildContext context, ControlForestal control){
    _current = control;
    coordenadasController.text = control.datosPropietario.latitud == null ? '' : '${control.datosPropietario.latitud} ; ${control.datosPropietario.longitud}';
    nombrePropietarioController.text = control.datosPropietario.nombre ?? '';
    provinciaController.text = control.datosPropietario.provincia ?? '';
    provincia = control.datosPropietario.provincia;
    cantonController.text = control.datosPropietario.canton ?? '';
    canton = control.datosPropietario.canton;
    parroquiaController.text = control.datosPropietario.parroquia ?? '';
    parroquia = control.datosPropietario.parroquia;
    convencionalController.text = control.datosPropietario.convencional ?? '';
    celularController.text = control.datosPropietario.celular ?? '';
    emailController.text = control.datosPropietario.email ?? '';
    volumenMaderaRevisadaController.text = control.lineaBase.volumenMaderaRevisada == null? '' : control.lineaBase.volumenMaderaRevisada.toString();
    volumenMaderaRetenidaController.text = control.lineaBase.volumenMaderaRetenida == null? '' : control.lineaBase.volumenMaderaRetenida.toString();
    retencionEspecimenesController.text = control.lineaBase.retencionEspecimenes == null? '' : control.lineaBase.retencionEspecimenes.toString();
    superficieIncendiosController.text = control.lineaBase.superficieIncendios == null? '' : control.lineaBase.superficieIncendios.toString();
    programasController.text = control.lineaBase.programas == null? '' : control.lineaBase.programas.toString();
    propietariosController.text = control.poblacion.propietarios == null? '' : control.poblacion.propietarios.toString();
    regentesController.text = control.poblacion.regentes == null? '' : control.poblacion.regentes.toString();
    ejecutoresController.text = control.poblacion.ejecutores == null? '' : control.poblacion.ejecutores.toString();
    propietariosIndustriasController.text = control.poblacion.propietariosIndustrias == null? '' : control.poblacion.propietariosIndustrias.toString();
    motosierristasController.text = control.poblacion.motosierristas == null? '' : control.poblacion.motosierristas.toString();
    transportistasMaderaController.text = control.poblacion.transportistasMadera == null? '' : control.poblacion.transportistasMadera.toString();
    context.pushNamed(FormControlForestalPropietarioScreen.name);
  }

  submitForm(BuildContext context){
    if(_current == null){
      crear(context);
    }else{
      update(context);
    }
  }

  listFilter(String nombre){
    if(nombre.isEmpty){
      _listFormFilter = _listForms;
    }else{
      _listFormFilter = _listForms.where((x) => x.datosPropietario.nombre != null && x.datosPropietario.nombre!.toLowerCase().contains(nombre.toLowerCase())).toList();
    }
    notifyListeners();
  }


  crear(BuildContext context) async{
    try {
      isLoading = true;
      final control = ControlForestal(
        fechaRegistro: DateTime.now().toUtc(), 
        datosPropietario: DatosPropietario(
          nombre: nombrePropietarioController.text,
          provincia: provincia,
          canton: canton,
          parroquia: parroquia,
          celular: celularController.text,
          convencional: convencionalController.text,
          email: emailController.text,
          latitud: latitud,
          longitud: longitud,
        ), 
        lineaBase: LineaBase(
          programas: int.tryParse(programasController.text),
          retencionEspecimenes: int.tryParse(retencionEspecimenesController.text),
          superficieIncendios: double.tryParse(superficieIncendiosController.text),
          volumenMaderaRetenida: double.tryParse(volumenMaderaRetenidaController.text),
          volumenMaderaRevisada: double.tryParse(volumenMaderaRevisadaController.text),
        ), 
        poblacion: Poblacion(
          ejecutores: int.tryParse(ejecutoresController.text),
          motosierristas: int.tryParse(motosierristasController.text),
          propietarios: int.tryParse(propietariosController.text),
          propietariosIndustrias: int.tryParse(propietariosController.text),
          regentes: int.tryParse(regentesController.text),
          transportistasMadera: int.tryParse(transportistasMaderaController.text)
        )
      );
      await _repository.create(control);
      context.goNamed(HomeScreen.name);
      context.pushNamed(VisualizationControlForestalScreen.name);
      cleanData();
    } catch (e) {
      debugPrint(e.toString());
    }
    finally{
      isLoading = false;
    }
  }

  update(BuildContext context) async{
    try {
      isLoading = true;
      final control = ControlForestal(
        id: current!.id,
        fechaRegistro: current!.fechaRegistro, 
        datosPropietario: DatosPropietario(
          nombre: nombrePropietarioController.text,
          provincia: provincia,
          canton: canton,
          parroquia: parroquia,
          celular: celularController.text,
          convencional: convencionalController.text,
          email: emailController.text,
          latitud: _current!.datosPropietario.latitud,
          longitud: _current!.datosPropietario.longitud
        ), 
        lineaBase: LineaBase(
          programas: int.tryParse(programasController.text),
          retencionEspecimenes: int.tryParse(retencionEspecimenesController.text),
          superficieIncendios: double.tryParse(superficieIncendiosController.text),
          volumenMaderaRetenida: double.tryParse(volumenMaderaRetenidaController.text),
          volumenMaderaRevisada: double.tryParse(volumenMaderaRevisadaController.text),
        ), 
        poblacion: Poblacion(
          ejecutores: int.tryParse(ejecutoresController.text),
          motosierristas: int.tryParse(motosierristasController.text),
          propietarios: int.tryParse(propietariosController.text),
          propietariosIndustrias: int.tryParse(propietariosController.text),
          regentes: int.tryParse(regentesController.text),
          transportistasMadera: int.tryParse(transportistasMaderaController.text)
        )
      );
      await _repository.update(control);
      context.goNamed(HomeScreen.name);
      context.pushNamed(VisualizationControlForestalScreen.name);
      cleanData();
      } catch (e) {
      debugPrint(e.toString());
    }
    finally{
      isLoading = false;
    }
  }

  cleanData(){
    _current = null;
    nombrePropietarioController.clear();
    provinciaController.clear();
    provincia = null;
    cantonController.clear();
    canton = null;
    parroquiaController.clear();
    parroquia = null;
    convencionalController.clear();
    celularController.clear();
    emailController.clear();
    volumenMaderaRevisadaController.clear();
    volumenMaderaRetenidaController.clear();
    retencionEspecimenesController.clear();
    superficieIncendiosController.clear();
    programasController.clear();
    propietariosController.clear();
    regentesController.clear();
    ejecutoresController.clear();
    propietariosIndustriasController.clear();
    motosierristasController.clear();
    transportistasMaderaController.clear();
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
    final pathPDF = "${output!.path}/reporte.pdf";
    final file = File(pathPDF);
    final path = await pdf.save();
    await file.writeAsBytes(path);
    await OpenFile.open(pathPDF);
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
              padding: const pw.EdgeInsets.all(8.0),
              child: pw.Text(
                nombre,
                style: pw.TextStyle(color: color != null ? PdfColors.white : null, font: font),
              ),
            ),
          ),
          pw.Expanded(
            child: pw.Padding(
              padding: const pw.EdgeInsets.all(8.0),
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

  Future<void> getLocation() async{
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return;
    }
    final currentPosition = await Geolocator.getCurrentPosition();
    longitud = currentPosition.longitude;
    latitud = currentPosition.latitude;
    if(latitud != null){
      coordenadasController.text = "$latitud ; $longitud";
    }
  }
}