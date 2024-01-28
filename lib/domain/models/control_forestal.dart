
class ControlForestal{
  String? id;
  _DatosPropietario datosPropietario;
  _LineaBase lineaBase;
  _Poblacion poblacion;

  ControlForestal({
    this.id,
    required this.datosPropietario,
    required this.lineaBase,
    required this.poblacion
  });
}

class _DatosPropietario{
  String? nombre;
  String? provincia;
  String? canton;
  String? parroquia;
  String? convencional;
  String? celular;
  String? email;

  _DatosPropietario({
    this.nombre,
    this.provincia,
    this.canton,
    this.parroquia,
    this.convencional,
    this.celular,
    this.email,
  });
}

class _LineaBase{
  double? volumenMaderaRevisada;
  double? volumenMaderaRetenida;
  int? retencionEspecimenes;
  double? superficieIncendios;
  int? programas;

  _LineaBase({
    this.volumenMaderaRevisada,
    this.volumenMaderaRetenida,
    this.retencionEspecimenes,
    this.superficieIncendios,
    this.programas,
  });
}

class _Poblacion{
  int? propietarios;
  int? regentes;
  int? ejecutores;
  int? propietariosIndustrias;
  int? motosierristas;
  int? transportistasMadera;

  _Poblacion({
    this.propietarios,
    this.regentes,
    this.ejecutores,
    this.propietariosIndustrias,
    this.motosierristas,
    this.transportistasMadera,
  });
}