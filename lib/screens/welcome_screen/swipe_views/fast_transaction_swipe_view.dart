import 'package:flutter/material.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

class FastTransactionSwipeView extends StatefulWidget {

  const FastTransactionSwipeView({Key? key}) : super(key: key);


  @override
  State<FastTransactionSwipeView> createState() => _FastTransactionSwipeViewState();

}

class _FastTransactionSwipeViewState extends State<FastTransactionSwipeView> {

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: EdgeInsets.symmetric(horizontal: Common.Ws(0.06)),

      child: Stack(

        children: [

          Container(

            width: Common.Ws(1),

            // color: Colors.red,
            
            child: Image.asset( 
              
              SmartpayImagesAssets.phoneTransactionIllustration,

              height: Common.Hs(0.52),
              
            ),


            
          ),


          // TITLE AND DESCRIPTION
          LayoutBuilder(
            
            builder: (context, constraints){

              return IntrinsicHeight(
            
                child: Column(

                  children: [

                    SizedBox(height: constraints.maxHeight * 0.49), // Common.Hs(0.15),),
                    
                    Container(

                      // height: Common.Hs(0.42),

                      width: double.maxFinite,

                      padding: EdgeInsets.symmetric(horizontal: Common.Ws(0.08)),

                      decoration: BoxDecoration(

                        gradient: LinearGradient(

                          begin: Alignment.topCenter,

                          end: Alignment.bottomCenter,
                          
                          colors: [

                            Colors.white.withOpacity(0),
                            
                            Colors.white,

                          ],

                          stops: [

                            -0.29,
                            0.19

                          ]
                          
                        )

                      ),

                      child: IntrinsicHeight(
                        
                        
                        child: Column(

                          children: [

                            SizedBox( height: constraints.maxHeight * 0.18, ),

                            Text(

                              "Finance app the safest and most trusted",

                              textAlign: TextAlign.center,

                              style: context.textSize.titleLarge?.copyWith(

                                color: SmartpayColors.smartpayPrimaryColor,

                                fontSize: (context.textSize.titleLarge?.fontSize ?? 0.0) + 3,

                                fontWeight: FontWeight.w800

                              ),

                            ),

                            SizedBox(height: Common.Hs(0.015),),

                            Text(

                              "Your finance work starts here. Our here to help you track and deal with speeding up your transactions.",

                              textAlign: TextAlign.center,

                              maxLines: 3,

                              style: context.textSize.bodyLarge?.copyWith(

                                color: SmartpayColors.smartpayPrimaryColor,

                              ),

                            )

                          ],

                        )

                      ),

                    )

                  ]

                )
              
              );
              
            }
            
          ),
          // THE GRAPH
          Container(

            margin: EdgeInsets.only(top: Common.Hs(0.1), left: Common.Ws(0.09), right: Common.Ws(0.09)),

            width: Common.Ws(1),

            color: Colors.yellow.withOpacity(0.5),
            
            child: Image.asset( 
              
              SmartpayImagesAssets.transactionIllustration,

              height: Common.Hs(0.25),
              
            )

          ),

        ],

      ),

    );

  }

}