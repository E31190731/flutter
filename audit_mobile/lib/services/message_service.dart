import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addMessage({
    required String message,
    required bool isFromUser,
  }) async {
    try {
      firestore.collection('message').add({
        'message': message,
        'isFromUser': isFromUser,
        'createdAt': DateTime.now().toString(),
        'updatedAt': DateTime.now().toString(),
      }).then((value) => print('success'));
    } catch (e) {
      throw Exception(e);
    }
  }
}