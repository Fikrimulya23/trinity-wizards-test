import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class ContactsProvider with ChangeNotifier {
  List<ContactModel> _list = [];
  List<ContactModel> get list => _list;

  initData(bool initData) async {
    if (initData) {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = await jsonDecode(response);

      for (int i = 0; i < data.length - 1; i++) {
        _list.add(ContactModel.fromJson(data[i]));
      }
      notifyListeners();
    }
  }

  addData(ContactModel contactModel) {
    _list.add(contactModel);
    notifyListeners();
  }

  updateData(ContactModel contactModel) {
    int index = _list.indexWhere((item) => item.id == contactModel.id);
    _list[index] = contactModel;
    notifyListeners();
  }
}
