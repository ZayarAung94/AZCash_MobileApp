import 'package:az_cash/ui/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAppData {
  final CollectionReference appData =
      FirebaseFirestore.instance.collection("appData");

  Future checkUpdate() async {
    var data = await appData.doc('appData').get();
    Map<String, dynamic> appdata = data.data() as Map<String, dynamic>;

    double onlineVersion = appdata['version'];

    if (onlineVersion > AppData.version) {
      AppData.isUpdate = true;
    }
  }
}
