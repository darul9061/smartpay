import 'package:flutter/material.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';
import 'package:smartpay/utils/media_query.dart';

class SetupSuccessScreen extends StatefulWidget {

  static const routeName = "/setupSuccessScreen";

  const SetupSuccessScreen({Key? key}) : super(key: key);

  @override
  State<SetupSuccessScreen> createState() => _SetupSuccessScreenState();

}

class _SetupSuccessScreenState extends State<SetupSuccessScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SizedBox(

        child: Center(
          
          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              
              Image.asset(SmartpayIconsAssets.thumbStar, width: Common.Ws(0.2)) ,

              const SizedBox(height: 30),

              Text(

                "Congratulations, James",

                style: context.textSize.displaySmall?.copyWith(

                  color: SmartpayColors.smartpayPrimaryColor,

                  fontWeight: FontWeight.bold

                ),
                
              ),

              Text(

                "Congratulations, James",

                style: context.textSize.bodyLarge?.copyWith(

                  color: SmartpayColors.smartpayGray,

                  fontWeight: FontWeight.w300

                ),
                
              ),

              const SizedBox( height: 20 ),

              SmartpayButtons.plain(
                
                () { },

                title: "Get Started",
                
              )
              
            ]
              
          ),

        )

      ),

    );

  }

}