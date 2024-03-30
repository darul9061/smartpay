import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/components/appbar.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/components/textinput.dart';
import 'package:smartpay/screens/setup_profile_screen/logic/setup_profile_screen_bloc.dart';
import 'package:smartpay/screens/setup_profile_screen/ui/component/country_input.dart';
import 'package:smartpay/screens/setup_profile_screen/ui/setup_pin_screen.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

class SetupProfileScreen extends StatefulWidget {

  static String routeName = "/setupProfileScreen";

  SetupProfileScreen({Key? key}) : super(key: key);

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();

}

class _SetupProfileScreenState extends State<SetupProfileScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController firstNameEditingController = TextEditingController();

  TextEditingController lastNameEditingController = TextEditingController();

  Country? selectedCountry;

  TextEditingController userEditingController = TextEditingController();

  TextEditingController passwordEditingController = TextEditingController();

  bool allFieldNotEmpty = false;


  bool isAllFieldsEmpty (){

    if (

      firstNameEditingController.text.isEmpty ||
      lastNameEditingController.text.isEmpty ||
      selectedCountry == null ||
      userEditingController.text.isEmpty ||
      passwordEditingController.text.isEmpty

    ){

      return false;

    }

    return true;

  }

  @override
  Widget build(BuildContext context) {

    var emailRouteData = ModalRoute.of(context)?.settings.arguments;

    assert(emailRouteData is String, "Email is required as screen argument");

    emailRouteData as String;

    return Scaffold(

      appBar: SmartpayAppbars.plain( context, isTransparent: true ),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Container(

            padding: const EdgeInsets.symmetric( horizontal: 20 ),

            // height: context.screenHeight,

            width: context.screenWidth,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                
                Padding(
                  
                  padding: const EdgeInsets.only( top: 26 ),
                  
                  child: 

                  Text(

                    "Hey there! tell us a bit ",

                    style: context.textSize.titleLarge?.copyWith(

                      fontWeight: FontWeight.bold,

                      fontSize: (context.textSize.titleLarge?.fontSize ?? 0.0) * 1.1,

                      color: SmartpayColors.smartpayBlack

                    ),

                  ),

                ),


                Padding(
                  
                  padding: const EdgeInsets.only( bottom: 13 ),
                  
                  child: RichText(

                    text: TextSpan(

                      text: "about ",

                      style: context.textSize.titleLarge?.copyWith(

                        fontWeight: FontWeight.bold,

                        fontSize: (context.textSize.titleLarge?.fontSize ?? 0.0) * 1.1,

                        color: SmartpayColors.smartpayBlack

                      ),

                      children: [

                        TextSpan(

                          text: "yourself",

                          style: context.textSize.titleLarge?.copyWith(

                            fontWeight: FontWeight.bold,

                            fontSize: (context.textSize.titleLarge?.fontSize ?? 0.0) * 1.1,

                            color: SmartpayColors.smartpaySecondaryColor

                          ),

                        ),

                      ]

                    ),

                  )

                ),


                Form(

                  key: formKey,

                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [

                      TextInput(
                        
                        controller: firstNameEditingController,
                        
                        textEntry: SmartpayTextStrings.firstname,

                        onChanged: (text){

                          setState(() { allFieldNotEmpty = isAllFieldsEmpty(); });

                        }
                        
                      ),

                      TextInput(
                        
                        controller: lastNameEditingController,
                        
                        textEntry: SmartpayTextStrings.lastname,

                        onChanged: (text){

                          setState(() { allFieldNotEmpty = isAllFieldsEmpty(); });

                        }
                        
                      ),

                      TextInput(
                        
                        controller: userEditingController,
                        
                        textEntry: SmartpayTextStrings.username,

                        onChanged: (text){

                          setState(() { allFieldNotEmpty = isAllFieldsEmpty(); });

                        }
                        
                      ),

                      CountryInput(

                        onChanged: (text){

                          setState(() { allFieldNotEmpty = isAllFieldsEmpty(); });

                        },

                        onSelected: (country) {
                          
                          setState(() {

                            selectedCountry = country;

                          }); 

                        },
                        
                      ),

                      TextInput(
                        
                        controller: passwordEditingController,
                        
                        textEntry: SmartpayTextStrings.passwordInputLabel,

                        obscureText: true,

                        onChanged: (text){

                          setState(() { allFieldNotEmpty = isAllFieldsEmpty(); });

                        }
                        
                      ),

                      const SizedBox(height: 15,),

                      SmartpayButtons.plain(

                        () {

                          if( !allFieldNotEmpty ) {

                            return;

                          }

                          if( (formKey.currentState?.validate() ?? false) ){

                            formKey.currentState?.save();

                            FocusManager.instance.primaryFocus?.unfocus();

                            context.read<SetupProfileScreenBLoc>().add(

                              SetupProfileScreenOnTapEvents(

                                fullName: "${firstNameEditingController.text} ${lastNameEditingController.text}",

                                username: userEditingController.text,

                                email: emailRouteData!,

                                country: selectedCountry!.code,

                                password: passwordEditingController.text,

                              )

                            );

                          }

                        },
                        
                        title: SmartpayTextStrings.continueWord,

                        fillColor: !(allFieldNotEmpty) ? SmartpayColors.smartpayGray : null

                      ),

                      const SizedBox(

                        height: 20,

                      )

                    ],

                  )
                  
                ),

              ],

            )

          ),

        )
      
      ),

    );

  }
}