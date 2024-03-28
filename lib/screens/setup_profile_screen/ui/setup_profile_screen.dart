import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:smartpay/components/appbar.dart';
import 'package:smartpay/components/bottom_nav_bar.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/components/card.dart';
import 'package:smartpay/components/dropdown.dart';
import 'package:smartpay/components/phone_num_input.dart';
import 'package:smartpay/components/textinput.dart';
import 'package:smartpay/models/request_models/next_of_kin_req_model.dart';
import 'package:smartpay/screens/root_access_screens/root_access_screen.dart';
import 'package:smartpay/screens/setup_profile_screen/logic/setup_profile_screen_bloc.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

class _SetupProfileScreenInputData {

  final String title;

  final TextEditingController inputController;

  final String? Function(String?)? validator;

  const _SetupProfileScreenInputData({required this.title, required this.inputController, this.validator});

}

class SetupProfileScreen extends StatefulWidget {

  static String routeName = "/setupProfileScreen";

  SetupProfileScreen({Key? key}) : super(key: key);

  @override
  State<SetupProfileScreen> createState() => _SetupProfileScreenState();

}

class _SetupProfileScreenState extends State<SetupProfileScreen> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final _genders = [
                                
    SmartpayDropdownItemData( id: 0, title: "Male" ),
    
    SmartpayDropdownItemData( id: 1, title: "Female" )

  ];

  final _genotypes = [
                                
    SmartpayDropdownItemData( id: 0, title: "AA" ),
                                
    SmartpayDropdownItemData( id: 1, title: "AC" ),
                                
    SmartpayDropdownItemData( id: 2, title: "AS" ),
                                
    SmartpayDropdownItemData( id: 3, title: "CC" ),
                                
    SmartpayDropdownItemData( id: 4, title: "SC" ),
                                
    SmartpayDropdownItemData( id: 5, title: "SS" ),

  ];

  final _bloodGroups = [
                                
    SmartpayDropdownItemData( id: 0, title: "A+" ),
                                
    SmartpayDropdownItemData( id: 1, title: "A-" ),
                                
    SmartpayDropdownItemData( id: 2, title: "B+" ),
                                
    SmartpayDropdownItemData( id: 3, title: "B-" ),
                                
    SmartpayDropdownItemData( id: 4, title: "O+" ),
                                
    SmartpayDropdownItemData( id: 5, title: "O-" ),
                                
    SmartpayDropdownItemData( id: 6, title: "AB+" ),
                                
    SmartpayDropdownItemData( id: 7, title: "AB-" ),

  ];

  final List<_SetupProfileScreenInputData> allInputFields = [

    _SetupProfileScreenInputData(
      
      title: SmartpayTextStrings.dateOfBirth, 
      
      inputController: TextEditingController(),

      validator: (p0) => null,
      
    ),

    _SetupProfileScreenInputData(
      
      title: SmartpayTextStrings.gender, 
      
      inputController: TextEditingController(),

      validator: (p0) => null,
      
    ),

    _SetupProfileScreenInputData(
      
      title: SmartpayTextStrings.bloodGroup, 
      
      inputController: TextEditingController(),

      validator: (p0) => null,
      
    ),

    _SetupProfileScreenInputData(
      
      title: SmartpayTextStrings.genotype, 
      
      inputController: TextEditingController(),

      validator: (p0) => null,
      
    ),

    _SetupProfileScreenInputData(
      
      title: SmartpayTextStrings.height, 
      
      inputController: TextEditingController(),

      validator: (p0) => null,
      
    ),

    _SetupProfileScreenInputData(
      
      title: SmartpayTextStrings.weight, 
      
      inputController: TextEditingController(),

      validator: (p0) => null,
      
    ),

    _SetupProfileScreenInputData(
      
      title: SmartpayTextStrings.contactAddress, 
      
      inputController: TextEditingController(),

      validator: (p0) => null,
      
    ),

    _SetupProfileScreenInputData(
      
      title: SmartpayTextStrings.fullnameNextOfKin, 
      
      inputController: TextEditingController(),

      validator: (p0) {

        if(p0?.isEmpty ?? false){

          return "Field required";

        }

        return null;
      }
      
    ),

    _SetupProfileScreenInputData(
      
      title: SmartpayTextStrings.phoneNextOfKin, 
      
      inputController: TextEditingController(),

      validator: (p0) => null,
      
    ),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: SmartpayAppbars.plain( context, leadingWidget: Image.asset( SmartpayImagesAssets.smartpayLongLogo ), isTransparent: true ),

      bottomNavigationBar: Padding(
        
        padding: MediaQuery.of(context).viewInsets,
          
        child: SmartpayBottomNavsBar.customBottomBar(

          height: defaultTargetPlatform == TargetPlatform.android ? 80 : 100,
          
          child: Row(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              SizedBox(

                width: Common.Ws(0.38),

                child: SmartpayButtons.skeleton(

                  () {

                    Navigator.pushNamed(context, RootAccessScreen.routeName);

                  },

                  customView: Text(

                    SmartpayTextStrings.skip,

                    style: context.textSize.bodyMedium,

                  ),
                  
                )
                
              ),

              const SizedBox( width: 25, ),


              SizedBox(

                width: Common.Ws(0.38),

                child: SmartpayButtons.plain(

                  () {

                    if(!(formKey.currentState?.validate() ?? true)){ return;}

                    context.read<SetupProfileScreenBLoc>().add(
                      
                      SetupProfileScreenOnTapEvents(

                        dateOfBirth: allInputFields[0].inputController.text.isEmpty? null : allInputFields[0].inputController.text.trim(),

                        gender: allInputFields[1].inputController.text.isEmpty? null : allInputFields[1].inputController.text.trim(),

                        bloodGroup: allInputFields[2].inputController.text.isEmpty? null : allInputFields[2].inputController.text.toUpperCase().trim(),

                        genotype: allInputFields[3].inputController.text.isEmpty? null : allInputFields[3].inputController.text.toUpperCase().trim(),

                        height: allInputFields[4].inputController.text.isEmpty? null : int.parse( allInputFields[4].inputController.text.trim() ),

                        weight: allInputFields[5].inputController.text.isEmpty? null : int.parse( allInputFields[5].inputController.text.trim() ),

                        address: allInputFields[6].inputController.text.isEmpty? null : allInputFields[6].inputController.text.trim(),

                        nextOfKinReqModel: NextOfKinReqModel(

                          fullName: allInputFields[7].inputController.text.isEmpty? null : allInputFields[7].inputController.text.trim(),

                          phoneNumber: allInputFields[8].inputController.text.isEmpty? null : allInputFields[8].inputController.text.trim(),

                        )

                      )
                      
                    );

                  },

                  title: SmartpayTextStrings.continueWord
                  
                )

              )

            ],

          )

        )
        
      ),

      body: SafeArea(

        top: false,

        child: SingleChildScrollView(

          child: Container(

            padding: const EdgeInsets.symmetric( horizontal: 20 ),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [

                Padding(
                  
                  padding: const EdgeInsets.only( top: 26, bottom: 12 ),
                  
                  child: Text(

                    SmartpayTextStrings.setUpYrProfile,

                    style: context.textSize.titleLarge?.copyWith(

                      fontWeight: FontWeight.bold,

                      color: SmartpayColors.smartpayBlack

                    ),

                  )

                ),

                Padding(
                  
                  padding: const EdgeInsets.only( bottom: 25 ),
                  
                  child: Text(

                    SmartpayTextStrings.letGetKnowYou,

                    style: TextStyle(

                      fontSize: 15,

                      color: SmartpayColors.smartpayGray

                    ),

                  )

                ),

                SmartpayCard.simpleCard(

                  context,

                  horizontalPadding: 15,

                  verticalPadding: 25,

                  child: Form(

                    key: formKey,
                    
                    child: Column( 

                      crossAxisAlignment: CrossAxisAlignment.start,
                    
                      children: [

                        Row(

                          children: [
                        
                            SizedBox(

                              width: defaultTargetPlatform == TargetPlatform.android ? Common.Ws(0.2) : Common.Ws(0.22),

                              height: defaultTargetPlatform == TargetPlatform.android ? Common.Ws(0.2) : Common.Ws(0.22),

                              child: ClipRRect(

                                borderRadius: BorderRadius.circular(100),

                                child: BlocBuilder<SetupProfileScreenBLoc, SetupProfileScreenState>(
                                  
                                  builder: (context, SetupProfileScreenState state) { 
                                    
                                    return state.uiProfileImageByte == null ? Image.asset(

                                      SmartpayIconsAssets.userBig,

                                      filterQuality: FilterQuality.high,

                                      fit: BoxFit.cover,

                                      // width: 10,

                                      // color: Colors.black,

                                    )
                                    
                                    : 
                                    
                                    Image.memory( state.uiProfileImageByte! );

                                  }

                                ),

                              )
                              
                            ),

                            SizedBox(

                              width: 15,

                            ),

                            TextButton(

                              style: TextButton.styleFrom(

                                foregroundColor: SmartpayColors.smartpayPrimaryColor,

                                backgroundColor: Colors.transparent,

                                shape: RoundedRectangleBorder(

                                  side: BorderSide(color: SmartpayColors.smartpayPrimaryColor),

                                  borderRadius: BorderRadius.all( Radius.circular(7) )
                                  
                                ),

                              ),

                              onPressed: (){

                                context.read<SetupProfileScreenBLoc>().add(SetupProfileScreenSelectProfileImage());

                              },

                              child: Text(

                                SmartpayTextStrings.changePhoto,

                                maxLines: 1,

                                overflow: TextOverflow.ellipsis,

                                style: Theme.of( Common.navigatorKey.currentContext! ).textTheme.bodyMedium?.copyWith(

                                  color: SmartpayColors.smartpayPrimaryColor,

                                  fontWeight: FontWeight.w500,

                                )

                              ),

                            )

                          ]

                        ),


                        //LIST OF INPUTS

                        ...(

                          allInputFields.map((e){ 
                            
                            switch (e.title) {

                              case SmartpayTextStrings.dateOfBirth:

                                return GestureDetector(

                                  onTap: (){

                                    showDialog(

                                      barrierDismissible: true,

                                      context: context, builder: (context) {

                                        return Stack(

                                          children: [
                                        
                                            GestureDetector(

                                              onTap: () => Navigator.pop(context),
                                              
                                              child: Container(

                                                color: Colors.transparent,

                                              )
                                              
                                            ),

                                            Center(

                                              child: ColoredBox(

                                                color: Colors.white,
                                                
                                                child: SizedBox(

                                                  width: Common.Ws(0.8),

                                                  height: Common.Hs(0.6),

                                                  child: SfDateRangePicker(

                                                    onSelectionChanged: ( arg ) => setState(() {
                                                      
                                                      DateTime dateTime  = arg.value as DateTime;

                                                      e.inputController.text = DateFormat("yyyy-MM-dd").format( dateTime );

                                                      print(e.inputController.text);

                                                    }),
                                                    
                                                    selectionMode: DateRangePickerSelectionMode.single,

                                                  ),

                                                )

                                              )

                                            )

                                          ]

                                        );
                                        
                                      }
                                      
                                    );

                                  },

                                  child: TextInput(
                                  
                                    controller: e.inputController, 
                                    
                                    textEntry: "", 

                                    validator: e.validator,
                                    
                                    labelText: e.title,

                                    enabled: false,
                                    
                                  ),

                                );

                              case SmartpayTextStrings.phoneNextOfKin:

                                return PhoneNumInput( 
                    
                                  controller: e.inputController, 
                                  
                                  textEntry: "",
                                  
                                  labelText: e.title
                                  
                                );
                                    
                              case SmartpayTextStrings.gender:

                                return Padding(
                                  
                                  padding: const EdgeInsets.only( top: 25 ),
                                  
                                  child: SmartpayDropdownButton(

                                    label: SmartpayTextStrings.gender,

                                    inputController: e.inputController,
                                  
                                    items: _genders,
                                    
                                    // onChanged: (int value){

                                    //   e.inputController.text = _genders.elementAt(value).title.toLowerCase();

                                    // }
                                    
                                  )
                                  
                                );
                                    
                              case SmartpayTextStrings.bloodGroup:

                                return Padding(
                                  
                                  padding: const EdgeInsets.only( top: 25 ),
                                  
                                  child: SmartpayDropdownButton(

                                    label: SmartpayTextStrings.bloodGroup,

                                    inputController: e.inputController,
                                  
                                    items: _bloodGroups, 
                                    
                                    // onChanged: (int value){

                                    //   e.inputController.text = _bloodGroups.elementAt(value).title.toLowerCase();

                                    // }
                                    
                                  )
                                
                                );
                                    
                              case SmartpayTextStrings.genotype:

                                return Padding(
                                  
                                  padding: const EdgeInsets.only( top: 25 ),
                                  
                                  child: SmartpayDropdownButton(

                                    label: SmartpayTextStrings.genotype,

                                    inputController: e.inputController,
                                  
                                    items: _genotypes, 
                                    
                                    // onChanged: (int value){

                                    //   e.inputController.text = _genotypes.elementAt(value).title.toLowerCase();

                                    // }

                                  )
                                  
                                );

                              case SmartpayTextStrings.height:

                                return TextInput(
                                
                                  controller: e.inputController, 
                                  
                                  textEntry: "", 
                                  
                                  labelText: e.title,

                                  validator: e.validator,

                                  keyboardType: TextInputType.number,
                                  
                                );

                              case SmartpayTextStrings.weight:

                                return TextInput(
                                
                                  controller: e.inputController, 
                                  
                                  textEntry: "", 
                                  
                                  labelText: e.title,

                                  validator: e.validator,

                                  keyboardType: TextInputType.number,
                                  
                                );

                              default:

                                return TextInput(
                                
                                  controller: e.inputController, 
                                  
                                  textEntry: "", 

                                  validator: e.validator,
                                  
                                  labelText: e.title
                                  
                                );
                            }


                          })

                        )
                        
                      ]
                        
                    )
                  
                  ),

                )
                
              ]
              
            )
            
          )
          
        )
        
      )
      
    );

    

  }

}