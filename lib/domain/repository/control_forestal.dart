import 'package:ecomap/domain/domain.dart';

abstract class ControlForestalBaseRepository{
  Future<List<ControlForestal>> getAll();
  Future<void> create(ControlForestal controlForestal);
  Future<void> update(ControlForestal controlForestal);
}