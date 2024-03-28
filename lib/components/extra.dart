import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/hexcolor.dart';
import 'package:smartpay/utils/media_query.dart';

class SmartpayExtraComponents {

  static Widget textField({required TextEditingController controller, String? hintText, bool enabled = true}){
    
    return TextField(

      maxLines: 1,

      controller: TextEditingController(),

      enabled: enabled,

      decoration: InputDecoration(

        contentPadding: EdgeInsets.symmetric( vertical: 15, horizontal: 10 ),

        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 0),
            borderRadius: BorderRadius.circular(7)),

        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
            borderRadius: BorderRadius.circular(7)),

        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: HexColor("#2E2F38")),
            borderRadius: BorderRadius.circular(7)),

        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: SmartpayColors.smartpayBorderColor, width: 1),
            borderRadius: BorderRadius.circular(9)),

        disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: SmartpayColors.smartpayBorderColor, width: 1),
            borderRadius: BorderRadius.circular(9)),

        hintText: hintText,

        hintStyle: Common.navigatorKey.currentContext!.textSize.bodyMedium?.copyWith(

          fontWeight: FontWeight.w300,

          color: SmartpayColors.smartpayGray

        )
        
      )

    );

  }


  static Widget cart(
    
    BuildContext context, {

    int itemsCount = 0,

    FutureOr<void> Function()? onTap,



  }) {

    return InkWell( 

      onTap: () async {
        
        if(onTap != null) await onTap();
        
      },
      
      child: Stack(

        children: [

          Container(
            
            margin: EdgeInsets.all(5),

            child: Icon(
              
              Icons.shopping_cart_outlined,

              color: SmartpayColors.smartpayPrimaryColor,

            )
            
          ),

          if(itemsCount > 0) Positioned(

            right: 0,

            top: 0,
            
            child: Container(

              margin: EdgeInsets.only( right:  Common.Ws( 0.003 ) ),

              padding: EdgeInsets.all(3),

              // width: 8,

              // height: 8,
              
              decoration: const BoxDecoration(

                color: Colors.red,

                shape: BoxShape.circle

              ),

              child: Text(

                itemsCount.toString(),

                style: const TextStyle(

                  fontSize: 9,

                  color: Colors.white

                ),

              ),

            )
            
          )

        ],

      )

    );

  }

  static Widget notification({

    bool isAvailable = false,

    void Function()? onTap,



  }) {

    return InkWell( 

      onTap: onTap,
      
      child: Stack(

        children: [


          Image.asset(

            SmartpayIconsAssets.bell,

            width: Common.Ws( 0.062 ),

            

          ),

          if(isAvailable) Positioned(

            right: 0,
            
            child: Container(

              margin: EdgeInsets.only( right:  Common.Ws( 0.003 ) ),

              width: 8,

              height: 8,
              
              decoration: const BoxDecoration(

                color: Colors.red,

                shape: BoxShape.circle

              ),

            )
            
          )

        ],

      )

    );

  }
  
}