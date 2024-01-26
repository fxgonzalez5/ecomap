
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomap/domain/domain.dart';

class RestauracionForestalDto{
  String? id;
  DateTime fechaRegistro;
  String? codigoFicha;
  String? cedulaBeneficiario;
  String? nombreBeneficiario;
  DateTime? fechaLanzamiento;
  String? equipoGPS;
  String? provincia;
  String? canton;
  String? parroquia;
  double? latitud;
  double? longitud;
  String? observaciones;
  int? cantidadViveros;
  String? actividades;
  String? informeImagenURL;

  RestauracionForestalDto({
    this.id, 
    required this.fechaRegistro,
    this.codigoFicha,
    this.cedulaBeneficiario,
    this.nombreBeneficiario,
    this.fechaLanzamiento,
    this.equipoGPS,
    this.provincia,
    this.canton,
    this.parroquia,
    this.latitud,
    this.longitud,
    this.observaciones,
    this.cantidadViveros,
    this.actividades,
    this.informeImagenURL
  });

  factory RestauracionForestalDto.fromMap(Map<String, dynamic> json){
    return RestauracionForestalDto(
      id: json['id'],
      fechaRegistro: (json['fechaRegistro'] as Timestamp).toDate().toLocal(),
      codigoFicha: json['beneficiario']['codigoFicha'],
      cedulaBeneficiario: json['beneficiario']['cedula'],
      nombreBeneficiario: json['beneficiario']['nombre'],
      fechaLanzamiento: json['detalle']['fechaLanzamiento'] != null ? (json['detalle']['fechaLanzamiento'] as Timestamp).toDate().toLocal() : null,
      equipoGPS: json['detalle']['equipoGPS'],
      provincia: json['ubicacion']['provincia'],
      canton: json['ubicacion']['canton'],
      parroquia: json['ubicacion']['parroquia'],
      latitud: json['ubicacion']['latitud'] == null ? null : json['ubicacion']['latitud'],
      longitud: json['ubicacion']['longitud'] == null ? null : json['ubicacion']['longitud'],
      observaciones: json['ubicacion']['observaciones'],
      cantidadViveros: json['potenciacion']['cantidad'],
      actividades: json['potenciacion']['actividades'],
      informeImagenURL: json['potenciacion']['informeImagenURL']
    );
  }

  factory RestauracionForestalDto.fromRestauracionForestal(RestauracionForestal restauracionForestal){
    return RestauracionForestalDto(
      id: restauracionForestal.id, 
      fechaRegistro: restauracionForestal.fechaRegistro,
      codigoFicha: restauracionForestal.beneficiario.codigoFicha,
      cedulaBeneficiario: restauracionForestal.beneficiario.cedula,
      nombreBeneficiario: restauracionForestal.beneficiario.nombre,
      fechaLanzamiento: restauracionForestal.detalle.fechaLanzamiento,
      equipoGPS: restauracionForestal.detalle.equipoGPS,
      provincia: restauracionForestal.ubicacion.provincia,
      canton: restauracionForestal.ubicacion.canton,
      parroquia: restauracionForestal.ubicacion.parroquia,
      latitud: restauracionForestal.ubicacion.latitud,
      longitud: restauracionForestal.ubicacion.longitud,
      observaciones: restauracionForestal.ubicacion.observaciones,
      cantidadViveros: restauracionForestal.potenciacion.cantidad,
      actividades: restauracionForestal.potenciacion.actividades,
      informeImagenURL: restauracionForestal.potenciacion.informeImagenURL
    );
  }

  RestauracionForestal toRestauracionForestal(){
    return RestauracionForestal(
      id: id!, 
      fechaRegistro: fechaRegistro,
      beneficiario: RestauracionBeneficiario(cedula: cedulaBeneficiario, codigoFicha: codigoFicha, nombre: nombreBeneficiario), 
      detalle: RestauracionDetalle(equipoGPS: equipoGPS, fechaLanzamiento: fechaLanzamiento), 
      ubicacion: RestauracionUbicacion(
        provincia: provincia,
        canton: canton,
        parroquia: parroquia,
        latitud: latitud,
        longitud: longitud,
        observaciones: observaciones
      ),
      potenciacion: RestauracionPotenciacionViveros(actividades: actividades, cantidad: cantidadViveros, informeImagenURL: informeImagenURL)
    );
  }

  Map<String,dynamic> toMap(){
    return <String, dynamic>{
      'fechaRegistro': fechaRegistro,
      'beneficiario':{
        'codigoFicha': codigoFicha,
        'cedula': cedulaBeneficiario,
        'nombre': nombreBeneficiario
      },
      'detalle':{
        'fechaLanzamiento': fechaLanzamiento,
        'equipoGPS': equipoGPS
      },
      'ubicacion': {
        'provincia': provincia,
        'canton': canton,
        'parroquia': parroquia,
        'latitud': latitud,
        'longitud': longitud,
        'observaciones': observaciones
      },
      'potenciacion':{
        'cantidad': cantidadViveros,
        'actividades': actividades,
        'informeImagenURL': informeImagenURL
      }
    };
  }

}