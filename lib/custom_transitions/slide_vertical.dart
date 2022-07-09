import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SlideVertical<T> extends PageRouteBuilder<T> {
  final Widget page;
  final ChangeNotifierProvider<ChangeNotifier?>? provider;
  /// provider for if you want to put provider for this specific page

  SlideVertical({required this.page, required super.settings, this.provider})
    : super(
        transitionDuration: const Duration(milliseconds: 700),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2){
          if (provider != null) return provider;
          return page;
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation1, Animation<double> animation2, Widget page) {
          final CurvedAnimation _curvedAnimation = CurvedAnimation(parent: animation1, curve: Curves.ease);
          return SlideTransition(
            child: page,
            position: Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero).animate(_curvedAnimation),
          );
        },
      );

}