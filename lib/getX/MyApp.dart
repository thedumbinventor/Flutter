import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class DialogController extends GetxController {
  // Add any necessary properties and methods for your dialog state.
}

class MyApp extends StatelessWidget {
  final DialogController dialogController = Get.put(DialogController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX Dialog Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Get.defaultDialog(
                title: 'Dialog Title',
                content: GetX<DialogController>(
                  builder: (controller) {
                    return Column(
                      children: [
                        Text('Dialog content goes here'),
                        ElevatedButton(
                          onPressed: () {
                            Get.back(); // Close the dialog
                          },
                          child: Text('Close Dialog'),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
            child: Text('Show Dialog'),
          ),
        ),
      ),
    );
  }
}
