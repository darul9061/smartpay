import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/screens/login_screen/ui/login_screen.dart';
import 'package:smartpay/screens/signup_screen/ui/signup_screen.dart';
import 'package:smartpay/screens/welcome_screen/swipe_views/fast_transaction_swipe_view.dart';
import 'package:smartpay/screens/welcome_screen/swipe_views/finance_app_swipe_view.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

class WelcomeScreen extends StatefulWidget {

  static String routeName = "/welcome";

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();

}

class _WelcomeScreenState extends State<WelcomeScreen> {

  var selectedpage = 0;

  final List<String> t = ["sf", "sf"];

  @override
  Widget build(BuildContext context) {

    return PopScope(
      
      canPop: false,
      
      child: Scaffold(

        backgroundColor: Colors.white,

        body: SafeArea(

          child: SingleChildScrollView(

            child: Container(

              // padding: EdgeInsets.symmetric(horizontal: Common.Ws(0.09)),

              // color: Colors.white,

              child: Column(
                
                children: [

                  Padding(
                    
                    padding: EdgeInsets.fromLTRB( Common.Ws(0.02), Common.Hs(0.037), Common.Ws(0.02) , Common.Hs(0.09)),

                    child: Row(

                      children: [

                        const Spacer(),

                        TextButton(
                          
                          onPressed: () {

                            Navigator.pushNamed(context, SignUpScreen.routeName);
                          
                          },
                          
                          child: Text(

                            "Skip",

                            style: context.textSize.bodyLarge?.copyWith(

                              fontWeight: FontWeight.bold,

                              fontSize: (context.textSize.bodyLarge?.fontSize?? 0.0) + 1,

                              color: SmartpayColors.smartpayGreen

                            ),

                          )
                          
                        ),

                      ],

                    )
                    
                  ),

                  // SWIPEABLE VIEWS
                  SizedBox(

                    width: Common.Ws(1),

                    height: Common.Hs(0.59),
                    
                    child: PageView(

                      onPageChanged: (value) => setState(() {
                        selectedpage = value;
                      }),

                      children: [

                        const FinanceAppSwipView(),

                        const FastTransactionSwipeView()

                      ],

                    )
                    
                  ),

                  // SWIPE INDICATOR
                  IntrinsicWidth(
                    
                    child: Container(

                      margin: EdgeInsets.only(bottom: Common.Hs(0.04)),

                      clipBehavior: Clip.antiAlias,

                      decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(100)

                      ),

                      child: Row(

                        children: [

                          ...(

                            t.asMap().entries.map((e) => AnimatedContainer(

                              width: selectedpage == e.key ? Common.Ws(0.1) : 7,

                              height: 7,

                              margin: e.key == 0? EdgeInsets.zero : const EdgeInsets.only(left: 3),
                              
                              duration: const Duration(milliseconds: 500),

                              decoration: BoxDecoration(

                                color: selectedpage == e.key ? SmartpayColors.smartpayPrimaryColor : SmartpayColors.smartpayLightAsh,

                                borderRadius: BorderRadius.circular(100)

                              ),
                              

                              
                            )
                            
                            ).toList()

                          )

                        ],
                        
                      ) 

                    )
                  
                  ),

                  // GET STARTED BUTTON
                  Padding(

                    padding: EdgeInsets.symmetric(horizontal: Common.Ws(0.14)),
                    
                    child: SmartpayButtons.plain(

                      () {

                        Navigator.pushNamed(context, SignUpScreen.routeName);
                      
                      },

                      title: "Get Started"

                    )
                    
                  ),

                ]

              )

            ),

          )

        )

      )

    );

  }
  
}
