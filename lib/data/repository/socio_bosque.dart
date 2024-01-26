
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomap/data/data.dart';
import 'package:ecomap/domain/domain.dart';

class SocioBosqueRepository extends SocioBosqueBaseRepository{
  final _db = FirebaseFirestore.instance;
  final _nameCollection = "socioBosque";
  
  @override
  Future<void> create(SocioBosque socioBosque)async{
    await _db.collection(_nameCollection).add(SocioBosqueDto.fromSocioBosque(socioBosque).toMap());
  }
  
  @override
  Future<List<SocioBosque>> getAll() async{
    final data = await _db.collection(_nameCollection).get();
    List<SocioBosque> list = [];
    for (var json in data.docs) {
      final map = json.data();
      map['id'] = json.id;
      list.add(SocioBosqueDto.fromMap(map).toSocioBosque());
    }

    return list;
  }
  
  @override
  Future<void> update(SocioBosque socioBosque) async {
    await _db.collection(_nameCollection).doc(socioBosque.id).update(SocioBosqueDto.fromSocioBosque(socioBosque).toMap());
  }

}