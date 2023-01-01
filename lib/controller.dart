import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class Controller extends GetxController {
  var temp = 0.obs;
  var psi = 0.obs;
  var rpm = 0.obs;

  DatabaseReference database = FirebaseDatabase.instance.ref('engine');

  @override
  void onReady() {
    getData();
    super.onReady();
  }

  void getData() {
    database.onValue.listen((event) {
      final data = event.snapshot.value as Map<dynamic, dynamic>;
      temp.value = data["temp"];
      psi.value = data["psi"];
      rpm.value = data["RPM"];
    });
  }
}
