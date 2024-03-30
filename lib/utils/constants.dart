import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/hexcolor.dart';

class SmartpayColors {
  static Color smartpayPrimaryColor = HexColor("#111827");
  static Color smartpaySecondaryColor = HexColor("#0A6375");
  static Color smartpayGray = HexColor("#111827").withOpacity(0.3);
  static Color smartpayLightAsh = HexColor("#111827").withOpacity(0.1);
  static Color smartpayLighterAsh = HexColor("#111827").withOpacity(0.04);
  static Color smartpayBlack = HexColor("#1C1616");
  static Color smartpayRed = HexColor("#F14914");
  static Color smartpayGreen = HexColor("#2FA2B9");
  static Color smartpayGreen2 = HexColor("#027A48");
  static Color smartpayWhiteGreen = HexColor("#ECFDF3");
  static Color smartpayBlueishWhite = HexColor("#F9FAFD");
  static Color smartpayBlueDarker = HexColor("#070031");
  static Color smartpayBorderColor = HexColor("#E9EBF3");
  static Color smartpayBorderColor2 = HexColor("#BCC2DA");
  static Color success = HexColor("#027A48");
  static const Color darkPrimary = Color(0xFF0D0053);
}

class SmartpayIconsAssets {
  static const String basePath = "assets/icons/";

  static String thumbStar = "${basePath}thumb_star.png";
  static String check = "${basePath}check.png";
  static String search = "${basePath}search.png";
}

class SmartpayImagesAssets {
  static const String basePath = "assets/images/";

  static const String smartpayLogo = "${basePath}Logo.png";
  static const String appPhoneFinance = "${basePath}device_illustration.png";
  static const String appPhoneFinanceGraph = "${basePath}graph_illustration.png";
  static const String phoneTransactionIllustration = "${basePath}phone_transaction_illustration.png";
  static const String transactionIllustration = "${basePath}transaction_illustration.png";
  static const String userIllustration = "${basePath}user_illustration.png";
  static const String lockIllustration = "${basePath}lock_illustration.png";
  static const String google = "${basePath}google.png";
  static const String apple = "${basePath}apple.png";
}

class SmartpaySharedPreferences {
  
  static const String _sharePrefUser = "user";

  static Future<UserDetailModel?> getUserInfo({bool showWarning = true}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? encodedSignedUpUser = prefs.getString(_sharePrefUser);

    if (encodedSignedUpUser == null) {
      if (showWarning) {
        Common.smartpayToast("Failed to get user information");
      }

      return null;
    }
    ;

    return UserDetailModel.fromJson(jsonDecode(encodedSignedUpUser));
  }

  static Future<bool> putUserInfo(UserDetailModel userDetailModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.setString(
        _sharePrefUser, jsonEncode(userDetailModel.toJson()));
  }

  static Future<bool> clearUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    return await prefs.remove(_sharePrefUser);
  }

}

class SmartpayTextStrings {
  static const String empty = "";

  static const String welcomeToSmartpayWelcomeScreen = "Welcome to Smartpay";

  static String welcomeToSmartpayBodyWelcomeScreen =
      "Easily find doctors, schedule virtual consultations, order lab tests, and medications, all from the comfort of your own home.";

  static const String login = "Log in";

  static const String signUp = "Sign Up";

  static const String loginTitle = "Login to your Account";

  static const String verifyTitle = "Verify it's you";

  static const String setupPINtitle = "Set your PIN code";

  static const String signUpTitle = "Hi There! 👋";

  static const String emailInputLabel = "Email address";

  static const String username = "Username";

  static const String country = "Country";

  static const String newPasswordInputLabel = "New Password";

  static const String confirmPasswordInputLabel = "Confirm Password";

  static const String phoneNumInputLabel = "Phone Number";

  static const String fullname = "Full Name";

  static const String firstname = "First Name";

  static const String lastname = "Last Name";

  static const String passwordInputLabel = "Password";

  static const String forgotPasswordQuestion = "Forgot Password?";

  static const String noAccount = "Don’t have an account?";

  static const String haveAccount = "Already have an account?";

  static const String fieldEmpty = "Field must not be empty";

  static const String resendCode = "Resend Code ";

  static const String confirm = "Confirm";

  static const String createPIN = "Create PIN";

  static const String profile = "Profile";

  static const String continueWord = "Continue";
}
