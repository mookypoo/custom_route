import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);
  static const String routeName = "/screen1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("from bottom to top"),),
    );
  }
}

class Screen2 extends StatelessWidget {
  const Screen2({Key? key, required this.text}) : super(key: key);
  static const String routeName = "/screen2";
  final String? text;

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)?.settings.arguments);
    print(ModalRoute.of(context)?.settings.name);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(text ?? "Did not receive any arguments?!?!"),)
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);
  static const String routeName = "/screen3";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("fade transition"),),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);
  static const String routeName = "/screen4";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("rotation transition"),),
    );
  }
}
class PopUp extends StatelessWidget {
  const PopUp({Key? key}) : super(key: key);
  static const String routeName = "/popup";

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Center(child: Text("like modal popup dialogs"),),
      ),
    );
  }
}