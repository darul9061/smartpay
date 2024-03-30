import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/components/appbar.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/models/user_detail_model.dart';
import 'package:smartpay/screens/login_screen/ui/login_screen.dart';
import 'package:smartpay/screens/setup_profile_screen/logic/setup_profile_screen_bloc.dart';
import 'package:smartpay/state_manager/central_bloc.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../utils/common.dart';
import '../../../utils/hexcolor.dart';

class SetupPinScreen extends StatefulWidget {

  static const String routeName = "/setupPrinScreen";

  SetupPinScreen({Key? key}) : super(key: key);

  @override
  State<SetupPinScreen> createState() => _SetupPinScreenState();

}

class _SetupPinScreenState extends State<SetupPinScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController otpEditingController = TextEditingController();

  bool isVerifCodeComplete = false;



  @override
  void initState() {

    super.initState();

  }

  @override
  void dispose() {

    super.dispose();
    
  }

  @override
  Widget build(BuildContext context) {

    var routeData = ModalRoute.of(context)?.settings.arguments;

    assert(routeData is UserDetailModel, "User Details are required as screen argument");

    routeData as UserDetailModel;

    return Scaffold(

      // appBar: SmartpayAppbars.plain( context, leadingWidget: Image.asset( SmartpayImagesAssets.smartpayLogo ), isTransparent: true ),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Container(

            padding: const EdgeInsets.symmetric( horizontal: 18 ),

            height: context.screenHeight,

            width: context.screenWidth,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                Padding(
                      
                  padding: const EdgeInsets.only( top: 26, bottom: 12 ),
                  
                  child: Text(

                    (context.read<CentralBLoc>().setupPinScreenShouldCheckPin) ? "PIN Code" : SmartpayTextStrings.setupPINtitle,

                    style: context.textSize.titleLarge?.copyWith(

                      fontWeight: FontWeight.bold,

                      color: SmartpayColors.smartpayBlack

                    ),

                  )

                ),

                Padding(
                  
                  padding: const EdgeInsets.only( bottom: 10 ),
                  
                  child: Text(

                    "We use state-of-the-art security measures to protect your information at all times",

                    textAlign: TextAlign.left,

                    style: context.textSize.titleMedium?.copyWith(

                      color: HexColor("#6B7280"),

                      fontSize: (context.textSize.titleMedium?.fontSize ?? 0.0) + 1.5,

                      fontWeight: FontWeight.w200

                    ),

                  )
                  
                ),

                Form(

                  key: formKey,

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [

                      const SizedBox(height: 10),
                      
                      OtpTextField(
                        
                        hasCustomInputDecoration: true,

                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],

                        numberOfFields: 5,

                        margin: EdgeInsets.zero,

                        fieldWidth: Common.Ws(0.14),

                        borderRadius: BorderRadius.circular(5),

                        borderWidth: 1,

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        styles: [

                          context.textSize.titleLarge?.copyWith( color: Colors.black, fontWeight: FontWeight.w700, fontSize: (context.textSize.titleLarge?.fontSize ?? 0) + 1 ),
                          context.textSize.titleLarge?.copyWith( color: Colors.black, fontWeight: FontWeight.w700, fontSize: (context.textSize.titleLarge?.fontSize ?? 0) + 1 ),
                          context.textSize.titleLarge?.copyWith( color: Colors.black, fontWeight: FontWeight.w700, fontSize: (context.textSize.titleLarge?.fontSize ?? 0) + 1 ),
                          context.textSize.titleLarge?.copyWith( color: Colors.black, fontWeight: FontWeight.w700, fontSize: (context.textSize.titleLarge?.fontSize ?? 0) + 1 ),
                          context.textSize.titleLarge?.copyWith( color: Colors.black, fontWeight: FontWeight.w700, fontSize: (context.textSize.titleLarge?.fontSize ?? 0) + 1 ),

                        ],

                        filled: true,

                        handleControllers: (controllers) {},

                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                color: HexColor("#3E4784"),
                                fontWeight: FontWeight.bold),

                        decoration: InputDecoration(

                          counterText: "",

                          fillColor: Colors.transparent,

                          filled: true,

                          border: UnderlineInputBorder(

                            borderSide: BorderSide(width: 1.4, color: SmartpayColors.smartpaySecondaryColor),
                            
                            // borderRadius: BorderRadius.circular(10)

                          ),

                          focusedBorder: UnderlineInputBorder(

                            borderSide: BorderSide(width: 1.4, color: SmartpayColors.smartpaySecondaryColor),
                            
                            // borderRadius: BorderRadius.circular(10)

                          ),

                          enabledBorder: UnderlineInputBorder(

                            borderSide: BorderSide(width: 1.4, color: SmartpayColors.smartpaySecondaryColor),
                            
                            // borderRadius: BorderRadius.circular(10)

                          ),

                          contentPadding: const EdgeInsets.symmetric(vertical: 13),

                          isCollapsed: true,

                          isDense: true
                        
                        ),

                        borderColor: SmartpayColors.smartpayBorderColor2,
                        
                        enabledBorderColor: SmartpayColors.smartpayBorderColor2,
                        
                        keyboardType: TextInputType.number,
                        
                        onCodeChanged: (value) {

                          if (value.isEmpty) {
                            
                            otpEditingController.text = "";
                            
                          }
                          
                        },
                        
                        onSubmit: (value) {
                          
                          otpEditingController.text = value;

                          if(otpEditingController.text.length == 5){

                            // context.currentstate is used because OtpTextField package textfield doesn't bring out validation error message
                            // instead an alternative would have been used if that happended

                            setState(() {

                              isVerifCodeComplete = formKey.currentState?.validate() ?? false;
                              
                            });

                          }
                          
                        },
                        
                        showFieldAsBox: true,
                        
                      ),

                      const SizedBox( height: 130, ),

                      SmartpayButtons.plain(

                        () {

                          if(formKey.currentState?.validate() ?? false){

                            formKey.currentState?.save();

                            FocusManager.instance.primaryFocus?.unfocus();

                            if(otpEditingController.text.length == 5){

                              print("verification Event");

                              context.read<SetupProfileScreenBLoc>().add( 

                                context.read<CentralBLoc>().setupPinScreenShouldCheckPin ?

                                  SetupProfileScreenCheckPinEvent( pin: otpEditingController.text, userDetail: routeData)

                                  :

                                  SetupProfileScreenSavePinEvent( pin: otpEditingController.text, userDetail: routeData)

                              );


                            }

                          }

                        },
                        
                        title: SmartpayTextStrings.confirm,

                        fillColor: !(isVerifCodeComplete) ? SmartpayColors.smartpayGray : null

                      ),

                      const SizedBox(

                        height: 20,

                      ),

                      if(context.read<CentralBLoc>().setupPinScreenShouldCheckPin) SmartpayButtons.plain(

                        () {

                          

                          SmartpaySharedPreferences.clearUserInfo();

                          Navigator.pushReplacementNamed(context, LoginScreen.routeName);

                        },
                        
                        title: "Logout",

                        fillColor: null

                      ),

                    ],

                  )
                  
                ),

              ],

            ),

          ),

        )
      
      ),

    );
  }
}