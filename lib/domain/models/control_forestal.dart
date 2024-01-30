
class ControlForestal{
  String? id;
  DateTime fechaRegistro;
  DatosPropietario datosPropietario;
  LineaBase lineaBase;
  Poblacion poblacion;

  ControlForestal({
    this.id,
    required this.fechaRegistro,
    required this.datosPropietario,
    required this.lineaBase,
    required this.poblacion
  });

}

class DatosPropietario{
  String? nombre;
  String? provincia;
  String? canton;
  String? parroquia;
  String? convencional;
  String? celular;
  String? email;
  double? latitud;
  double? longitud;

  DatosPropietario({
    this.nombre,
    this.provincia,
    this.canton,
    this.parroquia,
    this.convencional,
    this.celular,
    this.email,
    this.latitud,
    this.longitud
  });
}

class LineaBase{
  double? volumenMaderaRevisada;
  double? volumenMaderaRetenida;
  int? retencionEspecimenes;
  double? superficieIncendios;
  int? programas;

  LineaBase({
    this.volumenMaderaRevisada,
    this.volumenMaderaRetenida,
    this.retencionEspecimenes,
    this.superficieIncendios,
    this.programas,
  });
}

class Poblacion{
  int? propietarios;
  int? regentes;
  int? ejecutores;
  int? propietariosIndustrias;
  int? motosierristas;
  int? transportistasMadera;

  Poblacion({
    this.propietarios,
    this.regentes,
    this.ejecutores,
    this.propietariosIndustrias,
    this.motosierristas,
    this.transportistasMadera,
  });
}