import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

CustomTransitionPage buildPageWithRightToLeftTransition(
    BuildContext context,
    GoRouterState state,
    Widget child,
    ) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
        position: Tween<Offset>(
          begin: Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}
