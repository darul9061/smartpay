import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';

class SmartpayButtons {
  
  static Widget plain(
    void Function()? action,
    {
      String? title,
      Widget? customView,
      Color? fillColor,
      Color? titleColor
    }
  ){

    assert( 

      (title != null && customView == null) || 
      (customView != null && title == null),

      "Either title or customView must be filled"
    );

    return SizedBox(

      width: double.maxFinite,

      height: defaultTargetPlatform == TargetPlatform.android?  48 : 52,

      child: TextButton(

        style: TextButton.styleFrom(

          foregroundColor: Colors.transparent,

          backgroundColor: fillColor ?? SmartpayColors.smartpayPrimaryColor,

          shape: const RoundedRectangleBorder(

            borderRadius: BorderRadius.all( Radius.circular(7) )

          )

        ),

        onPressed: action,

        child: customView != null ?

        Center(

          child: customView,

        )
        
        :

        Text(

          title!,

          style: Theme.of( Common.navigatorKey.currentContext! ).textTheme.bodyMedium?.copyWith(

            color: titleColor ?? Colors.white,

            fontWeight: FontWeight.w500,

          )

        ),

      ),

    );

  }



  
  static Widget skeleton(
    void Function()? action,
    {
      String? title,
      double? topMargin,
      double? bottomMargin,
      Widget? customView,
      Color? borderColor,
      Color? titleColor
    }
  ){

    assert( 

      (title != null && customView == null) || 
      (customView != null && title == null),

      "Either title or customView must be filled"
    );

    return Container(

      margin: EdgeInsets.only( top: topMargin ?? 0, bottom: bottomMargin ?? 0),

      width: double.maxFinite,

      height: defaultTargetPlatform == TargetPlatform.android?  48 : 52,

      child: TextButton(

        style: TextButton.styleFrom(

          foregroundColor: titleColor ?? SmartpayColors.smartpayPrimaryColor,

          backgroundColor: Colors.transparent,

          shape: RoundedRectangleBorder(

            side: BorderSide(color: borderColor ?? SmartpayColors.smartpayPrimaryColor),

            borderRadius: BorderRadius.all( Radius.circular(7) )
            
          ),

        ),

        onPressed: action,

        child: customView != null ?

        Center(

          child: customView,

        )
        
        :

        Text(

          title!,

          maxLines: 1,

          overflow: TextOverflow.ellipsis,

          style: Theme.of( Common.navigatorKey.currentContext! ).textTheme.bodyMedium?.copyWith(

            color: titleColor ?? SmartpayColors.smartpayPrimaryColor,

            fontWeight: FontWeight.w500,

          )

        ),

      ),

    );
  }
}