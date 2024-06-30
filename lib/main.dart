import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:trinity_wizards_test/screen1/controllers/screen1_controller.dart';
import 'package:trinity_wizards_test/screen1/models/screen1_model.dart';

ContactsProvider contactsProvider = ContactsProvider();

void main() {
  var _listProviders = <SingleChildStatelessWidget>[];

  _listProviders.addAll([
    ChangeNotifierProvider<ContactsProvider>(
      create: (context) => ContactsProvider(),
    ),
  ]);
  runApp(MultiProvider(providers: _listProviders, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Screen1Controller(),
    );
  }
}
