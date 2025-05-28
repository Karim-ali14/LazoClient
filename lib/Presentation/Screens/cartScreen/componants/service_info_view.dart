import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Constants/Assets.dart';
import '../../../../../Data/Network/lib/api.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Localization/Keys.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/CircleImage.dart';

typedef OnItemClick = Function(int);

class ServiceInfoView extends StatefulWidget {
  final ServiceShowData? item;
  final String? selectedServicesListItemsNames;
  const ServiceInfoView(
      {super.key, this.item, this.selectedServicesListItemsNames});

  @override
  State<ServiceInfoView> createState() => _ServiceInfoViewState();
}

class _ServiceInfoViewState extends State<ServiceInfoView> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item?.provider?.name ?? "",
                style:
                    AppTheme.styleWithTextBlack2AdelleSansExtendedFonts14w400,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 74,
                    width: 74,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.white),
                    child: ImageView(
                      width: 87.w,
                      height: 85.h,
                      initialImg: widget.item?.imagePath,
                      placeHolder: placeholder,
                    ),
                  ),
                  const SizedBox(
                    width: defaultPaddingHorizontal,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 160,
                        child: Row(
                          children: [
                            Text(
                              widget.item?.name ?? "",
                              style: AppTheme
                                  .styleWithTextBlackAdelleSansExtendedFonts16w500,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                              height: 5,
                            ),
                      widget.selectedServicesListItemsNames?.isNotEmpty == true && widget.selectedServicesListItemsNames != "null"
                          ? SizedBox(
                              width: MediaQuery.of(context).size.width - 160,
                              child: Text(
                                "${widget.selectedServicesListItemsNames}",
                                style: AppTheme
                                    .styleWithTextAppGrey7AdelleSansExtendedFonts10w400,
                              ),
                            )
                          : SizedBox(),
                      widget.selectedServicesListItemsNames?.isNotEmpty == true && widget.selectedServicesListItemsNames != "null"
                          ? const SizedBox(
                              height: 5,
                            )
                          : const SizedBox(),
                      Row(
                        children: [
                          Text(
                            "${context.tr(sarKey)} ${(widget.item?.priceAfterDiscount ?? 0) * (1)}",
                            style: AppTheme
                                .styleWithTextRedAdelleSansExtendedFonts16w500,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          // if ((widget.item?.p ?? 0) >
                          //     (widget.item?.totalPriceAfterDiscount ?? 0))
                          //   Text(
                          //     "${context.tr(sarKey)} ${(widget.item?.totalPriceBeforeDiscount ?? 0) * (widget.item?.quantity ?? 1)}",
                          //     style: AppTheme
                          //         .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                          //         .copyWith(
                          //             height: 1.2,
                          //             decoration: TextDecoration.lineThrough),
                          //   )
                          // else if (widget.item?.service != null &&
                          //     (widget.item?.service?.price ?? 0) >
                          //         (widget.item?.service?.priceAfterDiscount ??
                          //             0))
                          //   Text(
                          //       "${context.tr(sarKey)} ${widget.item?.product != null ? widget.item?.product?.price : widget.item?.service?.price}",
                          //       style: AppTheme
                          //           .styleWithTextAppGrey7AdelleSansExtendedFonts14w400
                          //           .copyWith(
                          //               height: 1.2,
                          //               decoration:
                          //                   TextDecoration.lineThrough))
                        ],
                      ),
                      // SizedBox(
                      //   height: 7,
                      // ),
                      // SizedBox(
                      //   width: MediaQuery.of(context).size.width - 160,
                      //   child: Row(
                      //     children: [
                      //       widget.item?.provider != null
                      //           ? Text(
                      //               context.tr(soldByKey),
                      //               style: AppTheme
                      //                   .styleWithTextAppGrey7AdelleSansExtendedFonts10w700,
                      //             )
                      //           : SizedBox(),
                      //       SizedBox(
                      //         width: 5,
                      //       ),
                      //       widget.item?.provider != null
                      //           ? Text(
                      //               "${widget.item?.provider?.name}",
                      //               style: AppTheme
                      //                   .styleWithTextBlackAdelleSansExtendedFonts10w700,
                      //             )
                      //           : const SizedBox(),
                      //       const Spacer(),
                      //       widget.item?.statusId == 11
                      //           ? Row(
                      //               children: [
                      //                 Container(
                      //                   width: 5,
                      //                   height: 5,
                      //                   decoration: const BoxDecoration(
                      //                       color: AppTheme.mainAppColor,
                      //                       shape: BoxShape.circle),
                      //                 ),
                      //                 SizedBox(
                      //                   width: 5,
                      //                 ),
                      //                 Text(
                      //                   context.tr(cancelledKey),
                      //                   style: AppTheme
                      //                       .styleWithTextMainAppColorAdelleSansExtendedFonts10w400,
                      //                 )
                      //               ],
                      //             )
                      //           : const SizedBox()
                      //     ],
                      //   ),
                      // )
                    ],
                  )
                ],
              ),
            ],
          )),
    );
  }
}
