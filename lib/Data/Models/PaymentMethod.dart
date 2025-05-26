import 'package:flutter/cupertino.dart';

class PaymentMethod {
  final String name;
  final IconData icon;
  final String id;

  PaymentMethod({required this.id, required this.name, required this.icon});
}