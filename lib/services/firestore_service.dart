import 'package:emart_app/consts/consts.dart';

class FirestoreService {
  static getUser(uid) {
    return firestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
