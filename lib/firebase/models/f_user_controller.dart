import 'package:az_cash/firebase/models/f_user.dart';
import 'package:az_cash/ui/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';

class FUserController {
  static final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  static Future addUser(FUser user) async {
    _users.doc(user.email).set(user.toJson());
  }

  static Future<FUser> getUser(String email) async {
    var result = await _users.doc(email).get();
    FUser user = FUser.fromJson(result.data() as Map<String, dynamic>);

    return user;
  }

  static Future setDevice(String email) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    String model = androidInfo.model;
    String serie = androidInfo.id;

    AppData.device = model;
    AppData.deviceSerie = serie;

    _users.doc(email).update({
      "device": model,
      'deviceSerie': serie,
    });
  }

  static Future<bool> checkDevice(FUser user) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    String model = androidInfo.model;
    String serie = androidInfo.id;

    if (user.device != model || user.deviceSerie != serie) {
      return false;
    } else {
      return true;
    }
  }
}
