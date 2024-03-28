import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smartpay/components/buttons.dart';
import 'package:smartpay/utils/constants.dart';

class SmartpayBottomNavsBar {

  static Widget plain( int currentIndex, { void Function(int)? onTap } ){

    return Container(

      padding: EdgeInsets.symmetric( vertical: 5 ),

      decoration: BoxDecoration(

        color: Colors.white,

        border: Border(

          top: BorderSide(

            width: 1,

            color: SmartpayColors.smartpayBorderColor

          )

        )

      ),

      child: BottomNavigationBar(

        iconSize: defaultTargetPlatform == TargetPlatform.android ? 10 : 24,

        items: [

          // HOME NAVE
          BottomNavigationBarItem(

            icon: Image.asset(
              
              SmartpayIconsAssets.homeLight, 

              width: 20,
              
              color: SmartpayColors.smartpayGray
              
            ),

            activeIcon: Image.asset(
              
              SmartpayIconsAssets.homeLight, 
              
              color: SmartpayColors.smartpayPrimaryColor,

              width: 20,
              
            ),

            label: SmartpayTextStrings.home

          ),

          // SCHEDULE NAV
          BottomNavigationBarItem(

            icon: Image.asset(
              
              SmartpayIconsAssets.calendar, 

              width: 20,
              
              color: SmartpayColors.smartpayGray,
              
            ),

            activeIcon: Image.asset(
              
              SmartpayIconsAssets.calendar, 

              width: 20,
              
              color: SmartpayColors.smartpayPrimaryColor
              
            ),

            label: SmartpayTextStrings.appointments
          ),

          // MESSAGE NAV
          BottomNavigationBarItem(

            icon: Image.asset(
              
              SmartpayIconsAssets.messageCircleLight, 

              width: 20,
              
              color: SmartpayColors.smartpayGray
              
            ),

            activeIcon: Image.asset(
              
              SmartpayIconsAssets.messageCircleLight, 

              width: 20,
              
              color: SmartpayColors.smartpayPrimaryColor
              
            ),

            label: SmartpayTextStrings.chats
          ),

          // PROFILE NAV
          BottomNavigationBarItem(

            icon: Image.asset(
              
              SmartpayIconsAssets.user, 

              width: 20,
              
              color: SmartpayColors.smartpayGray
              
            ),

            activeIcon: Image.asset(
              
              SmartpayIconsAssets.user, 

              width: 20,
              
              color: SmartpayColors.smartpayPrimaryColor
              
            ),

            label: SmartpayTextStrings.profile

          ),

        ],

        type: BottomNavigationBarType.fixed,

        onTap: onTap,
          // setState(() {
          //   _currentIndex = index;
          //   _pageController.animateToPage(_currentIndex, duration: Duration(milliseconds: 500), curve: Curves.easeInOutCubic);
          // });
        
        currentIndex: currentIndex,
      )
      
    );

  }


  static Widget customBottomBar( {double? height, required Widget child } ){

    return Container(

      height: height ?? 100,

      padding: const EdgeInsets.symmetric( horizontal: 20 ),

      color: Colors.transparent,

      child: Center(

        child: child

      ),

    );

  }
  
}