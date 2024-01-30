
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomap/domain/domain.dart';

class ControlForestalDto{
  String? id;
  DateTime fechaRegistro;
  String? nombrePropietario;
  String? provincia;
  String? canton;
  String? parroquia;
  String? convencional;
  String? celular;
  String? email;

  double? volumenMaderaRevisada;
  double? volumenMaderaRetenida;
  int? retencionEspecimenes;
  double? superficieIncendios;
  int? programas;

  int? propietarios;
  int? regentes;
  int? ejecutores;
  int? propietariosIndustrias;
  int? motosierristas;
  int? transportistasMadera;
  double? latitud;
  double? longitud;

  ControlForestalDto({
    this.id,
    required this.fechaRegistro,
    this.nombrePropietario,
    this.provincia,
    this.canton,
    this.parroquia,
    this.convencional,
    this.celular,
    this.email,
    this.volumenMaderaRevisada,
    this.volumenMaderaRetenida,
    this.retencionEspecimenes,
    this.superficieIncendios,
    this.programas,
    this.propietarios,
    this.regentes,
    this.ejecutores,
    this.propietariosIndustrias,
    this.motosierristas,
    this.transportistasMadera,
    this.latitud,
    this.longitud,
  });

  factory ControlForestalDto.fromMap(Map<String, dynamic> json){
    return ControlForestalDto(
      id: json['id'],
      fechaRegistro: (json['fechaRegistro'] as Timestamp).toDate().toLocal(),
      nombrePropietario: json['propietario']['nombre'],
      provincia: json['propietario']['provincia'],
      canton: json['propietario']['canton'],
      parroquia: json['propietario']['parroquia'],
      convencional: json['propietario']['convencional'],
      celular: json['propietario']['celular'],
      email: json['propietario']['email'],
      latitud: double.tryParse(json['propietario']['latitud']),
      longitud: double.tryParse(json['propietario']['longitud']),
      volumenMaderaRevisada: json['lineaBase']['volumenMaderaRevisada'],
      volumenMaderaRetenida: json['lineaBase']['volumenMaderaRetenida'],
      retencionEspecimenes: json['lineaBase']['retencionEspecimenes'],
      superficieIncendios: json['lineaBase']['superficieIncendios'],
      programas: json['lineaBase']['programas'],
      propietarios: json['poblacion']['propietarios'],
      regentes: json['poblacion']['regentes'],
      ejecutores: json['poblacion']['ejecutores'],
      propietariosIndustrias: json['poblacion']['propietariosIndustrias'],
      motosierristas: json['poblacion']['motosierristas'],
      transportistasMadera: json['poblacion']['transportistasMadera'], 
    );
  }

  factory ControlForestalDto.fromControlForestal(ControlForestal controlForestal){
    return ControlForestalDto(
      id: controlForestal.id,
      fechaRegistro: controlForestal.fechaRegistro,
      nombrePropietario: controlForestal.datosPropietario.nombre,
      provincia: controlForestal.datosPropietario.provincia,
      canton: controlForestal.datosPropietario.canton,
      parroquia: controlForestal.datosPropietario.parroquia,
      convencional: controlForestal.datosPropietario.convencional,
      celular: controlForestal.datosPropietario.celular,
      email: controlForestal.datosPropietario.email,
      volumenMaderaRevisada: controlForestal.lineaBase.volumenMaderaRevisada,
      volumenMaderaRetenida: controlForestal.lineaBase.volumenMaderaRetenida,
      retencionEspecimenes: controlForestal.lineaBase.retencionEspecimenes,
      superficieIncendios: controlForestal.lineaBase.superficieIncendios,
      programas: controlForestal.lineaBase.programas,
      propietarios: controlForestal.poblacion.propietarios,
      regentes: controlForestal.poblacion.regentes,
      ejecutores: controlForestal.poblacion.ejecutores,
      propietariosIndustrias: controlForestal.poblacion.propietariosIndustrias,
      motosierristas: controlForestal.poblacion.motosierristas,
      transportistasMadera: controlForestal.poblacion.transportistasMadera,
      latitud: controlForestal.datosPropietario.latitud,
      longitud: controlForestal.datosPropietario.longitud
    );
  }

  ControlForestal toControlForestal(){
    return ControlForestal(
      id: id,
      fechaRegistro: fechaRegistro, 
      datosPropietario: DatosPropietario(
        nombre: nombrePropietario,
        provincia: provincia,
        canton: canton,
        parroquia: parroquia,
        convencional: convencional,
        celular: celular,
        email: email,
        latitud: latitud,
        longitud: longitud,
      ), 
      lineaBase: LineaBase(
        volumenMaderaRevisada: volumenMaderaRevisada,
        volumenMaderaRetenida: volumenMaderaRetenida,
        superficieIncendios: superficieIncendios,
        retencionEspecimenes: retencionEspecimenes,
        programas: programas
      ), 
      poblacion: Poblacion(
        propietarios: propietarios,
        regentes: regentes,
        ejecutores: ejecutores,
        propietariosIndustrias: propietariosIndustrias,
        motosierristas: motosierristas,
        transportistasMadera: transportistasMadera,
      ));
  }

  Map<String,dynamic> toMap(){
    return <String, dynamic>{
      'fechaRegistro': fechaRegistro,
      'propietario': {
        'nombre': nombrePropietario,
        'provincia': provincia,
        'canton': canton,
        'parroquia': parroquia,
        'convencional': convencional,
        'celular': celular,
        'email': email,
        'latitud': latitud,
        'longitud': longitud
      },
      'lineaBase':{
        'volumenMaderaRevisada': volumenMaderaRevisada,
        'volumenMaderaRetenida': volumenMaderaRetenida,
        'retencionEspecimenes': retencionEspecimenes,
        'superficieIncendios': superficieIncendios,
        'programas': programas,
      },
      'poblacion':{
      'propietarios':propietarios,
      'regentes':regentes,
      'ejecutores':ejecutores,
      'propietariosIndustrias':propietariosIndustrias,
      'motosierristas':motosierristas,
      'transportistasMadera':transportistasMadera,     
      }
    };
  }
}