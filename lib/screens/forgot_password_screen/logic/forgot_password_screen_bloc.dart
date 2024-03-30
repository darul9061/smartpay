import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/screens/forgot_password_screen/logic/forgot_password_screen_repo.dart';

part 'forgot_password_screen_events.dart';
part 'forgot_password_screen_state.dart';



class ForgotPasswordScreenBLoc extends Bloc<ForgotPasswordScreenEvents, ForgotPasswordScreenState> {

  ForgotPasswordScreenRepository forgotPassRepo = ForgotPasswordScreenRepository();  

  ForgotPasswordScreenBLoc():super(ForgotPasswordScreenState()){

  }

}