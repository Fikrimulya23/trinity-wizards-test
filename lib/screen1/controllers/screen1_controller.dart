import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trinity_wizards_test/screen1/models/screen1_model.dart';
import 'package:trinity_wizards_test/screen1/views/screen1_view.dart';

class Screen1Controller extends StatefulWidget {
  const Screen1Controller({super.key});

  @override
  State<Screen1Controller> createState() => _Screen1ControllerState();
}

class _Screen1ControllerState extends State<Screen1Controller> {
  Future<List<ContactModel>> getData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await jsonDecode(response);
    List<ContactModel> listContactModel = [];

    for (int i = 0; i < data.length - 1; i++) {
      listContactModel.add(ContactModel.fromJson(data[i]));
    }
    // log(listContactModel[data.length - 1].toJson().toString());
    return listContactModel;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ContactModel>>(
      future: getData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 3,
              color: Colors.white,
              backgroundColor: Colors.grey,
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          // return _loadingContainer();
        }
        if (snapshot.hasData) {
          return Screen1View(
            listContactModel: snapshot.data!,
          );
        }
        if (snapshot.hasError) {
          // return _errorContainer(snapshot.data.toString());
        }
        return const SizedBox();
      },
    );
  }
}
