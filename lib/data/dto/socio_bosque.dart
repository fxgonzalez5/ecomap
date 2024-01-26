
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomap/domain/domain.dart';

class SocioBosqueDto{
  String? id;
  DateTime fechaRegistro;
  String? tipoSocio;
  String? tipoCapitulo;
  String? rucDatosGenerales;
  String? representanteDatosGenerales;
  String? registroDatosGenerales;
  DateTime? fechaPersonaJuidicaDatosGenerales;
  String? etniaDatosGenerales;
  bool? vivenEnElPredioDatosGenerales;
  String? direccionNotificacion;
  String? provinciaNotificacion;
  String? cantonNotificacion;
  String? parroquiaNotificacion;
  String? comunidadNotificacion;
  String? convencionalNotificacion;
  String? celularNotificacion;
  String? emailNotificacion;
  String? nombreContacto;
  String? cargoContacto;
  String? telefonoContacto;
  String? tipoCuenta;
  String? institucionCuenta;
  String? numeroCuenta;
  int? beneficiariosSE;
  int? familiasSE;
  int? menoresSE;
  int? hombresSE;
  int? mujeresSE;
  bool? discapacitadosSE;
  int? cantidadDiscapacidadosSE;
  List<SocioActividad> actividadesSE;
  double? promedioIngresoSE;
  double? latitudUbicacion;
  double? longitudUbicacion;
  String? superficieUbicacion;
  String? superficieConservarUbicacion;
  String? descripcionUbicacion;
  String? norteLindero;
  String? surLindero;
  String? esteLindero;
  String? oesteLindero;
  String? numeroRP;
  DateTime? fechaRP;
  String? formaAP;
  DateTime? fechaAP;
  String? institucionAP;
  String? observacionesAP;

  SocioBosqueDto({
    id,
    required this.fechaRegistro,
    this.tipoSocio,
    this.tipoCapitulo,
    this.rucDatosGenerales,
    this.representanteDatosGenerales,
    this.registroDatosGenerales,
    this.fechaPersonaJuidicaDatosGenerales,
    this.etniaDatosGenerales,
    this.vivenEnElPredioDatosGenerales,
    this.direccionNotificacion,
    this.provinciaNotificacion,
    this.cantonNotificacion,
    this.parroquiaNotificacion,
    this.comunidadNotificacion,
    this.convencionalNotificacion,
    this.celularNotificacion,
    this.emailNotificacion,
    this.nombreContacto,
    this.cargoContacto,
    this.telefonoContacto,
    this.tipoCuenta,
    this.institucionCuenta,
    this.numeroCuenta,
    this.beneficiariosSE,
    this.familiasSE,
    this.menoresSE,
    this.hombresSE,
    this.mujeresSE,
    this.discapacitadosSE,
    this.cantidadDiscapacidadosSE,
    required this.actividadesSE,
    this.promedioIngresoSE,
    this.latitudUbicacion,
    this.longitudUbicacion,
    this.superficieUbicacion,
    this.superficieConservarUbicacion,
    this.descripcionUbicacion,
    this.norteLindero,
    this.surLindero,
    this.esteLindero,
    this.oesteLindero,
    this.numeroRP,
    this.fechaRP,
    this.formaAP,
    this.fechaAP,
    this.institucionAP,
    this.observacionesAP,
  });

