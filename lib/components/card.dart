import 'package:flutter/material.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';

class SmartpayCard {
  
  static Widget simpleCard(

    BuildContext context,

    {

      double? topMargin,

      double? bottomMargin,

      double? verticalPadding,

      double? horizontalPadding,

      Color? borderColor,

      Color? backgroundColor,

      Widget? child,

      bool bordered = true,

      BorderRadiusGeometry? borderRadius,

      void Function()? onTap

    }

  ){
    

    return GestureDetector(

      onTap: onTap,
      
      child: Container(

        clipBehavior: Clip.antiAlias,

        margin: EdgeInsets.only(

          top: topMargin ?? 0.0,

          bottom: bottomMargin ?? 0.0

        ),

        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? Common.Ws(0.03), horizontal: horizontalPadding ?? Common.Ws(0.03)),

        width: double.maxFinite,

        decoration: BoxDecoration(

          color: backgroundColor ?? Colors.white,

          borderRadius: borderRadius ?? BorderRadius.circular( 10 ),

          border: bordered ? 

            Border.all(

              width: 0.8,

              color: borderColor ?? SmartpayColors.smartpayBorderColor

            )

            :

            null

        ),

        child: child,
      )

    );

  }

  static Widget emptyGray({

    required Widget child,

    double? verticalPadding,

    double? horizontalPadding,

    double? verticalMargin,

    double? horizontalMargin

  }){

    return Container(

      padding: EdgeInsets.symmetric( vertical: verticalPadding ?? 15, horizontal: horizontalPadding ?? 15 ),

      margin: EdgeInsets.symmetric( vertical: verticalMargin ?? 0.00, horizontal: horizontalMargin ?? 0.0),

      decoration: BoxDecoration(

        color: SmartpayColors.smartpayLightAsh,

        borderRadius: BorderRadius.circular(8)

      ),

      child: child,

    );

  }

}