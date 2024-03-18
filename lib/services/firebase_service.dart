import 'package:birthday_app/app/models/child_model.dart';
import 'package:birthday_app/models/user_model.dart';
import 'package:birthday_app/services/firebase_consts.dart';
import 'package:birthday_app/services/firebase_instance.dart';
import 'package:birthday_app/static_data.dart';
import 'package:birthday_app/utils/sharepreference_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final FirebaseInstance _firebaseInstance = FirebaseInstance();

  static getUser(String uuid) async {
    return _firebaseInstance.firestore
        .collection(users)
        .doc(uuid)
        .get()
        .then((value) async {
      final UserModel usermodel = UserModel.fromMap(value.data()!);

      await SharedPreferencesHelper.saveUserInfo(usermodel, uuid);
    });
  }

  static logout() async {
    await _firebaseInstance.auth.signOut();
    SharedPreferencesHelper.remove(SharedPreferencesHelper.user_model_pred);
    SharedPreferencesHelper.remove(SharedPreferencesHelper.uuid_pref);
    SharedPreferencesHelper.remove(SharedPreferencesHelper.selectLanguage_pred);
    StaticData.uuid = null;
    StaticData.userModel = null;
  }

  static addChild(ChildDataModel model) async {
    await _firebaseInstance.firestore
        .collection(users)
        .doc(StaticData.uuid)
        .collection(child)
        .add(model.toJson());
  }

  static Future<QuerySnapshot> getChild() async {
    return await _firebaseInstance.firestore
        .collection(users)
        .doc(StaticData.uuid)
        .collection(child)
        .get();
  }
}
