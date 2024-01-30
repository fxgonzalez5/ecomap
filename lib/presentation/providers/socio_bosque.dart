
import 'dart:io';
import 'package:ecomap/domain/domain.dart';
import 'package:ecomap/presentation/screens/reports/socio_bosque_detalle.dart';
import 'package:ecomap/presentation/screens/screens.dart';
import 'package:ecomap/presentation/screens/visualization/socio_bosque.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class SocioBosqueProvider with ChangeNotifier{
  final SocioBosqueBaseRepository _repository;
  List<SocioBosque> _listForms = List.empty();
  List<SocioBosque> _listFormFilter = List.empty();
  List<SocioBosque> get listForm => _listFormFilter;
  SocioBosque? _current;
  SocioBosque? get current => _current;
  
  SocioBosqueProvider(this._repository);
  bool _isLoading = false;
  bool get isLoading => _isLoading; 
  set isLoading(bool value){
    _isLoading = value;
    notifyListeners();
  }

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
  bool? _poseeGravamen;
  bool? get poseeGravamen => _poseeGravamen;
  set poseeGravamen(bool? value){
    _poseeGravamen = value;
    notifyListeners();
  }
  final tipoGravamenController = TextEditingController();
  final institucionGravamenController = TextEditingController();
  bool? _hipotecaGravamen;
  bool? get hipotecaGravamen => _hipotecaGravamen;
  set hipotecaGravamen(bool? value){
    _hipotecaGravamen = value;
    notifyListeners();
  }
  List<SocioSuelo> _suelos = [];
  final tipoSuelo = TextEditingController();
  final superficieSuelo = TextEditingController();
  List<SocioSuelo> get suelos => _suelos;
  bool? _cerramiento;
  bool? get cerramiento => _cerramiento;
  set cerramiento(bool? value){
    _cerramiento = value;
    notifyListeners();
  }
  String? _croquisURL;
  String? get croquisURL => _croquisURL;
  set croquisURL(String? value){
    _croquisURL = value;
    notifyListeners();
  }

  bool? _declaracion;
  bool? get declaracion => _declaracion;
  set declaracion(bool? value){
    _declaracion = value;
    notifyListeners();
  }
  final coordenadasController = TextEditingController();
  double? latitud;
  double? longitud;

  Future<void> getAll() async{
    try {
      _listForms = await _repository.getAll();
      _listFormFilter = _listForms;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  navigateToReportDetalle(BuildContext context, SocioBosque socio){
    _current = socio;
    context.pushNamed(ReportSocioBosqueDetalleScreen.name);
  }

  navigateToEdit(BuildContext context, SocioBosque socioBosque){
    _current = socioBosque;
    coordenadasController.text = socioBosque.ubicacionPredio.latitud == null ? '' : '${socioBosque.ubicacionPredio.latitud} ; ${socioBosque.ubicacionPredio.longitud}';
    tipoSocioController.text = socioBosque.tipoSocio ?? '';
    tipoCapitulo = socioBosque.tipoCapitulo;
    rucDatosGeneralesController.text = socioBosque.datosGenerales.ruc ?? '';
    representanteDatosGeneralesControler.text = socioBosque.datosGenerales.representante ?? '';
    registroDatosGeneralesController.text = socioBosque.datosGenerales.registro ?? '';
    fechaPersonaJuidicaDatosGeneralesController.text = socioBosque.datosGenerales.fechaPersonaJuidica == null ? '':socioBosque.datosGenerales.fechaPersonaJuidica.toString().split(' ')[0];
    fechaPersonaJuidicaDatosGenerales = socioBosque.datosGenerales.fechaPersonaJuidica == null ? null : socioBosque.datosGenerales.fechaPersonaJuidica.toString().split(' ')[0];;
    etniaDatosGeneralesController.text = socioBosque.datosGenerales.etnia ?? '';
    _vivenEnElPredioDatosGenerales = socioBosque.datosGenerales.vivenEnElPredio;
    direccionNotificacionController.text = socioBosque.notificaciones.direccion ?? '';
    provinciaNotificacionController.text = socioBosque.notificaciones.provincia ?? '';
    _provincia = socioBosque.notificaciones.provincia;
    cantonNotificacionController.text = socioBosque.notificaciones.canton ?? '';
    _canton = socioBosque.notificaciones.canton;
    parroquiaNotificacionController.text = socioBosque.notificaciones.parroquia ?? '';
    _parroquia = socioBosque.notificaciones.parroquia;
    comunidadNotificacionController.text = socioBosque.notificaciones.comunidad ?? '';
    convencionalNotificacionController.text = socioBosque.notificaciones.convencional ?? '';
    celularNotificacionController.text = socioBosque.notificaciones.celular ?? '';
    emailNotificacionController.text = socioBosque.notificaciones.email ?? '';
    nombreContactoController.text = socioBosque.contacto.nombre ?? '';
    cargoContactoController.text = socioBosque.contacto.cargo ?? '';
    telefonoContactoController.text = socioBosque.contacto.telefono ?? '';
    tipoCuenta = socioBosque.cuenta.tipo;
    institucionCuentaController.text = socioBosque.cuenta.institucion ?? '';
    institucionCuenta = socioBosque.cuenta.institucion;
    numeroCuentaController.text = socioBosque.cuenta.numero ?? '';
    beneficiariosSEController.text = socioBosque.socioEconomico.beneficiarios == null ? '' : socioBosque.socioEconomico.beneficiarios.toString();
    familiasSEController.text = socioBosque.socioEconomico.familias == null ? '' : socioBosque.socioEconomico.familias.toString();
    menoresSEController.text = socioBosque.socioEconomico.menores == null ? '' : socioBosque.socioEconomico.menores.toString();
    hombresSEController.text = socioBosque.socioEconomico.hombres == null ? '' : socioBosque.socioEconomico.hombres.toString();
    mujeresSEController.text = socioBosque.socioEconomico.mujeres == null ? '' : socioBosque.socioEconomico.mujeres.toString();
    discapacitadosSE = socioBosque.socioEconomico.discapacitados;
    cantidadDiscapacitadosSEController.text = socioBosque.socioEconomico.cantidadDiscapacitados == null ? '' : socioBosque.socioEconomico.cantidadDiscapacitados.toString();
    _actividadesSE = socioBosque.socioEconomico.actividades;
    promedioIngresoSE.text = socioBosque.socioEconomico.promedioIngreso == null ? '' : socioBosque.socioEconomico.promedioIngreso.toString();
    superficieUbicacion.text = socioBosque.ubicacionPredio.superficie ?? '';
    superficieConservarUbicacion.text = socioBosque.ubicacionPredio.superficieConservar ?? '';
    descripcionUbicacion.text = socioBosque.ubicacionPredio.descripcion ?? '';
    norteLindero.text = socioBosque.linderoPredio.norte ?? '';
    surLindero.text = socioBosque.linderoPredio.sur ?? '';
    esteLindero.text = socioBosque.linderoPredio.este ?? '';
    oesteLindero.text = socioBosque.linderoPredio.oeste ?? '';
    numeroRP.text = socioBosque.registroPropiedad.numero ?? '';
    fechaRPController.text = socioBosque.registroPropiedad.fecha == null ? '' : socioBosque.registroPropiedad.fecha.toString().split(' ')[0];
    fechaRP = socioBosque.registroPropiedad.fecha == null ? null : socioBosque.registroPropiedad.fecha.toString().split(' ')[0];
    formaAP = socioBosque.adquisicionPredio.forma;
    fechaAPController.text = socioBosque.adquisicionPredio.fecha == null ? '' : socioBosque.adquisicionPredio.fecha.toString().split(' ')[0];
    fechaAP = socioBosque.adquisicionPredio.fecha == null ? null : socioBosque.adquisicionPredio.fecha.toString().split(' ')[0];
    institucionAPController.text = socioBosque.adquisicionPredio.institucion ?? '';
    observacionesAPContoller.text = socioBosque.adquisicionPredio.institucion ?? '';
    poseeGravamen = socioBosque.gravamen.poseeGravamen;
    tipoGravamenController.text = socioBosque.gravamen.tipo ?? '';
    institucionGravamenController.text = socioBosque.gravamen.institucion ?? '';
    hipotecaGravamen = socioBosque.gravamen.hipoteca;
    _suelos = socioBosque.adicionales.suelos;
    cerramiento = socioBosque.adicionales.cerramiento;
    croquisURL = socioBosque.adicionales.croquisURL;
    declaracion = socioBosque.adicionales.declaracion;
    context.pushNamed(Form1Screen.name);
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
      _listFormFilter = _listForms.where((x) => x.datosGenerales.representante != null && x.datosGenerales.representante!.toLowerCase().contains(nombre.toLowerCase())).toList();
    }
    notifyListeners();
  }

  crear(BuildContext context) async{
    try {
      isLoading = true;
      final socioBosque = SocioBosque(
        fechaRegistro: DateTime.now().toUtc(),  
        tipoSocio: tipoSocioController.text,
        tipoCapitulo: tipoCapitulo,
        datosGenerales: SocioDatosGenerales(
          ruc: rucDatosGeneralesController.text,
          representante: representanteDatosGeneralesControler.text,
          registro: registroDatosGeneralesController.text,
          fechaPersonaJuidica: fechaPersonaJuidicaDatosGenerales == null 
            ? null : DateTime.parse(fechaPersonaJuidicaDatosGenerales!).toUtc(),
          etnia: etniaDatosGeneralesController.text,
          vivenEnElPredio: vivenEnElPredioDatosGenerales
        ), 
        notificaciones: SocioNotificaciones(
          direccion: direccionNotificacionController.text,
          provincia: provincia,
          canton: canton,
          parroquia: parroquia,
          comunidad: comunidadNotificacionController.text,
          convencional: convencionalNotificacionController.text,
          celular: celularNotificacionController.text,
          email: emailNotificacionController.text,
        ), 
        contacto: SocioContacto(
          nombre: nombreContactoController.text,
          cargo: cargoContactoController.text,
          telefono: telefonoContactoController.text,
        ), 
        cuenta: SocioCuenta(
          tipo: tipoCuenta,
          institucion: institucionCuenta,
          numero: numeroCuentaController.text,
        ), 
        socioEconomico: SocioSocioEconomico(
          beneficiarios: int.tryParse(beneficiariosSEController.text),
          familias: int.tryParse(familiasSEController.text),
          menores: int.tryParse(menoresSEController.text),
          hombres: int.tryParse(hombresSEController.text),
          mujeres: int.tryParse(mujeresSEController.text),
          discapacitados: discapacitadosSE,
          cantidadDiscapacitados: int.tryParse(cantidadDiscapacitadosSEController.text),
          promedioIngreso: double.tryParse(promedioIngresoSE.text),
          actividades: actividadesSE,
        ), 
        ubicacionPredio: SocioUbicacionPredio(
          superficie: superficieUbicacion.text,
          superficieConservar: superficieConservarUbicacion.text,
          descripcion: descripcionUbicacion.text,
          latitud: latitud,
          longitud: longitud,
        ), 
        linderoPredio: SocioLinderoPredio(
          norte: norteLindero.text,
          sur: surLindero.text,
          este: esteLindero.text,
          oeste: oesteLindero.text,
        ), 
        registroPropiedad: SocioRegistroPropiedad(
          fecha: fechaRP == null 
            ? null : DateTime.parse(fechaRP!).toUtc(),
          numero: numeroRP.text
        ), 
        adquisicionPredio: SocioAdquisicionPredio(
          forma: formaAP,
          fecha: fechaAP == null 
            ? null : DateTime.parse(fechaAP!).toUtc(),
            institucion: institucionAPController.text,
            observaciones: observacionesAPContoller.text
        ), 
        gravamen: SocioGravamen(
          poseeGravamen: poseeGravamen,
          tipo: tipoGravamenController.text,
          institucion: institucionGravamenController.text,
          hipoteca: hipotecaGravamen,
        ), 
        adicionales: SocioAdicionales(
          suelos: suelos,
          cerramiento: cerramiento,
          croquisURL: croquisURL,
          declaracion: declaracion
        ));
      await _repository.create(socioBosque);
      cleanData();
      context.goNamed(HomeScreen.name);
      context.pushNamed(VisualizationSocioBosqueScreen.name);
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
      final socioBosque = SocioBosque(
        id: _current!.id,
        fechaRegistro: _current!.fechaRegistro,  
        tipoSocio: tipoSocioController.text,
        tipoCapitulo: tipoCapitulo,
        datosGenerales: SocioDatosGenerales(
          ruc: rucDatosGeneralesController.text,
          representante: representanteDatosGeneralesControler.text,
          registro: registroDatosGeneralesController.text,
          fechaPersonaJuidica: fechaPersonaJuidicaDatosGenerales == null 
            ? null : DateTime.parse(fechaPersonaJuidicaDatosGenerales!).toUtc(),
          etnia: etniaDatosGeneralesController.text,
          vivenEnElPredio: vivenEnElPredioDatosGenerales
        ), 
        notificaciones: SocioNotificaciones(
          direccion: direccionNotificacionController.text,
          provincia: provincia,
          canton: canton,
          parroquia: parroquia,
          comunidad: comunidadNotificacionController.text,
          convencional: convencionalNotificacionController.text,
          celular: celularNotificacionController.text,
          email: emailNotificacionController.text,
        ), 
        contacto: SocioContacto(
          nombre: nombreContactoController.text,
          cargo: cargoContactoController.text,
          telefono: telefonoContactoController.text,
        ), 
        cuenta: SocioCuenta(
          tipo: tipoCuenta,
          institucion: institucionCuenta,
          numero: numeroCuentaController.text,
        ), 
        socioEconomico: SocioSocioEconomico(
          beneficiarios: int.tryParse(beneficiariosSEController.text),
          familias: int.tryParse(familiasSEController.text),
          menores: int.tryParse(menoresSEController.text),
          hombres: int.tryParse(hombresSEController.text),
          mujeres: int.tryParse(mujeresSEController.text),
          discapacitados: discapacitadosSE,
          cantidadDiscapacitados: int.tryParse(cantidadDiscapacitadosSEController.text),
          promedioIngreso: double.tryParse(promedioIngresoSE.text),
          actividades: actividadesSE,
        ), 
        ubicacionPredio: SocioUbicacionPredio(
          superficie: superficieUbicacion.text,
          superficieConservar: superficieConservarUbicacion.text,
          descripcion: descripcionUbicacion.text,
          latitud: _current!.ubicacionPredio.latitud,
          longitud: _current!.ubicacionPredio.longitud,
        ), 
        linderoPredio: SocioLinderoPredio(
          norte: norteLindero.text,
          sur: surLindero.text,
          este: esteLindero.text,
          oeste: oesteLindero.text,
        ), 
        registroPropiedad: SocioRegistroPropiedad(
          fecha: fechaRP == null 
            ? null : DateTime.parse(fechaRP!).toUtc(),
          numero: numeroRP.text
        ), 
        adquisicionPredio: SocioAdquisicionPredio(
          forma: formaAP,
          fecha: fechaAP == null 
            ? null : DateTime.parse(fechaAP!).toUtc(),
            institucion: institucionAPController.text,
            observaciones: observacionesAPContoller.text
        ), 
        gravamen: SocioGravamen(
          poseeGravamen: poseeGravamen,
          tipo: tipoGravamenController.text,
          institucion: institucionGravamenController.text,
          hipoteca: hipotecaGravamen,
        ), 
        adicionales: SocioAdicionales(
          suelos: suelos,
          cerramiento: cerramiento,
          croquisURL: croquisURL,
          declaracion: declaracion
        ));
      await _repository.update(socioBosque);
      context.goNamed(HomeScreen.name);
      context.pushNamed(VisualizationSocioBosqueScreen.name);
    } catch (e) {
      debugPrint(e.toString());
    }finally{
      isLoading = false;
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

  agregarSuelo(){
    _suelos.add(SocioSuelo(tipo: tipoSuelo.text, superficie: superficieSuelo.text));
    tipoSuelo.clear();
    superficieSuelo.clear();
    notifyListeners();
  }

  eliminarSuelo(SocioSuelo suelo){
    _suelos.remove(suelo);
    notifyListeners();
  }

  Future<void> getLocation() async{
    bool serviceEnabled;
    LocationPermission permission;

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
    final currentPosition = await Geolocator.getCurrentPosition();
    longitud = currentPosition.longitude;
    latitud = currentPosition.latitude;
    if(latitud != null){
      coordenadasController.text = "${latitud} ; ${longitud}";
    }
  }


  cleanData(){
    _current = null;
    tipoSocioController.clear();
    tipoCapitulo = null;
    rucDatosGeneralesController.clear();
    representanteDatosGeneralesControler.clear();
    registroDatosGeneralesController.clear();
    fechaPersonaJuidicaDatosGeneralesController.clear();
    fechaPersonaJuidicaDatosGenerales = null;
    etniaDatosGeneralesController.clear();
    _vivenEnElPredioDatosGenerales = null;
    direccionNotificacionController.clear();
    provinciaNotificacionController.clear();
    _provincia = null;
    cantonNotificacionController.clear();
    _canton = null;
    parroquiaNotificacionController.clear();
    _parroquia = null;
    comunidadNotificacionController.clear();
    convencionalNotificacionController.clear();
    celularNotificacionController.clear();
    emailNotificacionController.clear();
    nombreContactoController.clear();
    cargoContactoController.clear();
    telefonoContactoController.clear();
    tipoCuenta = null;
    institucionCuentaController.clear();
    institucionCuenta = null;
    numeroCuentaController.clear();
    beneficiariosSEController.clear();
    familiasSEController.clear();
    menoresSEController.clear();
    hombresSEController.clear();
    mujeresSEController.clear();
    discapacitadosSE = null;
    cantidadDiscapacitadosSEController.clear();
    _actividadesSE = [];
    promedioIngresoSE.clear();
    superficieUbicacion.clear();
    superficieConservarUbicacion.clear();
    descripcionUbicacion.clear();
    norteLindero.clear();
    surLindero.clear();
    esteLindero.clear();
    oesteLindero.clear();
    numeroRP.clear();
    fechaRPController.clear();
    fechaRP = null;
    formaAP = null;
    fechaAPController.clear();
    fechaAP = null;
    institucionAPController.clear();
    observacionesAPContoller.clear();
    poseeGravamen = null;
    tipoGravamenController.clear();
    institucionGravamenController.clear();
    hipotecaGravamen = null;
    _suelos = [];
    cerramiento = null;
    croquisURL = null;
    declaracion = null;
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
    final _pathPDF = "${output!.path}/reporte.pdf";
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