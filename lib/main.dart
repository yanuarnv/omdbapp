import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:omdbapp/app_bloc_observer.dart';
import 'package:omdbapp/core/router/omdb_router.dart';
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: OMDBTheme.darkTheme,
     routerConfig: OmdbRouter.router,
    );
  }
}