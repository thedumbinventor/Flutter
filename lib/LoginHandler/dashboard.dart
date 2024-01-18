import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('hello'),
        ),
        drawer: Drawer(
          backgroundColor: const Color(0xff17354F),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image.asset('assets/Login illustration.png', height: MediaQuery.of(context).size.height * 0.35),
                const Divider(),
                ListTile(
                  title: const Text(
                    ' OPERATORS',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    ' PAGE',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    ' DEVICES',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    ' EDGE',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    ' SYSTEM',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    // controller.backgroundText.value = 'Item 5';
                  },
                ),
              ],
            ),
          ),
        ),

    );
  }
}
