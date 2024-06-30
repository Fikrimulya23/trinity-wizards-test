import 'package:flutter/material.dart';
import 'package:trinity_wizards_test/color.dart';
import 'package:trinity_wizards_test/screen1/models/screen1_model.dart';
import 'package:trinity_wizards_test/screen2/controllers/screen2_controller.dart';

class Screen1View extends StatelessWidget {
  const Screen1View({
    super.key,
    required this.listContactModel,
  });

  final List<ContactModel> listContactModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            //
          },
          icon: Icon(
            Icons.search,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Screen2Controller();
                },
              ));
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: mainColor,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Contact",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        itemCount: listContactModel.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Screen2Controller(
                      contactModel: listContactModel[index],
                    );
                  },
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black.withOpacity(0.1),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    size: 60,
                    color: mainColor,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    listContactModel[index].firstName!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
