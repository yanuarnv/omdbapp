import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:omdbapp/app_bloc_observer.dart';
import 'package:omdbapp/core/theme/omdb_theme.dart';
import 'package:omdbapp/features/home/presentation/pages/main_screen.dart';

import 'core/di/injection.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  configureDependencies();
  Bloc.observer = AppBlocObserver();
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