  factory SocioBosqueDto.fromMap(Map<String, dynamic> json){
    return SocioBosqueDto(
      id: json['id'],
      fechaRegistro: (json['fechaRegistro'] as Timestamp).toDate().toLocal(), 
      tipoSocio: json['tipoSocio'],
      tipoCapitulo: json['tipoCapitulo'],
      rucDatosGenerales: json['datosGenerales']['ruc'],
      representanteDatosGenerales: json['datosGenerales']['representante'],
      registroDatosGenerales: json['datosGenerales']['registro'],
      fechaPersonaJuidicaDatosGenerales: json['datosGenerales']['fechaPersonaJuidica'] == null ? null : (json['datosGenerales']['fechaPersonaJuidica'] as Timestamp).toDate().toLocal(),
      etniaDatosGenerales: json['datosGenerales']['etnia'],
      vivenEnElPredioDatosGenerales: json['datosGenerales']['vivenEnElPredio'],
      direccionNotificacion: json['notificaciones']['direccion'],
      provinciaNotificacion: json['notificaciones']['provincia'],
      cantonNotificacion: json['notificaciones']['canton'],
      parroquiaNotificacion: json['notificaciones']['parroquia'],
      comunidadNotificacion: json['notificaciones']['comunidad'],
      convencionalNotificacion: json['notificaciones']['convencional'],
      celularNotificacion: json['notificaciones']['celular'],
      emailNotificacion: json['notificaciones']['email'],
      nombreContacto: json['contacto']['nombre'],
      cargoContacto: json['contacto']['cargo'],
      telefonoContacto: json['contacto']['telefono'],
      tipoCuenta: json['cuenta']['tipo'],
      institucionCuenta: json['cuenta']['institucion'],
      numeroCuenta: json['cuenta']['numero'],
      beneficiariosSE: json['socioEconomico']['beneficiarios'],
      familiasSE: json['socioEconomico']['familias'],
      menoresSE: json['socioEconomico']['menores'],
      hombresSE: json['socioEconomico']['hombres'],
      mujeresSE: json['socioEconomico']['mujeres'],
      discapacitadosSE: json['socioEconomico']['discapacitados'],
      cantidadDiscapacidadosSE: json['socioEconomico']['cantidadDiscapacitados'],
      promedioIngresoSE: json['socioEconomico']['promedioIngreso'],
      actividadesSE: (json['socioEconomico']['activiades'] as List<Map<String, dynamic>>)
        .map((x) => SocioActividad(nombre: x['nombre'], descripcion: x['descripcion'])).toList(),
      latitudUbicacion: json['ubicacion']['latitud'],
      longitudUbicacion: json['ubicacion']['longitud'],
      superficieUbicacion: json['ubicacion']['superficie'],
      superficieConservarUbicacion: json['ubicacion']['superficieConservar'],
      descripcionUbicacion: json['ubicacion']['descripcion'],
      norteLindero: json['lindero']['norte'],   
      surLindero: json['lindero']['sur'],   
      esteLindero: json['lindero']['este'],   
      oesteLindero: json['lindero']['oeste'],   
      numeroRP: json['registroPropiedad']['numero'],
      formaAP: json['adquisicionPredio']['forma'],
      fechaRP: json['registroPropiedad']['fecha'] == null ? null : (json['registroPropiedad']['fecha'] as Timestamp).toDate().toLocal(),
      institucionAP: json['adquisicionPredio']['institucion'],
      observacionesAP: json['adquisicionPredio']['observaciones'],
    );
  }

  factory SocioBosqueDto.fromSocioBosque(SocioBosque socioBosque){
    return SocioBosqueDto(
      id: socioBosque.id, 
      fechaRegistro: socioBosque.fechaRegistro,
      tipoSocio: socioBosque.tipoSocio,
      tipoCapitulo: socioBosque.tipoCapitulo,
      rucDatosGenerales: socioBosque.datosGenerales.ruc,
      representanteDatosGenerales: socioBosque.datosGenerales.representante,
      registroDatosGenerales: socioBosque.datosGenerales.registro,
      fechaPersonaJuidicaDatosGenerales: socioBosque.datosGenerales.fechaPersonaJuidica,
      etniaDatosGenerales: socioBosque.datosGenerales.etnia,
      vivenEnElPredioDatosGenerales: socioBosque.datosGenerales.vivenEnElPredio,
      direccionNotificacion: socioBosque.notificaciones.direccion,
      provinciaNotificacion: socioBosque.notificaciones.provincia,
      cantonNotificacion: socioBosque.notificaciones.canton,
      parroquiaNotificacion: socioBosque.notificaciones.parroquia,
      comunidadNotificacion: socioBosque.notificaciones.comunidad,
      convencionalNotificacion: socioBosque.notificaciones.convencional,
      celularNotificacion: socioBosque.notificaciones.celular,
      emailNotificacion: socioBosque.notificaciones.email,
      nombreContacto: socioBosque.contacto.nombre,
      cargoContacto: socioBosque.contacto.cargo,
      telefonoContacto: socioBosque.contacto.telefono,
      tipoCuenta: socioBosque.cuenta.tipo,
      institucionCuenta: socioBosque.cuenta.institucion,
      numeroCuenta: socioBosque.cuenta.numero,
      beneficiariosSE: socioBosque.socioEconomico.beneficiarios,
      familiasSE: socioBosque.socioEconomico.familias,
      menoresSE: socioBosque.socioEconomico.menores,
      hombresSE: socioBosque.socioEconomico.hombres,
      mujeresSE: socioBosque.socioEconomico.mujeres,
      discapacitadosSE: socioBosque.socioEconomico.discapacitados,
      cantidadDiscapacidadosSE: socioBosque.socioEconomico.cantidadDiscapacitados,
      promedioIngresoSE: socioBosque.socioEconomico.promedioIngreso,
      actividadesSE: socioBosque.socioEconomico.actividades,
      latitudUbicacion: socioBosque.ubicacionPredio.latitud,
      longitudUbicacion: socioBosque.ubicacionPredio.longitud,
      superficieUbicacion: socioBosque.ubicacionPredio.superficie,
      superficieConservarUbicacion: socioBosque.ubicacionPredio.superficieConservar,
      descripcionUbicacion: socioBosque.ubicacionPredio.descripcion,
      norteLindero: socioBosque.linderoPredio.norte,
      surLindero: socioBosque.linderoPredio.sur,   
      esteLindero: socioBosque.linderoPredio.este,   
      oesteLindero: socioBosque.linderoPredio.oeste,   
      numeroRP: socioBosque.registroPropiedad.numero,
      formaAP: socioBosque.adquisicionPredio.forma,
      fechaRP: socioBosque.adquisicionPredio.fecha,
      institucionAP: socioBosque.adquisicionPredio.institucion,
      observacionesAP: socioBosque.adquisicionPredio.observaciones,
    );
  }

