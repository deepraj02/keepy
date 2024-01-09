import 'package:flutter/material.dart';
import 'package:supabase_test_app/src/settings/settings_controller.dart';
import 'package:supabase_test_app/src/shared/styles.dart';

import '../../home/presentation/home.page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';
  const LoginPage({
    super.key,
    required this.settingsController,
  });
  final SettingsController settingsController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Login",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 26)),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blue.shade50),
                    ),
                    child: TextFormField(
                      controller: emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        prefixIcon: const Icon(Icons.email),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.white70,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.white70),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 12.0, color: Colors.blueGrey.shade300),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.blue.shade50),
                    ),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        prefixIcon: const Icon(Icons.lock),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            color: Colors.white70,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.white70),
                        ),
                        hintStyle: TextStyle(
                            fontSize: 12.0, color: Colors.blueGrey.shade300),
                        contentPadding: const EdgeInsets.all(12),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                    settingsController:
                                        widget.settingsController,
                                  )));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: 360,
                      decoration: BoxDecoration(
                        color: Colors.purpleAccent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: RichText(
                      text: TextSpan(children: <InlineSpan>[
                        TextSpan(
                          text: "Already have an account?",
                          style: TextStyle(
                              color: Colors.blueGrey.shade300,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        TextSpan(
                          text: ' ',
                          style: TextStyle(
                              color: Colors.indigo.shade300,
                              fontSize: 12,
                              fontWeight: FontWeight.w700),
                        ),
                        TextSpan(
                          text: "SignUp",
                          style: TextStyle(
                            color: CrudSupabaseColors.purpleAccent,
                            fontSize: CrudSupabaseTextStyles.minFontSize,
                            fontFamily: CrudSupabaseTextStyles.fontFamily,
                            fontWeight: CrudSupabaseTextStyles.fontWeight,
                          ),
                        )
                      ]),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
