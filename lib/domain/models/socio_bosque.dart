
class SocioBosque{
  String? id;
  DateTime fechaRegistro;
  String? tipoSocio;
  String? tipoCapitulo;
  SocioDatosGenerales datosGenerales;
  SocioNotificaciones notificaciones;
  SocioContacto contacto;
  SocioCuenta cuenta;
  SocioSocioEconomico socioEconomico;
  SocioUbicacionPredio ubicacionPredio;
  SocioLinderoPredio linderoPredio;
  SocioRegistroPropiedad registroPropiedad;
  SocioAdquisicionPredio adquisicionPredio;

  SocioBosque({
    this.id,
    required this.fechaRegistro,
    this.tipoSocio,
    this.tipoCapitulo,
    required this.datosGenerales,
    required this.notificaciones,
    required this.contacto,
    required this.cuenta,
    required this.socioEconomico,
    required this.ubicacionPredio,
    required this.linderoPredio,
    required this.registroPropiedad,
    required this.adquisicionPredio,
  });
}

class SocioDatosGenerales{
  String? ruc;
  String? representante;
  String? registro;
  DateTime? fechaPersonaJuidica;
  String? etnia;
  bool? vivenEnElPredio;

  SocioDatosGenerales({
    this.ruc,
    this.representante,
    this.registro,
    this.fechaPersonaJuidica,
    this.etnia,
    this.vivenEnElPredio
  });
}

class SocioNotificaciones{
  String? direccion;
  String? provincia;
  String? canton;
  String? parroquia;
  String? comunidad;
  String? convencional;
  String? celular;
  String? email;

  SocioNotificaciones({
    this.direccion,
    this.provincia,
    this.canton,
    this.parroquia,
    this.comunidad,
    this.convencional,
    this.celular,
    this.email
  });
}

class SocioContacto{
  String? nombre;
  String? cargo;
  String? telefono;
  
  SocioContacto({
    this.nombre,
    this.cargo,
    this.telefono
  });
}

class SocioCuenta{
  String? tipo;
  String? institucion;
  String? numero;

  SocioCuenta({
    this.tipo,
    this.institucion,
    this.numero
  });
}

class SocioSocioEconomico{
  int? beneficiarios;
  int? familias;
  int? menores;
  int? hombres;
  int? mujeres;
  bool? discapacitados;
  int? cantidadDiscapacitados;
  List<SocioActividad> actividades;
  double? promedioIngreso;

  SocioSocioEconomico({
    this.beneficiarios,
    this.familias,
    this.menores,
    this.hombres,
    this.mujeres,
    this.discapacitados,
    this.cantidadDiscapacitados,
    required this.actividades,
    this.promedioIngreso
  });
}

class SocioActividad{
  String? nombre;
  String? descripcion;

  SocioActividad({this.nombre, this.descripcion});
}

class SocioUbicacionPredio{
  double? latitud;
  double? longitud;
  String? superficie;
  String? superficieConservar;
  String? descripcion;
  
  SocioUbicacionPredio({
    this.latitud,
    this.longitud,
    this.superficie,
    this.superficieConservar,
    this.descripcion,
  });
}

class SocioLinderoPredio{
  String? norte;
  String? sur;
  String? este;
  String? oeste;

  SocioLinderoPredio({
    this.norte,
    this.sur,
    this.este,
    this.oeste,
  });
}

class SocioRegistroPropiedad{
  String? numero;
  DateTime? fecha;

  SocioRegistroPropiedad({
    this.numero,
    this.fecha,
  });
}

class SocioAdquisicionPredio{
  String? forma;
  DateTime? fecha;
  String? institucion;
  String? observaciones;

  SocioAdquisicionPredio({
    this.forma,
    this.fecha,
    this.institucion,
    this.observaciones,
  });

}

class SocioGravamen{
  bool? poseeGravamen;
  String? tipo;
  String? institucion;
  bool? hipoteca;
}

class SocioAdicionales{

}

class SocioSuelo{
  
}