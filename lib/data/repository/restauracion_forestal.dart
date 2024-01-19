
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomap/data/data.dart';
import 'package:ecomap/domain/domain.dart';

class RestuaracionForestalRepository extends RestauracionForestalBaseRepository{
  final _db = FirebaseFirestore.instance;
  final _nameCollection = "restauracionForestal";
  
  @override
  Future<void> create(RestauracionForestal restauracionForestal)async{
    await _db.collection(_nameCollection).add(RestauracionForestalDto.fromRestauracionForestal(restauracionForestal).toMap());
  }
  
  @override
  Future<List<RestauracionForestal>> getAll() async{
    final data = await _db.collection(_nameCollection).get();
    List<RestauracionForestal> list = [];
    for (var json in data.docs) {
      final map = json.data();
      map['id'] = json.id;
      list.add(RestauracionForestalDto.fromMap(map).toRestauracionForestal());
    }

    return list;
  }
  
  @override
  Future<void> update(RestauracionForestal restauracionForestal) {
    // TODO: implement update
    throw UnimplementedError();
  }


}