  SocioBosque toSocioBosque(){
    return SocioBosque(
      id: id, 
      fechaRegistro: fechaRegistro,
      tipoSocio: tipoSocio,
      tipoCapitulo: tipoCapitulo,
      datosGenerales: SocioDatosGenerales(
        ruc: rucDatosGenerales,
        representante: representanteDatosGenerales,
        registro: registroDatosGenerales,
        fechaPersonaJuidica: fechaPersonaJuidicaDatosGenerales,
        etnia: etniaDatosGenerales,
        vivenEnElPredio: vivenEnElPredioDatosGenerales,
      ),
      notificaciones: SocioNotificaciones(
        direccion: direccionNotificacion,
        provincia: provinciaNotificacion,
        canton: cantonNotificacion,
        parroquia: parroquiaNotificacion,
        comunidad: comunidadNotificacion,
        convencional: convencionalNotificacion,
        celular: celularNotificacion,
        email: emailNotificacion,        
      ),
      contacto: SocioContacto(
        nombre: nombreContacto,
        cargo: cargoContacto,
        telefono: telefonoContacto
      ),
      cuenta: SocioCuenta(
        tipo: tipoCuenta,
        institucion: institucionCuenta,
        numero: numeroCuenta,
      ),
      socioEconomico: SocioSocioEconomico(
        beneficiarios: beneficiariosSE,
        familias: familiasSE,
        menores: menoresSE,
        hombres: hombresSE,
        mujeres: mujeresSE,
        discapacitados: discapacitadosSE,
        cantidadDiscapacitados: cantidadDiscapacidadosSE,
        actividades: actividadesSE,
        promedioIngreso: promedioIngresoSE,
      ),
      ubicacionPredio: SocioUbicacionPredio(
        latitud: latitudUbicacion,
        longitud: longitudUbicacion,
        superficie: superficieUbicacion,
        superficieConservar: superficieConservarUbicacion,
        descripcion: descripcionUbicacion,
      ),
      linderoPredio: SocioLinderoPredio(
        norte: norteLindero,
        sur: surLindero,
        este: esteLindero,
        oeste: oesteLindero,
      ),
      registroPropiedad: SocioRegistroPropiedad(
        fecha: fechaRP,
        numero: numeroRP
      ),
      adquisicionPredio: SocioAdquisicionPredio(
        fecha: fechaAP,
        forma: formaAP,
        institucion: institucionAP,
        observaciones: observacionesAP
      ),
    );
  }

  Map<String, dynamic> toMap(){
    return <String, dynamic>{
      'fechaRegistro': fechaRegistro,
      'tipoSocio': tipoSocio,
      'tipoCapitulo': tipoCapitulo,
      'datosGenerales':{
        'ruc': rucDatosGenerales,
        'representante': representanteDatosGenerales,
        'registro': registroDatosGenerales,
        'fechaPersonaJuidica': fechaPersonaJuidicaDatosGenerales,
        'etnia': etniaDatosGenerales,
        'vivenEnElPredio': vivenEnElPredioDatosGenerales
      },
      'notificaciones':{
        'direccion': direccionNotificacion,
        'provincia': provinciaNotificacion,
        'canton': cantonNotificacion,
        'parroquia': parroquiaNotificacion,
        'comunidad': comunidadNotificacion,
        'convencional': convencionalNotificacion,
        'celular': celularNotificacion,
        'email': emailNotificacion
      },
      'contacto':{
        'nombre': nombreContacto,
        'cargo': cargoContacto,
        'telefono': telefonoContacto,
      },
      'cuenta':{
        'tipo': tipoCuenta,
        'institucion': institucionCuenta,
        'numero': numeroCuenta
      },
      'socioEconomico':{
        'beneficiarios': beneficiariosSE,
        'familias': familiasSE,
        'menores': menoresSE,
        'hombres': hombresSE,
        'mujeres': mujeresSE,
        'discapacitados': discapacitadosSE,
        'cantidadDiscapacitados': cantidadDiscapacidadosSE,
        'promedioIngreso': promedioIngresoSE,
        'actividades': actividadesSE.map((x) => {'nombre': x.nombre, 'descripcion': x.descripcion}).toList()
      },
      'ubicacion':{
        'latitud': latitudUbicacion,
        'longitud': longitudUbicacion,
        'superficie': superficieUbicacion,
        'superficieConservar': superficieConservarUbicacion,
        'descripcion': descripcionUbicacion
      },
      'lindero':{
        'norte': norteLindero,
        'sur': surLindero,
        'este': esteLindero,
        'oeste': oesteLindero
      },
      'registroPropiedad':{
        'numero': numeroRP,
        'fecha': fechaRP,
      },
      'adquisicionPredio':{
        'forma': formaAP,
        'fecha': fechaAP,
        'institucion': institucionAP,
        'observaciones': observacionesAP
      }
    };
  }
}