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

      leading: Container(

        padding: const EdgeInsets.only(left: 13),

        color: Colors.transparent,

        child: InkWell(

          onTap: () => Navigator.pop(context),

          child: Align(

            alignment: Alignment.centerLeft,

            child: leadingWidget ?? const Icon(

              Icons.arrow_back_sharp

            )

          )

        ),

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



  static PreferredSize customBlueAppBarWithSearch(BuildContext context, TextEditingController inputController, String backButtonTitle, String hintText){
    
    return PreferredSize(

      preferredSize: const Size.fromHeight(155),

      child: SafeArea(
        
        child:  Container(

          padding: const EdgeInsets.symmetric( horizontal: 18, vertical: 22 ),

          color: SmartpayColors.smartpayPrimaryColor,

          child:  Column(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              TextButton.icon(

                style: TextButton.styleFrom(

                  minimumSize: Size.zero,

                  padding: EdgeInsets.zero

                ),
                
                onPressed: (){

                  Navigator.pop(context);

                },
                
                icon: Icon(

                      Icons.arrow_back_rounded,

                      color: Colors.white,

                    ),

                label: 

                  Text(
                    
                    backButtonTitle,

                    style: context.textSize.bodyLarge?.copyWith(

                      color: Colors.white,

                      fontWeight: FontWeight.bold

                    ),

                  ),
                    
              ),

              // Row(

              //   children: [

              //       Icon(

              //         Icons.arrow_back_rounded,

              //         color: Colors.white,

              //       ),

              //     SizedBox(
                    
              //       width: 12,
                    
              //     ),

              //     Text(
                    
              //       SmartpayTextStrings.findDoctors,

              //       style: context.textSize.bodyLarge?.copyWith(

              //         color: Colors.white,

              //         fontWeight: FontWeight.bold

              //       ),

              //     )

              //   ],

              // ),

              ClipRRect(

                borderRadius: BorderRadius.circular(10),

                child: Container(

                  height: 58,

                  padding: const EdgeInsets.symmetric( horizontal: 6),

                  color: Colors.white,

                  child: Row(

                    children: [

                      Padding(

                        padding: EdgeInsets.only(left: 8, right: 7),

                        child:  Icon(

                          Icons.search,

                          color: SmartpayColors.smartpayPrimaryColor,

                        )
                          
                      ),

                      Expanded(

                        child: TextField(

                          controller: inputController,

                          decoration: InputDecoration(

                            enabledBorder: InputBorder.none,

                            focusedBorder: InputBorder.none,

                            border: InputBorder.none,

                            hintText: hintText,

                            hintStyle: context.textSize.bodyMedium?.copyWith(

                              fontWeight: FontWeight.w400,

                              color: SmartpayColors.smartpayGray

                            )
                            
                          ),

                        )

                      ),

                      IconButton(
                        
                        onPressed: null, 
                        
                        icon: Image.asset(

                          SmartpayIconsAssets.filter,

                          width: 25,

                        )

                      )

                    ],

                  ),

                )

              )

            ],

          )

        )

      )


    );

  }
  
}