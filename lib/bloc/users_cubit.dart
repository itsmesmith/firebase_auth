import 'package:bot_toast/bot_toast.dart';
import 'package:demo/commonWidgets/landing_page.dart';
import 'package:demo/debug_print.dart';
import 'package:demo/model/user_model.dart';
import 'package:demo/services/user_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<UserModel> {
  AuthCubit() : super(UserModel());
  final uS = UserServices();
  Future<void> createUser({required UserModel userModel, required BuildContext context, required String password}) async {
    BotToast.showLoading();
    try {
      uS.createUser(userModel);
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userModel.email!,
        password: password,
      );
      BotToast.showText(text: 'User Registered Successfully');
      BotToast.closeAllLoading();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          return const LandingPage();
        }),
        (route) => false,
      );
    } catch (e) {
      sPrint(e);
      BotToast.closeAllLoading();
    }
  }

  Future signIn({required dynamic emailOrPhone, required String password, required BuildContext context}) async {
    BotToast.showLoading();
    try {
      bool isEmail = true;
      try {
        double.parse(emailOrPhone);
        isEmail = false;
      } catch (e) {
        isEmail = true;
      }
      sPrint('{isEmail: $isEmail}');
      final userModel = isEmail ? await uS.checkFutureTheUserPresenceWithEmail(emailOrPhone) : await uS.checkFutureTheUserPresenceWithMobileNumber(emailOrPhone);
      FirebaseAuth.instance.signInWithEmailAndPassword(email: userModel.email!, password: password);
      // Navigator.pushAndRemoveUntil(
      //   context,
      //   MaterialPageRoute(builder: (context) {
      //     return const UsersList();
      //   }),
      //   (route) => false,
      // );
      emit(userModel);

      BotToast.closeAllLoading();
    } catch (e) {
      BotToast.closeAllLoading();
    }
  }

  Future logout({required BuildContext context}) async {
    BotToast.showLoading();
    try {
      FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) {
          return const LandingPage();
        }),
        (route) => false,
      );
      BotToast.closeAllLoading();
    } on FirebaseAuthException catch (e) {
      sPrint('error in signOut: e');
      BotToast.closeAllLoading();
    }
  }
}
