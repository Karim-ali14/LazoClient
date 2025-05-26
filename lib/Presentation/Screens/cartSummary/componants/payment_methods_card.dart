import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Data/Models/PaymentMethod.dart';

class PaymentMethodSelector extends StatefulWidget {
  final List<PaymentMethod> methods;
  final ValueChanged<String> onSelected;
  final String? initialSelectedId;

  const PaymentMethodSelector({
    super.key,
    required this.methods,
    required this.onSelected,
    this.initialSelectedId,
  });

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  String? selectedId;

  @override
  void initState() {
    super.initState();
    selectedId = widget.initialSelectedId ?? widget.methods.first.id;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(16),
      margin: const EdgeInsetsDirectional.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        children: widget.methods.map((method) {
          final isSelected = method.id == selectedId;

          return ListTile(
            leading: Radio<String>(
              value: method.id,
              groupValue: selectedId,
              onChanged: (value) {
                setState(() {
                  selectedId = value;
                });
                widget.onSelected(value!);
              },
              activeColor: Colors.red,
            ),
            title: Text(method.name),
            trailing: Icon(method.icon),
            onTap: () {
              setState(() {
                selectedId = method.id;
              });
              widget.onSelected(method.id);
            },
          );
        }).toList(),
      ),
    );
  }
}