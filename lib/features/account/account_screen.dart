import 'package:flutter/material.dart';
import 'package:omdbapp/core/theme/omdb_text_style.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Index 2: School', style: OMDBTextStyles.titleMedium),
      ),
    );
  }
}
