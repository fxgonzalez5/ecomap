
class RestauracionForestal{
  String? id;
  RestauracionBeneficiario beneficiario;
  RestauracionDetalle detalle;
  RestauracionUbicacion ubicacion;
  RestauracionPotenciacionViveros potenciacion;

  RestauracionForestal({this.id, required this.beneficiario,required this.detalle, required this.ubicacion, required this.potenciacion});
}

class RestauracionBeneficiario{
  String? codigoFicha;
  String? cedula;
  String? nombre;

  RestauracionBeneficiario({this.codigoFicha, this.cedula, this.nombre});
}

class RestauracionDetalle{
  DateTime? fechaLanzamiento;
  String? equipoGPS;
  
  RestauracionDetalle({this.fechaLanzamiento, this.equipoGPS});
}

class RestauracionUbicacion{
  String? provincia;
  String? canton;
  String? parroquia;
  double? latitud;
  double? longitud;
  String? observaciones;

  RestauracionUbicacion({this.provincia, this.canton, this.parroquia, this.latitud, this.longitud, this.observaciones});
}

class RestauracionPotenciacionViveros{
  int? cantidad;
  String? actividades;
  String? informeImagenURL;
  RestauracionPotenciacionViveros({this.cantidad, this.actividades, this.informeImagenURL});
}