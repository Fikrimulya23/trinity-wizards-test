import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:trinity_wizards_test/main.dart';
import 'package:trinity_wizards_test/screen1/models/screen1_model.dart';
import 'package:trinity_wizards_test/screen1/views/screen1_view.dart';

class Screen1Controller extends StatefulWidget {
  const Screen1Controller({super.key});

  @override
  State<Screen1Controller> createState() => _Screen1ControllerState();
}

class _Screen1ControllerState extends State<Screen1Controller> {
  late List<ContactModel> listContacts = [];
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  bool isSearch = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1)).then((_) async {
      contactsProvider.initData(true);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      child: Consumer<ContactsProvider>(builder: (context, value, child) {
        contactsProvider = value;
        listContacts = contactsProvider.list;
        return Screen1View(
          listContactModel: listContacts,
        );
      }),
    );
  }
}
