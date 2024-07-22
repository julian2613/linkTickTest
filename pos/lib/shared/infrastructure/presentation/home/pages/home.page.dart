import 'package:flutter/material.dart';
import 'package:pos/shared/infrastructure/presentation/vertical_menu/pages/vertical_menu.page.dart';

class HomePage extends StatelessWidget {
  final Widget child;

  const HomePage({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(),
      drawer: const VerticalMenuPage(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: size.width * 0.05,
        ),
        child: child,
      ),
    );
  }
}
