import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      builder: (context, widget) {
        if (!isLoggedIn()) {
          return HomePage();
        }
        return widget!;
      },
      routes: {
        '/': (context) => Obx(() => HomePage()),
        '/second': (context) => Obx(() => SecondPage()),
        '/thirdPage': (context) {
          if (isLoggedIn()) {
            return Obx(() => ThirdPage());
          } else {
            return HomePage();
          }
        },
        '/fourth': (context) => Obx(() => FourthPage()),
      },
    );
  }


  bool isLoggedIn() {
    bool check = false; // Set to true if the user is logged in

    if (check) {
      return true;
    } else {
      Get.offAll(() => Obx(() => HomePage()));
      return false;
    }
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.offAll(() => Obx(() => SecondPage()));
          },
          child: Text('Go to Second Page'),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.offAll(() => Obx(() => ThirdPage()));
          },
          child: Text('Go to Third Page'),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Page'),
      ),
      drawer: buildDrawer(context),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.offAll(() => Obx(() => FourthPage()));
          },
          child: Text('Go to Fourth Page'),
        ),
      ),
    );
  }
}

class FourthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pie Chart Example'),
      ),
      body: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(
            CurvedAnimation(
              parent: AlwaysStoppedAnimation(1),
              curve: Curves.linear,
            ),
          ),
          child: AnimatedPieChart(),
        ),
      ),
    );
  }
}

class AnimatedPieChart extends StatefulWidget {
  @override
  _AnimatedPieChartState createState() => _AnimatedPieChartState();
}

class _AnimatedPieChartState extends State<AnimatedPieChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 9),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * 3.14, // 360 degrees in radians
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 0,
              startDegreeOffset: 0,
              sections: [
                PieChartSectionData(
                  color: Colors.red,
                  value: 40,
                  title: '40%',
                  radius: 120,
                  titleStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffffffff),
                  ),
                ),
                PieChartSectionData(
                  color: Colors.green,
                  value: 30,
                  title: '30%',
                  radius: 120,
                  titleStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffffffff),
                  ),
                ),
                PieChartSectionData(
                  color: Colors.blue,
                  value: 30,
                  title: '20%',
                  radius: 120,
                  titleStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffffffff),
                  ),
                ),
                PieChartSectionData(
                  color: Colors.amber,
                  value: 30,
                  title: '10%',
                  radius: 120,
                  titleStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffffffff),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('App Drawer'),
        ),
        ListTile(
          title: Text('Home'),
          onTap: () {
            Get.toNamed('/');
          },
        ),
        ListTile(
          title: Text('Second Page'),
          onTap: () {
            Get.toNamed('/second');
          },
        ),
        ListTile(
          title: Text('Third Page'),
          onTap: () {
            Get.toNamed('/thirdPage');
          },
        ),
        ListTile(
          title: Text('Fourth Page'),
          onTap: () {
            Get.toNamed('/fourth');
          },
        ),
      ],
    ),
  );
}
