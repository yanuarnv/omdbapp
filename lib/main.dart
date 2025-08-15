import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:omdbapp/core/theme/omdb_theme.dart';
import 'package:omdbapp/features/home/presentation/pages/main_screen.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: OMDBTheme.darkTheme,
      home: MainScreen(),
    );
  }
}