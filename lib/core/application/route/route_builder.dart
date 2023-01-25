import 'package:flutter/cupertino.dart';

class DefaultRouteBuilder extends PageRouteBuilder {
  DefaultRouteBuilder({required pageBuilder})
      : super(
            pageBuilder: pageBuilder,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              final tween = Tween(begin: begin, end: end);
              final offsetAnimation = animation.drive(tween);
              return SlideTransition(
                position: offsetAnimation,
                child: child,
              );
            });
}
