import 'dart:convert';
import 'dart:io';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:hyperpay_plugin/flutter_hyperpay.dart';
import 'package:hyperpay_plugin/model/custom_ui.dart';
import 'package:hyperpay_plugin/model/custom_ui_stc.dart';
import 'package:hyperpay_plugin/model/ready_ui.dart';
import 'package:http/http.dart' as http;

class PaymentScreen2 extends StatefulWidget {
  const PaymentScreen2({super.key});

  @override
  State<PaymentScreen2> createState() => _PaymentScreen2State();
}

class _PaymentScreen2State extends State<PaymentScreen2> {
  late FlutterHyperPay flutterHyperPay;
  String _statusMessage = "";

  @override
  void initState() {
    super.initState();
    flutterHyperPay = FlutterHyperPay(
      shopperResultUrl: InAppPaymentSetting.shopperResultUrl,
      paymentMode: PaymentMode.test, // test | live
      lang: InAppPaymentSetting.getLang(),
    );
  }

  Future<String?> _getCheckoutId() async {
    final url =
    Uri.parse('https://dev.hyperpay.com/hyperpay-demo/getcheckoutid.php');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final checkoutId = json.decode(response.body)['id'].toString();
      dev.log(checkoutId, name: "checkoutId");
      return checkoutId;
    } else {
      dev.log(response.body.toString(), name: "STATUS CODE ERROR");
      return null;
    }
  }

  Future<void> _payWithReadyUI() async {
    final checkoutId = "5056AD0F4072A534909F748CE476660A.uat01-vm-tx04";

    final paymentResult = await flutterHyperPay.readyUICards(
      readyUI: ReadyUI(
        brandsName: ["VISA", "MASTER", "MADA", "STC_PAY", "APPLEPAY"],
        checkoutId: checkoutId,
        merchantIdApplePayIOS: InAppPaymentSetting.merchantId,
        countryCodeApplePayIOS: InAppPaymentSetting.countryCode,
        companyNameApplePayIOS: "Test Co",
        themColorHexIOS: "#000000",
        setStorePaymentDetailsMode: true,
      ),
    );

    _handleResult(paymentResult);
  }

  Future<void> _payWithCustomUI() async {
    final checkoutId = "5056AD0F4072A534909F748CE476660A.uat01-vm-tx04";

    final paymentResult = await flutterHyperPay.customUICards(
      customUI: CustomUI(
        brandName: "VISA",
        checkoutId: checkoutId,
        cardNumber: "4111111111111111", // test card
        holderName: "Test User",
        month: "01",
        year: "2025",
        cvv: "123",
        enabledTokenization: false,
      ),
    );

    _handleResult(paymentResult);
  }

  Future<void> _payWithSTCPay() async {
    final checkoutId = "5056AD0F4072A534909F748CE476660A.uat01-vm-tx04";

    final paymentResult = await flutterHyperPay.customUISTC(
      customUISTC: CustomUISTC(
        checkoutId: checkoutId,
        phoneNumber: "0588987147", // test phone
      ),
    );

    _handleResult(paymentResult);
  }

  void _handleResult(PaymentResultData result) {
    print("sadfsafsadf ${result.paymentResult.name}");
    if (result.paymentResult == PaymentResult.success ||
        result.paymentResult == PaymentResult.sync) {
      setState(() => _statusMessage = "✅ Payment Success");
      // ⚠️ لازم تبعت transactionId لسيرفرك للتحقق من العملية
    } else if (result.paymentResult == PaymentResult.error) {
      setState(() => _statusMessage = "❌ Payment Failed");
    } else {
      setState(() => _statusMessage = "⚠️ Payment Canceled/Unknown");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("HyperPay Payment")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _payWithReadyUI,
              child: const Text("Pay with Ready UI"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _payWithCustomUI,
              child: const Text("Pay with Custom UI"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _payWithSTCPay,
              child: const Text("Pay with STC Pay"),
            ),
            const SizedBox(height: 30),
            Text(
              _statusMessage,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class InAppPaymentSetting {
  static const String shopperResultUrl = "com.testpayment.payment";
  static const String merchantId = "MerchantId";
  static const String countryCode = "SA";

  static String getLang() {
    if (Platform.isIOS) {
      return "en"; // or "ar"
    } else {
      return "en_US"; // or "ar_AR"
    }
  }
}
