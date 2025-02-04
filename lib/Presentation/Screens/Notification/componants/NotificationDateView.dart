import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../Theme/AppTheme.dart';

class NotificationDateView extends StatelessWidget {
  final String date;
  const NotificationDateView({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w400,
        ),
        SizedBox(
          width: 14,
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Divider(
              thickness: 1,
              height: 1,
              color: AppTheme.appGrey11,
            ),
          ),
        )
      ],
    );
  }
}
