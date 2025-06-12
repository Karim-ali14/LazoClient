import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../Data/Models/PaymentMethod.dart';
import '../../../Widgets/TextWithoutPadding.dart';

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
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 16,vertical: 8),
      margin: const EdgeInsetsDirectional.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: widget.methods.asMap().entries.map((entry) {
          final method = entry.value;
          final isLast = entry.key == widget.methods.length - 1;

          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero, // Remove extra padding
                leading: Radio<String>(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
                title: TextWithoutPadding(method.name),
                trailing: Icon(method.icon),
                onTap: () {
                  setState(() {
                    selectedId = method.id;
                  });
                  widget.onSelected(method.id);
                },
              ),
              if (!isLast)
                Divider(
                  color: Colors.grey[300], // Customize the color and thickness
                  thickness: 1,
                ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
