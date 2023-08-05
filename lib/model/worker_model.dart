class CustomerModel {
  final String? userID;
  final bool? gender;
  final String? name;
  final String? contactNumber;
  final String? address;
  final String? experience;

  CustomerModel({
    this.userID,
    this.experience,
    this.name,
    this.gender,
    this.contactNumber,
    this.address,
  });
  factory CustomerModel.fromMap(
      {required Map<String, dynamic> map, required String userID}) {
    return CustomerModel(
      userID: userID,
      name: map["name"],
      gender: map["gender"],
      contactNumber: map["contact"],
      experience: map["experience"],
      address: map["address"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "gender": gender,
      "contact": contactNumber,
      "experience": experience,
      "address": address,
    };
  }
}
