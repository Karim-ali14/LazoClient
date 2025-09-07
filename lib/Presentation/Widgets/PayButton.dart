// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:hyperpay_plugin/flutter_hyperpay.dart';
// import 'package:hyperpay_plugin/model/ready_ui.dart';
//
// class PayButton extends StatefulWidget {
//   const PayButton({super.key});
//   @override
//   State<PayButton> createState() => _PayButtonState();
// }
//
// class _PayButtonState extends State<PayButton> {
//   late FlutterHyperPay hyperPay;
//
//   @override
//   void initState() {
//     super.initState();
//     hyperPay = FlutterHyperPay(
//       shopperResultUrl: "com.lazo.payment", // لازم يطابق الـ scheme في Android/iOS
//       paymentMode: PaymentMode.test,     // بدّله لـ live عند الإطلاق
//       lang: "en_US",
//     );
//   }
//
//   Future<String> _createCheckout(String brand) async {
//     final url = Uri.parse('https://dev.hyperpay.com/hyperpay-demo/getcheckoutid.php');
//
//     final resp = await http.post(
//       url,
//       headers: {"Content-Type": "application/json"},
//       body: jsonEncode({
//         "amount": 100.00, "currency": "SAR", "brand": brand, "orderId": "ORD-123"
//       }),
//     );
//     final json = jsonDecode(resp.body);
//     return json["id"];
//   }
//
//   Future<void> _payReadyUI() async {
//     // مثال يدعم عدة براندز في واجهة موحدة:
//     final checkoutId = await _createCheckout("VISA"); // اعمل Checkout مناسب لكل براند فعليًا
//     final result = await hyperPay.readyUICards(
//       readyUI: ReadyUI(
//         brandsName: ["VISA", "MASTER", "MADA", "STC_PAY", "APPLEPAY"],
//         checkoutId: checkoutId,
//         // إعدادات Apple Pay iOS عند الحاجة...
//       ),
//     );
//
//     if (result.paymentResult == PaymentResult.success ||
//         result.paymentResult == PaymentResult.sync) {
//       // بعد الرجوع، اطلب حالة الدفع من سيرفرك
//       // result.resourcePath ممكن تستخدمه للسؤال النهائي من السيرفر
//       final status = await http.get(
//         Uri.parse("https://YOUR_SERVER/api/payment-status")
//             .replace(queryParameters: {
//           "resourcePath": res ?? "",
//           "brand": result.brand ?? "VISA",
//         }),
//       );
//       // افحص result.code في الرد
//       // success if code matches ^(000\.000\.|000\.100\.1|000\.[36])
//     } else {
//       // فشل/إلغاء من المستخدم
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: _payReadyUI,
//       child: const Text("Pay with HyperPay"),
//     );
//   }
// }
