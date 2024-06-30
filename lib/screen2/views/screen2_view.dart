import 'package:flutter/material.dart';
import 'package:trinity_wizards_test/color.dart';
import 'package:trinity_wizards_test/screen1/models/screen1_model.dart';

class Screen2View extends StatelessWidget {
  const Screen2View({
    super.key,
    required this.contactModel,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.dobController,
    required this.selectDate,
  });

  final ContactModel contactModel;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController dobController;

  final Function(BuildContext) selectDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            // color: Colors.grey,
            child: Center(
              child: Text("Cancel"),
            ),
          ),
        ),
        leadingWidth: 75,
        actions: [
          GestureDetector(
            onTap: () {
              //
            },
            child: Container(
              width: 75,
              // color: Colors.grey,
              child: Center(
                child: Text("Save"),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: mainColor,
        surfaceTintColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Divider(
            height: 1,
            color: Colors.black.withOpacity(0.1),
          ),
        ),
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
        children: [
          Icon(
            Icons.circle,
            size: 160,
            color: mainColor,
          ),
          _titleContainer("Main Information"),
          Divider(
            height: 0,
          ),
          _textFieldContainer("First Name", firstNameController, context),
          _textFieldContainer("Last Name", lastNameController, context),
          _titleContainer("Sub Information"),
          Divider(
            height: 0,
          ),
          _textFieldContainer("Email", emailController, context),
          _textFieldContainer("DOB", dobController, context,
              isDatePicker: true),
        ],
      ),
    );
  }

  Container _titleContainer(String title) {
    return Container(
      color: Colors.grey.shade100,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _textFieldContainer(
      String title, TextEditingController controller, BuildContext context,
      {bool isDatePicker = false}) {
    return Container(
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.fromLTRB(0, 12, 16, 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        children: [
          Container(width: 150, child: Text(title)),
          (!isDatePicker)
              ? Expanded(
                  child: SizedBox(
                    // height: 40,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                )
              : Expanded(
                  child: SizedBox(
                    // height: 40,
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        suffixIcon: Icon(Icons.date_range),
                      ),
                      readOnly: true,
                      onTap: () => selectDate(context),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
