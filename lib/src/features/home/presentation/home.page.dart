import 'package:flutter/material.dart';
import 'package:supabase_test_app/src/features/auth/presentation/login.page.dart';
import 'package:supabase_test_app/src/settings/settings_controller.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage(
                            settingsController: widget.settingsController,
                          )));
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  widget.settingsController.updateThemeMode(
                      widget.settingsController.themeMode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light);
                });
              },
              icon: Icon(
                widget.settingsController.themeMode == ThemeMode.light
                    ? Icons.dark_mode_rounded
                    : Icons.light_mode_rounded,
              ),
            ),
          ]),
    );
  }
}