import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../model/worker_model.dart';

class WorkerController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  List<CustomerModel> _list = [];
  List<CustomerModel> get getList => _list;
  fetchData() async {
    await FirebaseFirestore.instance
        .collection("worker")
        .get()
        .then((QuerySnapshot snapshot) {
      _list = [];
      for (var documents in snapshot.docs) {
        Map<String, dynamic> dataMap = documents.data() as Map<String, dynamic>;
        _list.insert(0,
            CustomerModel.fromMap(map: dataMap, userID: documents.id.trim()));
      }
    });
    update();
  }

  CustomerModel getWorkerById(String userID) {
    fetchData();
    print(userID);
    return _list
        .firstWhere((element) => element.userID?.trim() == userID.trim());
  }

  CustomerModel getWorkerName(String name) {
    return _list.where((element) => element.name?.trim() == name.trim()).first;
  }
}
