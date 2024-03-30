import 'package:flutter/material.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

class SmartpayAppbars {

  static PreferredSizeWidget plain(

    BuildContext context, 

    {
      double? elevation, 

      Widget? leadingWidget, 

      List<Widget>? trailingWidgets,

      bool isTransparent = false,

      double? leadingWidth,

      Color? shadowColor,

      Color? backgroundColor
    
    }

  ){

    return AppBar(

      shadowColor: shadowColor,

      automaticallyImplyLeading: leadingWidget != null? false : true,

      leading: Row( 
        
        children: [

          Padding(
            
            padding: const EdgeInsets.only(left: 20),
          
            child: InkWell(

              onTap: () => Navigator.pop(context),

              child: Container(

                width: 42,

                height: 42,

                decoration: BoxDecoration(

                  border: Border.all( width: 0.8, color: SmartpayColors.smartpayGray.withOpacity(0.2)),

                  borderRadius: BorderRadius.circular(13)

                ),

                child: const Center(

                  child: Icon(

                    Icons.chevron_left,

                    color: Colors.black

                  )

                ),

              )

            )

          )

        ]

      ),

      leadingWidth: leadingWidth ?? Common.Ws(0.33),

      actions: trailingWidgets,

      elevation: elevation,

      centerTitle: false,

      backgroundColor: isTransparent ? Colors.transparent : backgroundColor ?? Colors.white,

      bottom: !isTransparent ? PreferredSize(

        preferredSize: const Size(5, 5),

        child: Container(

          decoration: BoxDecoration(

            border: Border(

              bottom: BorderSide(

                width: 2,

                color: SmartpayColors.smartpayBorderColor

              )

            )

          ),

        ), 
        
      )
      
      :
      
      null,

    );

  }

  
}