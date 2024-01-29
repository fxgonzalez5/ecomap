
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomap/data/data.dart';
import 'package:ecomap/data/dto/control_forestal.dart';
import 'package:ecomap/domain/domain.dart';

class ControlForestalRepository extends ControlForestalBaseRepository{
  final _db = FirebaseFirestore.instance;
  final _nameCollection = "controlForestal";
  
  @override
  Future<void> create(ControlForestal controlForestal)async{
    await _db.collection(_nameCollection).add(ControlForestalDto.fromControlForestal(controlForestal).toMap());
  }
  
  @override
  Future<List<ControlForestal>> getAll() async{
    final data = await _db.collection(_nameCollection).get();
    List<ControlForestal> list = [];
    for (var json in data.docs) {
      final map = json.data();
      map['id'] = json.id;
      list.add(ControlForestalDto.fromMap(map).toControlForestal());
    }

    return list;
  }
  
  @override
  Future<void> update(ControlForestal controlForestal) async {
    await _db.collection(_nameCollection).doc(controlForestal.id).update(ControlForestalDto.fromControlForestal(controlForestal).toMap());
  }


}