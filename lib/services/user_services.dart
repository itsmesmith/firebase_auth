import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo/debug_print.dart';
import 'package:demo/model/user_model.dart';

class UserServices {
  Future<void> createUser(UserModel userModel) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    final user = userModel.toJson();
    await docUser.set(user);
  }

  Stream<List<UserModel>> getAllUsers() {
    final allUsers = FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return UserModel.fromJson(doc.data());
      }).toList();
    });
    sPrint(allUsers);
    return allUsers;
  }

  Future<UserModel> checkFutureTheUserPresenceWithEmail(String email) async {
    final adminUserCollection = FirebaseFirestore.instance.collection('users');
    return await adminUserCollection.where('email', isEqualTo: email).get().then((querySnap) {
      return UserModel.fromJson(querySnap.docs.first.data());
    });
  }

  Future<UserModel> checkFutureTheUserPresenceWithMobileNumber(String mobile) async {
    final adminUserCollection = FirebaseFirestore.instance.collection('users');
    return await adminUserCollection.where('mobile', isEqualTo: mobile).get().then((querySnap) {
      return UserModel.fromJson(querySnap.docs.first.data());
    });
  }
}
