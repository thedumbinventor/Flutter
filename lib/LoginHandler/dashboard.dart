import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qmsadminflutter/LoginHandler/LoginScreen.dart';

void main() {
  runApp(const LoginScreen());
}

class DashboardController extends GetxController {

  RxString backgroundText = 'Dashboard'.obs;
}

class Dashboard extends StatelessWidget {
  final DashboardController controller = Get.put(DashboardController());
  //  Obx(() => Text(controller.backgroundText.value)),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('hello'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Handle item 1 tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Handle item 2 tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 3'),
              onTap: () {
                // Handle item 3 tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 4'),
              onTap: () {
                // Handle item 4 tap
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 5'),
              onTap: () {
                // Handle item 5 tap
                Navigator.pop(context);
                controller.backgroundText.value = 'Item 5';
              },
            ),
          ],
        ),
      ),
    );
  }
}
