import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:smartpay/components/appbar.dart';

class SmartpayInAppWebView extends StatefulWidget {

  static String routeName = "/smartpayInAppWebView";

  SmartpayInAppWebView({Key? key}) : super(key: key);

  @override
  State<SmartpayInAppWebView> createState() => _SmartpayInAppWebViewState();

}

class _SmartpayInAppWebViewState extends State<SmartpayInAppWebView> {

  final GlobalKey webViewKey = GlobalKey();

  bool isLoading = false;

  InAppWebViewController? webViewController;

  Uri? uri;

  @override
  void initState() {
    
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    uri = ModalRoute.of(context)?.settings.arguments as Uri;

    return Scaffold( 

      appBar: SmartpayAppbars.plain(context),
      
      body: SafeArea(

        child: InAppWebView(

          initialUrlRequest: URLRequest(url: WebUri(uri.toString())),

          onLoadStart: (controller, url) async { 

            setState(() {

              isLoading != isLoading;

            });

            await EasyLoading.show();

          },

          onLoadStop: (controller, url) async { 

            setState(() {

              isLoading != isLoading;

            });

            await EasyLoading.dismiss();

          },

        )

      )

    );

  }
}