import 'package:flutter/material.dart';

class TransitionUtil {
  static Widget buildWhiteOutTransition(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final color = ColorTween(
      begin: Colors.transparent,
      end: Colors.white,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: const Interval(0, 0.5, curve: Curves.easeInOut),
      ),
    );

    final opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: const Interval(0.5, 1, curve: Curves.easeInOut),
      ),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) {
        return Container(
          color: color.value,
          child: Opacity(
            opacity: opacity.value,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}