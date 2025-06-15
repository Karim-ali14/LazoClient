import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/CircleImage.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../Data/Network/lib/api.dart';
import 'AppButton.dart';
import 'TextWithoutPadding.dart';

typedef OnSellerClickListener = Function(int);

class SellerItemCard extends StatefulWidget {
  final ProviderData? providerData;
  final int? width;
  final int? height;
  final OnSellerClickListener onSellerClickListener;
  const SellerItemCard(
      {super.key,
      required this.providerData,
      this.width,
      required this.onSellerClickListener, this.height});

  @override
  State<SellerItemCard> createState() => _SellerItemCardState();
}

class _SellerItemCardState extends State<SellerItemCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onSellerClickListener
            .call(widget.providerData?.id ?? 0);
      },
      child: Stack(children: [
        Container(
          width: widget.width?.toDouble() ?? double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton.replace(
                replacement: Container(
                  width: widget.width?.toDouble() ?? double.infinity,
                  height: widget.height?.toDouble(),
                  color: Colors.white,
                ),
                child: Container(
                  width: widget.width?.toDouble() ?? double.infinity,
                  height: widget.height?.toDouble(),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(children: [
                    ImageView(
                      width: widget.width?.toDouble() ?? double.infinity,
                      height: widget.height?.toDouble(),
                      initialImg: widget.providerData?.imagePath,
                      placeHolder: placeHolderForCardsSvg,
                    ),
                    Align(
                      alignment: AlignmentDirectional.bottomStart,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          padding: const EdgeInsetsDirectional.symmetric(horizontal: 5,vertical: 2),
                          decoration:  BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                            color: Colors.black.withOpacity(.5)
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextWithoutPadding(
                                widget.providerData?.overallRating?.toString() ??
                                    "",
                                style: AppTheme
                                    .styleWithTextWhiteAdelleSansExtendedFonts12w400,
                              ),
                              SizedBox(
                                width: 4,
                              ),
                              SVGIcons.smallStarIcon(size: 12),
                              SizedBox(width:
                              widget.providerData?.ratingsCount != null && widget.providerData?.ratingsCount != 0 ?5:0,),
                              widget.providerData?.ratingsCount != null && widget.providerData?.ratingsCount != 0 ?
                              TextWithoutPadding(
                                "(${widget.providerData?.ratingsCount?.toString()})" ??
                                    "",
                                style: AppTheme
                                    .styleWithTextWhiteAdelleSansExtendedFonts12w400,
                              ):const SizedBox(),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 7,
                    ),
                    Skeleton.replace(
                      replacement: Container(
                        width: 80,
                        height: 15,
                        color: Colors.white,
                      ),
                      child: Text(widget.providerData?.name ?? "",
                          style: AppTheme
                              .styleWithTextBlackColor2AdelleSansExtendedFonts14w400
                              .copyWith(overflow: TextOverflow.ellipsis),
                          maxLines: 1,
                          textAlign: TextAlign.center),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        widget.providerData?.isPromoted == 1
            ? Positioned(
                top: 10,
                left: (widget.width ?? MediaQuery.of(context).size.width) * 0.70,
                child: SVGIcons.localSVG(promotedSvg,width: 34,height: 34))
            : SizedBox(),
      ]),
    );
  }
}
