import 'package:chess_over/config/theme.dart';
import 'package:chess_over/routes/home/main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final MyTheme myTheme = MyTheme();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: myTheme.theme,
        debugShowCheckedModeBanner: false,
        home: const Home());
  }
}
