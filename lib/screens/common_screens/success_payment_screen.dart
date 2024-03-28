import 'package:flutter/material.dart';
import 'package:smartpay/components/card.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

class SuccessPaymentScreen extends StatelessWidget {

  final Widget? child;

  final String? header;

  final Widget? headerIcon;

  final Widget? background;

  const SuccessPaymentScreen({this.child, this.header, this.headerIcon, this.background, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(

        children: [

          background == null ? Image.asset(

              SmartpayImagesAssets.crumbs,

              repeat: ImageRepeat.repeat,

          )
          
          :
          
          background!,

          Center(

            child: Padding(

              padding: EdgeInsets.symmetric( horizontal: 20 ),
            
              child: IntrinsicHeight(
            
                child: SmartpayCard.simpleCard(
                
                  context,
                  
                  child:  Column(

                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [

                      const SizedBox(

                        height: 8,

                      ),

                      headerIcon ?? CircleAvatar(

                        radius: Common.Ws(0.1),

                        backgroundColor: SmartpayColors.success,

                        child: Image.asset(
                          
                          SmartpayIconsAssets.thumbsUp

                        ),

                      ),

                      const SizedBox(

                        height: 20,

                      ),

                      Text(
                        
                        header ?? SmartpayTextStrings.paymentSuccessful,

                        textAlign: TextAlign.center,

                        style: context.textSize.titleLarge?.copyWith(

                          color: Colors.black,

                          fontWeight: FontWeight.w600

                        ),

                      ),

                      const SizedBox(

                        height: 20,

                      ),


                      // PASSED SUCCESS WIDGET
                      child ?? const SizedBox(),


                      const SizedBox(

                        height: 10,

                      ),



                    ],

                  )
                  
                )

              )

            )

          )

        ],

      ),

    );

  }

}