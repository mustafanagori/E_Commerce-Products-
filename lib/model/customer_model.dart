class CustomerModel {
  final String? userID;
  final bool? gender;
  final String? name;
  final String? contact;
  final String? address;

  CustomerModel({
    this.userID,
    this.name,
    this.gender,
    this.contact,
    this.address,
  });
  factory CustomerModel.fromMap(
      {required Map<String, dynamic> map, required String userID}) {
    return CustomerModel(
      userID: userID,
      name: map["name"],
      gender: map["gender"],
      contact: map["contact"],
      address: map["address"],
    );
  }
}
