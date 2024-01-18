import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class DialogController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
}

class MyApp extends StatelessWidget {
  final DialogController dialogController = DialogController();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final DialogController dialogController = Get.put(DialogController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX Dialog Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Show the dialog when the button is pressed
            Get.defaultDialog(
              title: 'Dialog Title',
              content: Column(
                children: [
                  TextField(
                    controller: dialogController.titleController,
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    controller: dialogController.contentController,
                    decoration: InputDecoration(labelText: 'Content'),
                  ),
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    // Close the dialog
                    Get.back();
                  },
                  child: Text('Close'),
                ),
              ],
            );
          },
          child: Text('Show Dialog'),
        ),
      ),
    );
  }
}
