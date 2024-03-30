import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartpay/models/request_models/setup_profile_req_model.dart';
import 'package:smartpay/models/response_models/setup_profile_res_model.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/screens/root_access_screens/root_access_screen.dart';
import 'package:smartpay/screens/setup_profile_screen/logic/setup_profile_screen_repo.dart';
import 'package:smartpay/screens/setup_profile_screen/ui/setup_pin_screen.dart';
import 'package:smartpay/screens/setup_profile_screen/ui/setup_profile_screen.dart';
import 'package:smartpay/state_manager/central_bloc.dart';
import 'package:smartpay/utils/common.dart';

part 'setup_profile_screen_events.dart';
part 'setup_profile_screen_state.dart';

class SetupProfileScreenBLoc extends Bloc<SetupProfileScreenEvent, SetupProfileScreenState>{

  final SetupProfileScreenRepository _setupProfileRepo = SetupProfileScreenRepository();

  final SetupProfileScreenState _setupProfileScreenState = SetupProfileScreenState();

  final ImagePicker _imagePicker = ImagePicker();

  SetupProfileScreenBLoc():super( SetupProfileScreenState() ){

    on<SetupProfileScreenOnTapEvents>( setupProfile );

    on<SetupProfileScreenSavePinEvent>( savePin );

    on<SetupProfileScreenCheckPinEvent>( checkPin );

  }

  setupProfile( SetupProfileScreenOnTapEvents event, Emitter<SetupProfileScreenState> emit ) async {

    SetupProfileResModel? signupRes = await _setupProfileRepo.storeProfile(

      SetupProfileReqModel( 
        
        email: event.email,
        fullName: event.fullName,
        username: event.username,
        country: event.country,
        password: event.password,
        deviceName: event.deviceName,
        
      )

    );

    if( signupRes is! SetupProfileResModel ) return;

    var u = UserDetailModel(

      id: signupRes.data?.user?.id,
      email: signupRes.data?.user?.email,
      fullName: signupRes.data?.user?.fullName,
      username: signupRes.data?.user?.username,
      country: signupRes.data?.user?.country,
      userToken: signupRes.data?.token,

    );




    Common.navigatorKey.currentContext!.read<CentralBLoc>().setupPinScreenShouldCheckPin = false;
    Navigator.pushReplacementNamed(Common.navigatorKey.currentContext!, SetupPinScreen.routeName, arguments: u);

  }

  savePin( SetupProfileScreenSavePinEvent event, Emitter<SetupProfileScreenState> emit ) async {

    debugPrint("SetupProfileScreenSavePinEvent ===>  ${event.pin} ${event.userDetail?.toJson()}");

    await Common.navigatorKey.currentContext!.read<CentralBLoc>().storePin(passwordKey: event.pin, userData: event.userDetail);

    Navigator.pushReplacementNamed(Common.navigatorKey.currentContext!, RootAccessScreen.routeName);

  }


  checkPin( SetupProfileScreenCheckPinEvent event, Emitter<SetupProfileScreenState> emit ) async {

    debugPrint("SetupProfileScreenSavePinEvent ===>  ${event.pin} ${event.userDetail?.toJson()}");

    var v = await Common.navigatorKey.currentContext!.read<CentralBLoc>().checkPin(passwordKey: event.pin, userData: event.userDetail);

    if (!v){

      Common.smartpayToast("Pin is wrong");

      return;

    }

    Navigator.pushReplacementNamed(Common.navigatorKey.currentContext!, RootAccessScreen.routeName);

  }

}