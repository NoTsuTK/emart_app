import 'package:emart_app/consts/consts.dart';

class FirestoreService {
  static getUser(uid) {
    return firestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  static getProducts(category) {
    return firestore
        .collection(productionCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }
}
