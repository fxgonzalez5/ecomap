import 'package:ecomap/domain/domain.dart';

abstract class SocioBosqueBaseRepository{
  Future<List<SocioBosque>> getAll();
  Future<void> create(SocioBosque socioBosque);
  Future<void> update(SocioBosque socioBosque);
}