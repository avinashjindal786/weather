import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

import '../../models/user_model.dart';

class UserProvider extends BaseViewModel {
  final firestore = FirebaseFirestore.instance;

  UserModel? loggedinUser;
  UserModel? get userData => loggedinUser;

  setUserModel(UserModel model) {
    loggedinUser = model;
    notifyListeners();
  }

  getUserData() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    final val = instance.getString("user");
    if (val != null) {
      final data = await firestore.collection("users").doc(val).get();
      setUserModel(UserModel.fromJson(data.data() ?? {}));
    }
  }
}
