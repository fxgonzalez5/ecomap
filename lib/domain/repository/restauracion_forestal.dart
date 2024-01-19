

import 'package:ecomap/domain/domain.dart';

abstract class RestauracionForestalBaseRepository{
  Future<List<RestauracionForestal>> getAll();
  Future<void> create(RestauracionForestal restauracionForestal);
  Future<void> update(RestauracionForestal restauracionForestal);
}