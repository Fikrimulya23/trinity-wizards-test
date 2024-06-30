import 'dart:convert';

class ContactModel {
  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? dob;

  ContactModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.dob,
  });

  factory ContactModel.fromRawJson(String str) =>
      ContactModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        dob: json["dob"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "dob": dob,
      };
}
