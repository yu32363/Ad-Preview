import 'package:flutter/material.dart';

import 'main_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(AdPreview());
}

class AdPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: MainPage(),
    );
  }
}
