// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// import '../Widgets/CustomAppBar.dart';
//
// class PaymentScreen extends StatefulWidget {
//   final String paymentLink;
//
//   PaymentScreen({required this.paymentLink});
//
//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }
//
// class _PaymentScreenState extends State<PaymentScreen> {
//   final WebViewController _webViewController = WebViewController();
//   WebViewController? controller;
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((callback) {
//       controller = WebViewController()
//         ..setJavaScriptMode(JavaScriptMode.unrestricted)
//         ..setNavigationDelegate(
//           NavigationDelegate(
//             onProgress: (int progress) {
//               // Update loading bar.
//             },
//             onPageStarted: (String url) {},
//             onPageFinished: (String url) {},
//             onHttpError: (HttpResponseError error) {},
//             onWebResourceError: (WebResourceError error) {},
//             onNavigationRequest: (NavigationRequest request) {
//               if (request.url.startsWith('https://www.youtube.com/')) {
//                 return NavigationDecision.prevent;
//               }
//               return NavigationDecision.navigate;
//             },
//           ),
//         )
//         ..loadRequest(Uri.parse(widget.paymentLink??""));
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         appContext: context,
//         title: "Payment",
//         navigated: true,
//         isCenter: false,
//       ),
//       body: Column(
//         children: [
//           Text(
//             'Payment Link:',
//             style: TextStyle(fontSize: 16),
//           ),
//           Text(
//             widget.paymentLink,
//             style: TextStyle(fontSize: 16),
//           ),
//           Expanded(
//             child: WebViewWidget(controller: controller),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _webViewController.dispose();
//     super.dispose();
//   }
// }