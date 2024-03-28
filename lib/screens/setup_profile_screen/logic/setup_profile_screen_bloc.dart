import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/models/request_models/next_of_kin_req_model.dart';
import 'package:smartpay/models/request_models/store_patient_detail_req_model.dart';
import 'package:smartpay/models/response_models/next_of_kin_res_model.dart';
import 'package:smartpay/models/response_models/patient_details_res_models.dart';
import 'package:smartpay/models/response_models/store_patient_detail_res_model.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/screens/common_screens/success_payment_screen.dart';
import 'package:smartpay/screens/root_access_screens/root_access_screen.dart';
import 'package:smartpay/screens/setup_profile_screen/logic/setup_profile_screen_repo.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

part 'setup_profile_screen_events.dart';
part 'setup_profile_screen_state.dart';

class SetupProfileScreenBLoc extends Bloc<SetupProfileScreenEvent, SetupProfileScreenState>{

  final SetupProfileScreenRepository _setupProfileRepo = SetupProfileScreenRepository();

  final SetupProfileScreenState _setupProfileScreenState = SetupProfileScreenState();

  final ImagePicker _imagePicker = ImagePicker();

  SetupProfileScreenBLoc():super(SetupProfileScreenState()){

    on<SetupProfileScreenOnTapEvents>(storePatientDetail);

    on<SetupProfileScreenSelectProfileImage>(pickProfileImage);

  }


  void storePatientDetail(SetupProfileScreenOnTapEvents event, Emitter<SetupProfileScreenState>  emit) async {

    var reqData = StorePatientDetailReqModel(
      
      phoneNumber: event.phoneNumber,
      email: event.email,
      firstName: event.firstName,
      lastName: event.lastName,
      dateOfBirth: event.dateOfBirth,
      gender: event.gender,
      bloodGroup: event.bloodGroup,
      genotype: event.genotype,
      height: event.height,
      weight: event.weight,
      address: event.address,
      profilePicture: _setupProfileScreenState.uiProfileImageByte == null ? 
        null 
        : 
        MultipartFile.fromFileSync( _setupProfileScreenState.uiProfileImageXFile!.path ),
      
    );

    UserDetailModel userDetailModel = ( await SmartpaySharedPreferences.getUserInfo() )!;

    PatientDetailsResModel? setupRes = await _setupProfileRepo.storeProfile(reqData, userDetailModel.patientId!, keepPreloaderLoading: true);

    if(setupRes is! PatientDetailsResModel) return;

    NextOfKinResModel? nextOfKinResModel = await _setupProfileRepo.storeNextOfKinProfile(event.nextOfKinReqModel, userDetailModel.patientId!);

    if(nextOfKinResModel is! NextOfKinResModel) return;

    Navigator.pushReplacement(
      
      Common.navigatorKey.currentContext!, 

      MaterialPageRoute(
        
        builder: (context) => SuccessPaymentScreen(

          header: "Account Successfully Created",

          background: Container(),

          child: Column(
                        
            children: [

              Text(
                
                SmartpayTextStrings.successAccountCreationMessage,

                textAlign: TextAlign.center,
                
                style: context.textSize.bodyMedium?.copyWith(

                  color: SmartpayColors.smartpayGray,

                ),

              ),

              const SizedBox(

                height: 15,

              ),

              SmartpayButtons.plain(

                () { 

                  Navigator.pushReplacementNamed(
                    
                    context, 
                    
                    RootAccessScreen.routeName
                    
                  );
                  
                },

                title: SmartpayTextStrings.continueWord
                
              ),

              const SizedBox(

                height: 20,

              ),
              
            ]
            
          ),

        )

      )
      
    );

  }

  void pickProfileImage(SetupProfileScreenSelectProfileImage event, Emitter<SetupProfileScreenState> emit) async {

    XFile? profileImage = await _imagePicker.pickImage( source: ImageSource.gallery );

    if(profileImage != null) {

      emit(
        
        _setupProfileScreenState
        ..uiProfileImageByte = ( await profileImage.readAsBytes() )
        ..uiProfileImageXFile = ( profileImage )
        
      );

    }

  }

}