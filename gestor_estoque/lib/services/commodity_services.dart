import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gestor_estoque/models/commodity.dart';

class CommodityServices {
  //obter uma referência (instância) do firebase (cloudfirestore)
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //método para persistir dados no firebase
  addCommodity(Commodity commodity) {
    _firestore.collection('commodities').add(commodity.toJson());
  }

  Stream<QuerySnapshot> getCommodities() {
    return _firestore.collection('commodities').orderBy('name').snapshots();
  }

  Future updateCommodity(Commodity commodity) async {
    return _firestore
        .collection('commodities')
        .doc(commodity.id)
        .set(commodity.toJson());
  }

  Future deleteCommodity(String id) async {
    return _firestore.collection('commodities').doc(id).delete();
  }
}
