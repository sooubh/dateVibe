import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save User Data
  Future<void> saveUser(User user, Map<String, dynamic> additionalData) async {
    try {
      await _db.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'createdAt': FieldValue.serverTimestamp(),
        ...additionalData,
      }, SetOptions(merge: true));
    } catch (e) {
      print("Error saving user: $e");
      throw e;
    }
  }

  // Get User Data
  Future<DocumentSnapshot> getUser(String uid) async {
    return await _db.collection('users').doc(uid).get();
  }

  // Update User Data
  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    try {
      await _db.collection('users').doc(uid).set(data, SetOptions(merge: true));
    } catch (e) {
      print("Error updating user: $e");
      throw e;
    }
  }

  // Get Matches
  Stream<QuerySnapshot> getMatches(String uid) {
    return _db
        .collection('users')
        .doc(uid)
        .collection('matches')
        .orderBy('timestamp', descending: true)
        .snapshots();
  }
}
