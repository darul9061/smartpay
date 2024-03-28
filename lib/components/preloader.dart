


import 'package:flutter/material.dart';
import 'package:smartpay/utils/common.dart';
import 'package:smartpay/utils/constants.dart';

class SmartpayLoaderAnimationBuilder extends StatefulWidget {

  const SmartpayLoaderAnimationBuilder({super.key});

  @override
  State<SmartpayLoaderAnimationBuilder> createState() => _SmartpayLoaderAnimationBuilderState();

}

class _SmartpayLoaderAnimationBuilderState extends State<SmartpayLoaderAnimationBuilder> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(

    duration: const Duration(seconds: 1),

    vsync: this,

  )
  ..repeat(min: 0.8, reverse: true);

  @override
  void initState() {
    
    super.initState();

    _controller.addListener(() {
      
      // print(_controller.value);
      
    });

  }

  @override
  void dispose() {

    _controller.dispose();

    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

      animation: _controller,

      child: CircleAvatar(

        radius: Common.Ws(0.08),

        backgroundColor: SmartpayColors.smartpaySecondaryColor,

        child: Padding(

          padding: const EdgeInsets.all(12),

          child: Image.asset(SmartpayIconsAssets.loadingStethoscope, color: SmartpayColors.smartpayPrimaryColor,)

        ),

      ),

      builder: (BuildContext context, Widget? child) {

        return Transform.scale(

          scale: _controller.value, // 0.0 to 1.0

          child: child,

        );

      },

    );
  }
}