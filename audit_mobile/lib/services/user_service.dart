import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<UserModel>> getUser(String email){
    try {
      return firestore
        .collection('users')
        .where('email',isEqualTo: email)
        .snapshots().map((QuerySnapshot list) {
          var result = list.docs.map<UserModel>((DocumentSnapshot user ){
            return UserModel.fromJson(user.data());
          }).toList();
          return result;
        });
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> addUser({
    required String email,
    required String username,
    required String name,
    required String roles,
    required String password,
  }) async {
    try {
      firestore.collection('users').add({
        'name': name,
        'username': username,
        'email': email,
        'password': password,
        'roles': roles,
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then((value) => print('success'));
    } catch (e) {
      throw Exception(e);
    }
  }
}