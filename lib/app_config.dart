import 'package:flutter/widgets.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    required this.appName,
    required this.flavorName,
    required Widget child,
  }) : super(child: child);

  final String appName;
  final String flavorName;

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    // We don't need to rebuild the widget when data changes, so we return false.
    return false;
  }
}
