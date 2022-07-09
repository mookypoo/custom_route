import 'package:custom_route_transition/custom_transitions/slide_vertical.dart';
import 'package:custom_route_transition/screens.dart';
import 'package:flutter/material.dart';

import 'custom_transitions/fade.dart';
import 'custom_transitions/rotation.dart';
import 'custom_transitions/rotation_popup.dart';
import 'custom_transitions/slide_horizontal.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(fontSize: 19.0)),
          )
        ),
      ),
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == Screen1.routeName) {
          return SlideVertical(
            page: const Screen1(),
            settings: RouteSettings(name: Screen1.routeName),
          );
        }
        if (settings.name == Screen2.routeName) {
          final String? _text = settings.arguments.toString();
          return SlideHorizontal(
            page: Screen2(text: _text),
            settings: RouteSettings(name: Screen2.routeName, arguments: _text),
          );
        }
        if (settings.name == Screen3.routeName) {
          return Fade(
            page: const Screen3(),
            settings: RouteSettings(name: Screen3.routeName),
          );
        }
        if (settings.name == Screen4.routeName) {
          return Rotation(
            page: const Screen4(),
            settings: RouteSettings(name: Screen4.routeName),
          );
        }
        if (settings.name == PopUp.routeName) {
          return RotationPopUp(
            page: const PopUp(),
            settings: RouteSettings(name: PopUp.routeName),
          );
        }
      },
      home: Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              child: const Text("slide vertically"),
              onPressed: () async => await Navigator.of(context).pushNamed(Screen1.routeName),
            ),
            TextButton(
              child: Text("slide horizontally & pass String Hello"),
              onPressed: () async => await Navigator.of(context).pushNamed(Screen2.routeName, arguments: "Hello"),
            ),
            TextButton(
              child: Text("slide horizontally & pass String Bye"),
              onPressed: () async => await Navigator.of(context).pushNamed(Screen2.routeName, arguments: "Bye"),
            ),
            TextButton(
              child: Text("fade"),
              onPressed: () async => await Navigator.of(context).pushNamed(Screen3.routeName, arguments: "Bye"),
            ),
            TextButton(
              child: Text("rotation"),
              onPressed: () async => await Navigator.of(context).pushNamed(Screen4.routeName, arguments: "Bye"),
            ),
            TextButton(
              child: Text("pop up dialog"),
              onPressed: () async => await Navigator.of(context).pushNamed(PopUp.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
