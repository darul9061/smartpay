import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/models/response_models/home_res_model.dart';
import 'package:smartpay/screens/login_screen/ui/login_screen.dart';
import 'package:smartpay/screens/setup_profile_screen/logic/setup_profile_screen_bloc.dart';
import 'package:smartpay/state_manager/central_bloc.dart';
import 'package:smartpay/utils/constants.dart';

class RootAccessScreen extends StatefulWidget {

  static const String routeName = "/rootAccessScreen";

  RootAccessScreen({Key? key}) : super(key: key);

  @override
  State<RootAccessScreen> createState() => _RootAccessScreenState();

}

class _RootAccessScreenState extends State<RootAccessScreen> {

  int currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);
  HomeResModel? homeData;

  @override
  void initState() {

    super.initState();

    CentralBLoc centralBLoc = context.read<CentralBLoc>();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {


      var h = await centralBLoc.repo.getDashboadIndex();

      setState(() {
        

        homeData = h;

      });
      

    });

  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      
      
      padding: EdgeInsets.symmetric(horizontal: 20),
      
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          
          Text(

            homeData?.data?.secret ?? ""

          ),

          SizedBox(height: 20),


          SmartpayButtons.plain(

            () {

              SmartpaySharedPreferences.clearUserInfo();

              Navigator.pushReplacementNamed(context, LoginScreen.routeName);

            },
            
            title: "Logout"

          ),

        ]

      )

    );

  }

}