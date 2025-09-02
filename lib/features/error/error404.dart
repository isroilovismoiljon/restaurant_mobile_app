import 'package:flutter/material.dart';

class Error404 extends StatelessWidget {
  const Error404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.network("https://static.vecteezy.com/system/resources/previews/047/374/417/non_2x/404-error-page-not-found-business-concept-app-screen-modern-screen-template-mobile-app-vector.jpg"),),
    );
  }
}
