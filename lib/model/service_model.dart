import 'package:flutter/cupertino.dart';

class ServiceModel with ChangeNotifier {
  final String? workerID;
  final String? imageURL;
  final String? ServiceName;
  final String? ServiceDes;
  final int? ServiceCharges;
  ServiceModel({
    this.workerID,
    this.imageURL,
    this.ServiceName,
    this.ServiceDes,
    this.ServiceCharges,
  });

  factory ServiceModel.fromMap(
      {required Map<String, dynamic> map, required String storyID}) {
    return ServiceModel(
      workerID: map["workerID"],
      imageURL: map["img"],
      ServiceCharges: map["serviceCharges"],
      ServiceDes: map['description'],
      ServiceName: map['serviceName'],
    );
  }
}
