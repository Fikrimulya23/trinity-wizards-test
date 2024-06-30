import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trinity_wizards_test/screen1/models/screen1_model.dart';
import 'package:trinity_wizards_test/screen2/views/screen2_view.dart';

class Screen2Controller extends StatefulWidget {
  const Screen2Controller({
    super.key,
    required this.contactModel,
  });

  final ContactModel contactModel;

  @override
  State<Screen2Controller> createState() => _Screen2ControllerState();
}

class _Screen2ControllerState extends State<Screen2Controller> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  String id = "";
  @override
  void initState() {
    id = widget.contactModel.id!;
    firstNameController.text = widget.contactModel.firstName ?? "";
    lastNameController.text = widget.contactModel.lastName ?? "";
    emailController.text = widget.contactModel.email ?? "";
    /* dobController.text = (widget.contactModel.dob != null)
        ? DateFormat('dd MMMM yyyy')
            .format(DateTime.parse(widget.contactModel.dob.toString()))
        : DateTime.now().toString(); */
    dobController.text = widget.contactModel.dob ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Screen2View(
      contactModel: widget.contactModel,
      firstNameController: firstNameController,
      lastNameController: lastNameController,
      emailController: emailController,
      dobController: dobController,
      selectDate: selectDate,
    );
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        dobController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }
}
