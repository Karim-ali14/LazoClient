import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Localization/Keys.dart';
import '../Widgets/CustomAppBar.dart';

class PaymentScreen extends StatefulWidget {
  final String paymentLink;

  PaymentScreen({required this.paymentLink});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: context.tr(paymentKey),
        navigated: true,
        isCenter: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setNavigationDelegate(
                NavigationDelegate(
                  onProgress: (int progress) {
                    print('WebView is loading (progress : $progress%)');
                  },
                  onPageStarted: (String url) {},
                  onPageFinished: (String url) {
                    Uri uri = Uri.parse(url);
                    String? paymentStatus = uri.queryParameters["respMessage"];
                    print("from finish order payment ${uri.queryParameters["respMessage"]} ${paymentStatus != null && paymentStatus == "Successful"}");

                    if (paymentStatus != null && paymentStatus == "Successful") {
                      context.pop(true);
                    }else if(paymentStatus != null && paymentStatus == "Rejected"){
                      context.pop(false);
                    }
                  },
                  onHttpError: (HttpResponseError error) {},
                  onWebResourceError: (WebResourceError error) {},
                  onNavigationRequest: (NavigationRequest request) {
                    if (request.url.startsWith('https://www.youtube.com/')) {
                      return NavigationDecision.prevent;
                    }
                    return NavigationDecision.navigate;
                  },
                ),
              )
              ..loadRequest(Uri.parse(widget.paymentLink??""))),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {

    super.dispose();
  }
}