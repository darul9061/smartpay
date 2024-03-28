import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartpay/state_manager/central_bloc.dart';

class RootAccessScreen extends StatefulWidget {

  static const String routeName = "/rootAccessScreen";

  RootAccessScreen({Key? key}) : super(key: key);

  @override
  State<RootAccessScreen> createState() => _RootAccessScreenState();

}

class _RootAccessScreenState extends State<RootAccessScreen> {

  int currentIndex = 0;

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {

    super.initState();

    CentralBLoc centralBLoc = context.read<CentralBLoc>();

  }

  @override
  Widget build(BuildContext context) {

    return Center(

      child: Text("HomePage")

    );

  }

}