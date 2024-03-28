import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

import '../utils/hexcolor.dart';

class PhoneNumInput extends StatefulWidget {
  
  final TextEditingController controller;

  final String textEntry;

  final String labelText;

  final bool fromLogin;

  final String? Function(String?)? validator;

  PhoneNumInput(
    {
      Key? key,

      required this.controller,

      required this.textEntry,

      required this.labelText,

      this.fromLogin = false,

      this.validator

    }
  ) : super(key: key);

  @override
  State<PhoneNumInput> createState() => _PhoneNumInputWithIconState();

}

class _PhoneNumInputWithIconState extends State<PhoneNumInput> {

  late TextEditingController controller;

  late String textEntry;

  late String labelText;

  late bool visible = false;
  
  late bool isError = false;


  @override
  void initState() {

    super.initState();

    controller = widget.controller;

    textEntry = widget.textEntry;

    labelText = widget.labelText;

  }

  @override
  Widget build(BuildContext context) {


  // var phoneNumber = PhoneNumber(isoCode: "NG");
  //   phoneNumber.
    return Container(
      
      padding: EdgeInsets.only(top: 25),

      decoration: BoxDecoration(

        borderRadius: BorderRadius.circular(8),

      ),
      
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start, 

        children: [

          Padding(

            padding: EdgeInsets.only(bottom: 8),

            child: Text(

              labelText,

              style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith( color: SmartpayColors.smartpayBlack, fontWeight: FontWeight.w500 )

            ),
          ),


          Container(

            // clipBehavior: Clip.antiAliasWithSaveLayer,

            decoration: BoxDecoration(

              border: Border.all(width: 1.0, color: SmartpayColors.smartpayBorderColor),

              borderRadius: BorderRadius.circular(9)

            ),

            child: ClipRRect(
              
              borderRadius: BorderRadius.circular(12), 
              
              child: InternationalPhoneNumberInput(
                
                initialValue: PhoneNumber( isoCode: "NG", phoneNumber: controller.text ),

                selectorConfig: const SelectorConfig(

                  setSelectorButtonAsPrefixIcon: false,

                  leadingPadding: 10,

                  trailingSpace: false,

                ),

                onInputChanged:(phoneNumberClass) {

                  print(phoneNumberClass);

                  controller.text = phoneNumberClass.phoneNumber ?? "";


                },

                // onInputValidated,
                // onSubmit,
                // onFieldSubmitted,
                validator: widget.validator ?? (p0) {

                  if( isError ){

                    setState(() {
                      
                      isError = false;

                    });

                  }
                  
                  if( (p0?.isEmpty ?? false) ){

                    setState(() {
                      
                      isError = true;

                    });

                  }

                  return null;
                },
                // onSaved,
                // textFieldController: controller,

                keyboardAction: TextInputAction.done,
                // keyboardType = TextInputType.phone,
                // initialValue,
                // hintText = 'Phone number',
                // errorMessage = 'Invalid phone number',
                // selectorButtonOnErrorPadding = 24,
                spaceBetweenSelectorAndTextField: 0,
                // maxLength = 15,
                // isEnabled = true,
                // formatInput = true,
                // autoFocus = false,
                // autoFocusSearch = false,
                // autoValidateMode = AutovalidateMode.disabled,
                // ignoreBlank = false,
                // countrySelectorScrollControlled = true,
                // locale,
                // textStyle,
                // selectorTextStyle,
                // inputBorder,
                // searchBoxDecoration,
                // textAlign = TextAlign.start,
                // textAlignVertical = TextAlignVertical.center,
                // scrollPadding = const EdgeInsets.all(20.0),
                // focusNode,
                // cursorColor,
                // autofillHints,
                // countries
                inputDecoration: InputDecoration(

                  filled: true,

                  fillColor: Colors.white,

                  contentPadding: const EdgeInsets.symmetric( horizontal: 17, vertical: 15 ),

                  errorBorder: OutlineInputBorder(

                    borderSide: const BorderSide(width: 0),

                    borderRadius: BorderRadius.circular(7)

                  ),

                  focusedErrorBorder: OutlineInputBorder(

                      borderSide: BorderSide(color: Colors.red, width: 1),

                      borderRadius: BorderRadius.circular(7)

                  ),

                  focusedBorder: OutlineInputBorder(

                    borderSide: BorderSide ( color: SmartpayColors.smartpayBorderColor, width: 1 ),

                    borderRadius: BorderRadius.circular(0)

                  ),

                  enabledBorder: OutlineInputBorder(

                    borderSide: BorderSide ( color: SmartpayColors.smartpayBorderColor, width: 1 ),

                    borderRadius: BorderRadius.circular(0)

                  ),

                  hintText: textEntry,

                  hintStyle: context.textSize.titleMedium?.copyWith(

                    color: HexColor("#B9B9B9"), 

                    fontWeight: FontWeight.w400

                  ),

                  errorStyle: TextStyle(

                    backgroundColor: Colors.white,

                    height: 0.9,

                    overflow: TextOverflow.visible

                  ),

                )

              )
              
            )

          ),

          if(isError)
          
            Padding(

              padding: const EdgeInsets.only(left: 15),

              child: Text(
                
                SmartpayTextStrings.fieldEmpty, 
                
                style: context.textSize.bodySmall?.copyWith( color: SmartpayColors.smartpayRed.withBlue(4) )

              )
              
            )

        ]
      
      )

    );
  }
}
