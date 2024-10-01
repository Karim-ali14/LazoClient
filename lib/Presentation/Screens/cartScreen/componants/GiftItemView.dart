import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';

import '../../../Theme/AppTheme.dart';

class GiftItemView extends StatefulWidget {
  const GiftItemView({super.key});

  @override
  State<GiftItemView> createState() => _GiftItemViewState();
}

class _GiftItemViewState extends State<GiftItemView> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: 200,
        width: 146,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isSelected ? AppTheme.mainAppColor : AppTheme.appGrey6,
                width: 1)),
        child: Stack(children: [
          Column(
            children: [
              ImageView(
                width: double.infinity,
                height: 142,
                initialImg:
                    "https://fps.cdnpk.net/images/home/subhome-ai.webp?w=649&h=649",
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: 130,
                        child: Text(
                          "Box Macarons Gavasie...",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme
                              .styleWithTextGray7AdelleSansExtendedFonts12w400,
                        )),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "SAR 350",
                      style: AppTheme
                          .styleWithTextRedAdelleSansExtendedFonts16w500,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            width: 33,
            height: 30,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: Radio(
                  value: true,
                  groupValue: isSelected,
                  onChanged: (value) {
                    setState(() {
                      isSelected = !isSelected;
                    });
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}
