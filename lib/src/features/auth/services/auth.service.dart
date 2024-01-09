import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_test_app/src/shared/constants.dart';

import 'iauth.service.dart';

class AuthServiceImpl implements IAuthService {
  final supabase = ProjectConstants.supaInstance;
  @override
  Future<void> logIn(String email, String password) async {
    {
      try {
        await supabase.auth.signInWithPassword(
          password: password,
          email: email,
        );
      } on AuthException catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  @override
  Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  @override
  Future<void> signUp(String email, String password, String userName) async {
    try {
      await supabase.auth.signUp(
        password: password,
        email: email,
        data: {
          'username': userName,
        },
      );
    } on AuthException catch (e) {
      debugPrint(e.toString());
    }
  }
}
